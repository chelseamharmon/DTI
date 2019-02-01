# DTI
SB DTI Pipeline

# Preprocessing 

## Creating DTI folders and Converting dicoms to NIfti 

```.bash 
#use foreach n (SB002_fu2 SB018_fu2 SB019_fu2…) from line 3 of subjects (all subjects)

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

#IF running on habanero cd /rigel/psych/users/cmh2228/SB
for i in SB*; do sbatch habanero/0.0eddy_opemp_batch.sh $n; done 

#This script rungs: eddy_openmp --imain=${n}_dwi.nii.gz --mask=${n}_brain_mask.nii.gz --index=/danl/SB/DTI/index.txt --acqp=/danl/SB/DTI/acqparams.txt --bvec=${n}_bvecs --bvals=${n}_bvals /
--fwhm=0 --flm=quadratic --dont_peas --repol --out=${n}_eddy
```

## Checking for motion 
on lux 
```.R
Rscript scripts/motion_assess/extractingRMS.R 
Rscript scripts/motion_assess/extractingOutlierData.R 
Rscript scripts/motion_assess/extractingVolTransRotData.R 
```

## Fitting tensors 

```.bash 

dtifit -k eddy_unwarped_images -m hifi_nodif_brain_mask -r bvecs -b bvals -o dti 

```


## TBSS 
run on habanero 

```.bash

for n in *copy list of subjects from subjects line 8 #TBSS cross*; do sbatch habanero/0.1prepare_tbss_folder $n; done
#This script creates one folder with all _dti_FA.nii.gz files and renames them to order by group (COMP/PI)

#Do the same for MD, L1(AD), L2 & L2 (RD) 
for n in *copy list of subjects from subjects line 8 #TBSS cross*; do sbatch habanero/0.1b_prepare_tbss_folders_nonFA $n; done


cd /TBSS
sbatch 1.1tbss_1_preproc 
#This script runs: tbss_1_preproc *nii.gz

sbatch habanero/2.1tbss_2_reg
#This script runs: tbss_2_reg -T

sbatch habanero/3.1tbss_3_postreg 
#This script runs: tbss_3_postreg -S

sbatch habanero/4.1tbss_4_prestats
#This script runs: tbss_4_prestats 0.2

 ```
 # For running with all subjects 
 ```.bash

for n in *copy list of subjects from subjects line 8 #TBSS Long*; do sbatch 0.prepare_tbss_folder_long $n; done
#This script creates one folder with all _dti_FA.nii.gz files and renames them to order by group (COMP/PI)

#Do the same for MD, L1(AD), L2 & L2 (RD) 
for n in *copy list of subjects from subjects line 8 #TBSS cross*; do sbatch habanero/0.1b_prepare_tbss_folders_nonFA_long $n; done

cp TBSS/ TBSS_long
sbatch habanero/1.1b_tbss_1_preproc_long 
#This script runs: tbss_1_preproc *nii.gz

sbatch habanero/2.1b_tbss_2_reg_long
#This script runs: tbss_2_reg -T

sbatch habanero/3.1b_tbss_3_postreg_long 
#This script runs: tbss_3_postreg -S

sbatch habanero/4.1b_tbss_4_prestats_long
#This script runs: tbss_4_prestats 0.2

 ```

## For running statistics on MD, L1, L2, L3 

```.bash
#Moving folders and renaming 
mkdir /rigel/psych/users/cmh2228/SB/TBSS/MD
for n in *copy list of subjects from subjects line 8 #TBSS cross*; do sbatch 0.1b_prepare_tbss_folders_nonFA $n; done
#This script moves subjects _dti_MD.nii.gz files and renames them _dti_FA.nii.gz for running tbss_non_FA MD
#Running tbss 
sbatch 5.1tbss_non_FA



#for longidutinal set 
for n in *copy list of subjects from subjects line 8 #TBSS cross*; do sbatch 0.1b_prepare_tbss_folders_nonFA_long $n; done
sbatch habanero/5.1b_tbss_non_FA_long
```


## run bedpostx 

```.bash
for n in SB*; do sbatch habanero/0.2prepare_bedpostx_folders $n; done 

for n in SB*; do sbatch habanero/1.2bedpostx $n; done
#This script runs: bedpostx ${n}
```

## subject registration
```.bash
for n in SB*; do sbatch habanero/3.2registration $n; done 

```

## run probpostx 
Using amydala as a seed 
```.bash
for n in SB*; do sbatch habanero/4.2probtrackxAmygSeed.sh $n; done 

```

## autoptx
Run autoptx on habanero becuase takes a long time. Then copy to lux to run visualization and pull values. 

```.bash
#HABANERO
#prepare autoptx folder 
for n in SB*; do sbatch habanero/0.3prepare_autoptx_folders $n ; done

#This script runs: autoPtx_1_preproc ${n} and then: autoPtx_2_launchTractography 
cd /rigel/psych/users/cmh2228/SB/autoptx
for n in SB*; do sbatch habanero/1.3autoPtx_1.sh $n; done 
for n in SB*; do sbatch habanero/2.3autoPtx_2.sh $n; done 


#done for "ar_l", "ar_r", "atr_l", "atr_r", "cgc_l", "cgc_r", "cgh_l", "cgh_r", "ifo_l", "ifo_r", "ilf_l", "ilf_r", "ptr_l", "ptr_r", "slf_l", "slf_r", "str_r", "str_l", "unc_l", "unc_r" #ammended /rigel/psych/app/autoPtx/structureList

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
./danl/SB/DTI/scripts/autoptx/6.1extractAllValues.sh

#Make a spreadsheet of all subjects values - uses subjectList.txt and tractList.txt from autoptx/preproc/ folder 
Rscript 6.2extractingAllValues.R 

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
These were done incorrectly - with COMP and PI switched - find in folder TBSS_cross_no64_motionExcluded.Jan2018/
All TBSS redone Jan 2019 using updated pipeline (Changed: Covaraiates file and Interaction model to include main effects)
- find on Habanero TBSS/ 

# Making covariates file 
Using list of subject IDs - merge with full data set in this script 
```{r}
rstudio ~/Columbia/danlab/DTI/data/makingCovariatesFileLong01.28.2019 #this does both cross-sectional and all data points 
#output files 1.) cross_covarites.txt 2.) cross_covariates_GroupXAge01.29.2019.txt
```

# Creating glm files to run 

Use no motion data - excluded visually spreadsheet: TBSS_cross_no64_motionExcluded.Jan2018

on lux: 

2 group design 
EV1: Code 0 for COMP & 1 for PI (GROUP.PI) 
EV2: Code 1 for COMP & 0 for PI (GROUP.COMP)
EV3: Age in Mos (mean centered) 
EV4: Code gender male 1 



```.bash
Glm &
```
Higher Level/non-timeseries design
#inputs = 133

wizard 
```
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
```

```
# for interaction 
EVs
Number of main EVs 6
Contrasts & F-tests
constrasts 5 

		EV1	EV2 	EV3	EV4	EV5	EV6
		COMP	PI	Age_mc	Comp*age PI*age	Gender	
C1 COMP > PI 	1	-1	0	0	0	0
C2 PI > COMP	-1	1	0	0	0	0
C3 PosAgeEff	0	0	1	0	0	0
C4  CompXage 	0	0	0	1	-1	0
C5  PIXage	0	0	0	-1	1	0


or #per FSL website 
EVs
Number of main EVs 5
Contrasts & F-tests
constrasts 2

		EV1	EV2 	EV3	EV4	EV5
		COMP	PI	Comp*age PI*age	Gender	
C1  CompXage 	0	0	1	-1	0
C2  PIXage	0	0	-1	1	0

```
Paste - paste in covariates you made (use contol y - bc it is using matlab) *make sure the order is the same - it is VERY important that you keep the order of the matrix consistent with the order that TBSS processed your data. To check the order that TBSS used, navigate to the FA folder created by TBSS and type the command [bash] imglob *_FA.*[/bash] 

Save *rename /TBSS_cross_01.29.2019/cross_ageInteraction

Run GLM model *done on habanero for speed* 
```.bash
#Use --T2 for TBSS data to get TFCE results 
#Can start with 500 instead of 5000 to see if it works correctly
#DO this for all contrasts e.g. 

#Copy from lux to habanero: on habanero: 
scp charmon@lux.psych.columbia.edu:/danl/SB/DTI/TBSS_cross_01.29.2019/cross* /rigel/psych/users/cmh2228/SB/TBSS/stats/

randomise -i all_FA_skeletonised.nii.gz -o tbss_FA_AgeEffect -m mean_FA_skeleton_mask.nii.gz -d cross_ageEffect.mat -t cross_ageEffect.com --T2 -c 3.1 -n 5000  #see script 6.1randomise.cross 

#also do this for MD, AD, RD e.g.
randomise -i all_MD_skeletonised.nii.gz -o tbss_MD_geEffect -m mean_MD_skeleton_mask.nii.gz -d cross_ageEffect.mat -t cross_ageEffect.com --T2 -c 3.1 -n 5000 #see script: sbatch habanero/6.1b_randomise_cross_MD; sbatch habanero/6.1b_randomise.cross_AD;

#For RD, before running randomise combine L2 and L3 - can be found in 5.2combineRD on habanero 
fslmaths all_L2.nii.gz -add all_L3.nii.gz -div 2 all_RD.nii.gz #and then on habanero run: sbatch habanero/6.1b_randomise_cross_RD 
```

Interactions: 
```.bash

randomise -i all_FA_skeletonised.nii.gz -o tbss_ageInteraction -m mean_FA_skeleton_mask.nii.gz -d cross_ageInteraction.mat -t cross_ageInteraction.com --T2 -c 3.1 -n 5000 #on habanero: sbatch habanero/6.2randomise_cross_Interaction

#Do for MD, AD, RD 
sbatch habanero/6.2b_randomise_cross_Interaction_MD
sbatch habanero/6.2b_randomise_cross_Interaction_AD
sbatch habanero/6.2b_randomise_cross_Interaction_RD

```

copy outputs to lux 
to view: 
```.bash
#on lux  cd /danl/SB/DTI/TBSS_cross_01.29.2019
scp cmh2228@habanero.rcs.columbia.edu:/rigel/psych/users/cmh2228/SB/TBSS/cross* . 
scp cmh2228@habanero.rcs.columbia.edu:/rigel/psych/users/cmh2228/SB/TBSS/all* . 

fslview $FSLDIR/data/standard/MNI152_T1_1mm mean_FA_skeleton -l Green -b 0.2,0.7 tbss_tfce_corrp_tstat1 -l Red-Yellow -b 0.95,1
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
/chelseaharmon/Columbia/danlab/DTI/data/makingCovariateFilesLongHabanero01.28.2019.Rmd
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
```
save *long_ageEffect.fsf

```
for interaction 
Number of main EVs 5 
constrasts 2 

		EV1	EV2 	EV3	EV4	EV5	EV6
		Comp	PI	Age	Age*Comp Age*PI	Sex
C1 COMP > PI 	1	-1	0	0	0	0
C2 PI > COMP	-1	1	0	0	0	0
C3 PosAgeEff	0	0	1	0	0	0
C4 NegAgeEff	0	0	-1	0	0	0
C5 COMPxage 	0	0	0	1	-1	0
C6 PIxage	0	0	0	-1	1	0

```
save *long_ageInteraction.fsf
 


Run GLM model 
```.bash
randomise -i all_FA_skeletonised.nii.gz -o tbss_AgeEffectLong -m mean_FA_skeleton_mask.nii.gz -d long_ageEffect.mat -t long_ageEffect.com --T2 -c 3.1 -n 5000



#Use --T2 for TBSS data to get TFCE results 
#Can start with 500 instead of 5000 to see if it works correctly
#DO this for all contrasts e.g. 
randomise -i all_FA_skeleton_mask -d cross_ageInteraction.mat -t cross_ageInteraction.com --T2 -c 3.1 -n 5000
```
