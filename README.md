# DTI
SB DTI Pipeline

##Preprocessing 

##Brain extraction – extract b0 create mask 

fslroi *.nii.gz ${n}_b0_AP 0 1
bet ${n}_b0_AP ${n}_brain -m -f 0.3

#cannot run topup becuase only 1 b0 image 

##run eddy 

eddy --imain=${n}_dwi.nii.gz --mask=${n}_brain_mask.nii.gz --index=/danl/SB/DTI/index.txt --acqp=/danl/SB/DTI/acqparams.txt --bvec=${n}_bvecs --bvals=${n}_bvals /
--fwhm=0 --flm=quadratic --dont_peas --repol --out=${n}_eddy

eddy_openmp --imain=${n}_dwi.nii.gz --mask=${n}_brain_mask.nii.gz --index=/danl/SB/DTI/index.txt --acqp=/danl/SB/DTI/acqparams.txt --bvec=${n}_bvecs --bvals=${n}_bvals /
--fwhm=0 --flm=quadratic --dont_peas --repol --out=${n}_eddy

##check for motion 

##autoptx??

##run bedpostx 

##subject registration?

##run probpostx 



