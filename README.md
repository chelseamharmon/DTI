# DTI
SB DTI Pipeline

# Preprocessing 

## Creating DTI folders and Converting dicoms to NIfti 

```.bash 
#use foreach n (SB002_fu2 SB018_fu2 SB019_fu2…) from line 3 of subjects 

cd /danl/SB/${n}/anatomical/PING_30DIR_LONGTR_4/

if (! -d DTI) then 
	mkdir DTI/

dcm2nii -o ./DTI -r N DICOM

for i in $(ls); do dcm2nii -p y -f y ${i}/*; done;


```

## Brain extraction – extract b0 create mask 

```.bash
fslroi *.nii.gz ${n}_b0_AP 0 1
bet ${n}_b0_AP ${n}_brain -m -f 0.3

#cannot run topup becuase only 1 b0 image 
```

## run eddy 

```.bash
#IF not running on cluster - I did not do this 
eddy --imain=${n}_dwi.nii.gz --mask=${n}_brain_mask.nii.gz --index=/danl/SB/DTI/index.txt --acqp=/danl/SB/DTI/acqparams.txt --bvec=${n}_bvecs --bvals=${n}_bvals /
--fwhm=0 --flm=quadratic --dont_peas --repol --out=${n}_eddy

#IF running on habanero 
for i in SB*; do sbatch eddy_opemp_batch.sh $n; done 

#This script rungs: eddy_openmp --imain=${n}_dwi.nii.gz --mask=${n}_brain_mask.nii.gz --index=/danl/SB/DTI/index.txt --acqp=/danl/SB/DTI/acqparams.txt --bvec=${n}_bvecs --bvals=${n}_bvals /
--fwhm=0 --flm=quadratic --dont_peas --repol --out=${n}_eddy
```

## Checking for motion 

```.R
Rscript /scripts/motion_assess/extractingRMS.R 
Rscript /scripts/motion_assess/extractingOutlierData.R 
Rscript /scripts/motion_assess/extractingVolTransRotData.R 
```

## Fitting tensors 

```.bash 

dtifit -k eddy_unwarped_images -m hifi_nodif_brain_mask -r bvecs -b bvals -o dti 

```

##check for motion 


## TBSS 
run on habanero 

```.bash

for n in *copy list of subjects from subjects line 8 #TBSS cross*; do sbatch 0.prepare_tbss_folder $n; done
#This script creates one folder with all _dti_FA.nii.gz files and renames them to order by group (COMP/PI)

cd /TBSS
sbatch 1.tbss_1_preproc 
#This script runs: tbss_1_preproc *nii.gz

sbatch 2.tbss_2_reg
#This script runs: tbss_2_reg -T

sbatch 3.tbss_3_postreg 
#This script runs: tbss_3_postreg -S

sbatch 4.tbss_4_prestats
#This script runs: tbss_4_prestats 0.2

 ```
 # For running with all subjects 
 ```.bash

for n in *copy list of subjects from subjects line 8 #TBSS Long*; do sbatch 0.prepare_tbss_folder $n; done
#This script creates one folder with all _dti_FA.nii.gz files and renames them to order by group (COMP/PI)

cp TBSS/ TBSS_long
sbatch 1.tbss_1_preproc_long 
#This script runs: tbss_1_preproc *nii.gz

sbatch 2.tbss_2_reg_long
#This script runs: tbss_2_reg -T

sbatch 3.tbss_3_postreg_long 
#This script runs: tbss_3_postreg -S

sbatch 4.tbss_4_prestats_long
#This script runs: tbss_4_prestats 0.2

 ```

## For running statistics on MD, L1, L2, L3 

```.bash
#Moving folders and renaming 
mkdir /rigel/psych/users/cmh2228/SB/TBSS/MD
for n in *copy list of subjects from subjects line 8 #TBSS cross*; do sbatch 0.prepare_tbss_folders $n; done
#This script moves subjects _dti_MD.nii.gz files and renames them _dti_FA.nii.gz for running tbss_non_FA MD
#Running tbss 
sbatch 5.tbss_non_FA



#for longidutinal set 
for n in *copy list of subjects from subjects line 8 #TBSS cross*; do sbatch 0.prepare_tbss_folders_nonFA_long $n; done
sbatch 5.tbss_non_FA_long
```


## run bedpostx 

```.bash
for n in SB*; do sbatch 0.prepare_bedpostx_folders $n; done 

for n in SB*; do sbatch 1.bedpostx $n; done
#This script runs: bedpostx ${n}
```

## subject registration
```.bash
for n in SB*; do sbatch 3.registration $n; done 

```

## run probpostx 
Using amydala as a seed 
```.bash
for n in SB*; do sbatch 4.probtrackxAmygSeed.sh $n; done 

```

## autoptx
Run autoptx on habanero becuase takes a long time. Then copy to lux to run visualization and pull values. 

```.bash
#HABANERO
#prepare autoptx folder 
for n in SB*; do sbatch 0.prepare_autoptx_folders $n ; done

cd /rigel/psych/users/cmh2228/SB/DTI/autoptx
for n in SB*; do sbatch autoptx1.sh $n; done 

#This script runs: autoPtx_1_preproc ${n} and then: autoPtx_2_launchTractography 

#done for "ar_l", "ar_r", "atr_l", "atr_r", "cgc_l", "cgc_r", "cgh_l", "cgh_r", "ifo_l", "ifo_r", "ilf_l", "ilf_r", "ptr_l", "ptr_r", "slf_l", "slf_r", "str_r", "str_l", "unc_l", "unc_r"
#Copy back to lux 

#For everything:
cd /rigel/psych/users/cmh2228/SB/DTI
scp -r autoptx/* charmon@lux.psych.columbia.edu:/danl/SB/DTT/

#For just indiviudal tracts 
cd /rigel/psych/users/cmh2228/DTI/autoptx
for n in SB*; do scp -r $n/str_? charmon@lux.psych.columbia.edu:/danl/SB/DTI/autoptx/tracts/$n


#LUX
#Creates .nii.gz using tractsNorm.nii.gz file for each tract in autoptx/visualise/ folder 
#Use edited autoPtx_prepareForDisplay file which can be found in this repository under /scripts/autoptx/
cd /danl/SB/DTI/autoptx
autoPtx_prepareForDisplay 0.005
#This uses structureList from /usr/share/fs/5.0/bin/autoPtx/structureList and subjectList from /danl/SB/DTI/autoptx/preproc/subjectList

#Extract all values for FA MD AD and RD from tracts created by autoptx 
./danl/SB/DTI/scripts/autoptx/1.1extractAllValues.sh

#Make a spreadsheet of all subjects values - uses subjectList.txt and tractList.txt from autoptx/preproc/ folder 
Rscript 1.2extractingAllValues.R 

```

## Assessing motion outliers 


```.R
#Total Motion Index

#Average volume by volume translation and rotation 
Rscript /danl/SB/DTI/scripts/motion_assess/extractingVolTransRotData.R

#Number of outlier slices 
Rscript /danl/SB/DTI/scripts/motion_assess/extractingOutlierData.R

#Severity of outlier slices 
Rscript /danl/SB/DTI/scripts/motion_assess/extractingOutlierSeverity.R


```

# Analyses

## Analyses Jan.2018  TBSS Cluster Analyses - 
find in folder TBSS_cross_no64_motionExcluded.Jan2018/
All TBSS redone Jan 2019 using same pipeline - find on Habanero TBSS/ 

# Making covariates file 
Using list of subject IDs - merge with full data set in this script 
```{r}
rstudio makingCovariatesFileLong01.28.2019
```

# Creating glm files to run 

Use no motion data - excluded visually spreadsheet: TBSS_cross_no64_motionExcluded.Jan2018
1. remove FU timepoints from list: list=fu_rm_list
2. rerun TBSS prestats (on habanero)  

```.bash
tbss_3_postreg #(merges into single images) 
tbss_4_prestats #(makes skeleton mask) 
```

```.bash
on lux: 

2 group design 
EV1: Code 0 for COMP & 1 for PI (GROUP.PI) 
EV2: Code 1 for COMP & 0 for PI (GROUP.COMP)
EV3: Age in Mos (mean centered) 
EV4: Code gender male 1 
```


```.bash
Glm &
```
Higher Level/non-timeseries design
#inputs = 133

wizard 
```.bash
	2 groups unpaired 
	#of subjects in first group = 74
	process 
	paste 
EVs
Number of main EVs 4 
Contrasts & F-tests
contrasts 4 
*note these Comp & PI may be flipped in TBSS_cross_no64_motionExcluded_Jan2018*

		EV1	EV2 	EV3	EV4
		COMP	PI	Age_mc	Gender	
C1 COMP > PI 	1	-1	0	0	
C2 PI > COMP	-1	1	0	0	
C3 PosAgeEff	0	0	1	0	
C4 NegAgeEff	0	0	-1	0

Paste - paste in covariates you made (use contol y - bc it is using matlab) 
Save *rename /TBSS_cross_01.29.2019/cross_ageEffect

# for interaction 
EVs
Number of main EVs 5
Contrasts & F-tests
constrasts 2 
		EV1	EV2 	EV3	EV4	EV5
C1  CompXage 	0	0	1	-1	0
C2  PIXage	0	0	-1	1	0

```
Paste - paste in covariates you made (use contol y - bc it is using matlab) 
Save *rename /TBSS_cross_01.29.2019/cross_ageInteraction


Run GLM model 
```.bash
randomise -i all_FA_skeletonised.nii.gz -o tbss_AgeEffect -m mean_FA_skeleton_mask.nii.gz -d cross_ageEffect.mat -t cross_ageEffect.com --T2 -c 3.1 -n 5000  #changed output to be tbss_FA_AgeEffect on habanero rerun - see script 6.randomise.cross 

#also do this for MD, AD, RD e.g.
randomise -i all_MD_skeletonised.nii.gz -o tbss_MD_geEffect -m mean_MD_skeleton_mask.nii.gz -d cross_ageEffect.mat -t cross_ageEffect.com --T2 -c 3.1 -n 5000

#Use --T2 for TBSS data to get TFCE results 
#Can start with 500 instead of 5000 to see if it works correctly
#DO this for all contrasts e.g. 
randomise -i all_FA_skeleton_mask -d cross_ageInteraction.mat -t cross_ageInteraction.com --T2 -c 3.1 -n 5000
```
Extracting results 
```.bash
fslmaths tbss_ageEffects_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_results_mask1
fslmeants -i all_FA_skeletonised.nii.gz -m significant_results_mask1.nii.g -o avg_tstat1.txt
tbss_fill tbss_ageEffect_clustere_corrp_tstat1.nii.gz 0.949 mean_FA tbss_ageEffect_clustere_corrp_tstat1_filled #For visualizing ONLY (min/max display range should be set to .95/1.0 to show p<0.05
```
For reporting cluster results 
```.bash
cluster -i tbss_ageInt_tfce_corrp_tstat.nii.gz -t 0.95 -c tbss_ageInt_tstat.nii.gz --scalarname="1-p">cluster_corrp1.txt 
#or:
#cluster -i tbss_ageEffect_tfce_corrp -t 0.95 --oindex cluster_ageEffect2_index -c tbss_ageEffect_tstat2

fslmaths -dt int cluster_index -thr 1 -uthr 1 -bin cluster_mask1
```

```.bash
atlasquery --dumpatlases #Gives you atlases to choose from, e.g. atlasquery [-a "<atlasname>"] [-c <x>, <y>, <z>]
#e.g.: 
atlasquery -a "JHU White-Matter Tractography Atlas" -c -37 4 -30
```
Extracting values from masks to get longitudinal info 
```.bash
fslmeants -i all_FA_skeletonised -m cluster_ageEffect2_mask1 -o cluster1_ageEffect2_FAvalue.txt 
```


## Analyses Jan.2019 TBSS Cluster with all data points (not modelling longitudinally) 
Use no motion data - excluded visually spreadsheet: TBSS_long_no64_motionExcluded.Jan2018
on lux: 
```.bash
2 group design 
EV1: Code 0 for COMP & 1 for PI (GROUP.PI) 
EV2: Code 1 for COMP & 0 for PI (GROUP.COMP)
EV3: Age in Mos (mean centered) 
EV4: Code gender male 1 
```
# Making covariate files
```.bash
#Finding age and sex to add as covariates - use output text files to "paste" into Glm &
/scripts/makingCovariateFiles01.28.2019.Rmd
/ChelseaHarmon/Columbia/danlab/DTI/data/makingCovariateFilesLongHabanero01.28.2019.Rmd
```

```.bash
Glm &
```
Higher Level/non-timeseries design
#inputs = 227
```
wizard 
	2 groups unpaired 
	#of subjects in first group = 127
	process 
	paste 
contrasts 4 

Number of main EVs 4
		
		EV1	EV2 	EV3	EV4
		Comp	PI	Age_mc	Sex
C1 COMP > PI 	1	-1	0	0	
C2 PI > COMP	-1	1	0	0	
C3 PosAgeEff	0	0	1	0	
C4 NegAgeEff	0	0	-1	0

for interaction 
Number of main EVs 5 
constrasts 2 
		EV1	EV2 	EV3	EV4	EV5
C1  COMPxage 	0	0	1	-1	0
C2  PIxage	0	0	-1	1	0
```
Run GLM model 
```.bash
randomise -i all_FA_skeletonised.nii.gz -o tbss_AgeEffectLong -m mean_FA_skeleton_mask.nii.gz -d long_ageEffect.mat -t long_ageEffect.com --T2 -c 3.1 -n 5000

#Use --T2 for TBSS data to get TFCE results 
#Can start with 500 instead of 5000 to see if it works correctly
#DO this for all contrasts e.g. 
randomise -i all_FA_skeleton_mask -d cross_ageInteraction.mat -t cross_ageInteraction.com --T2 -c 3.1 -n 5000
```
