#!/bin/sh

#SBATCH --account=psych
#SBATCH --job-name=SB_DTI_process
#SBATCH -c 1
#SBATCH --time=05:30:00
#SBATCH --mem-per-cpu=8gb

n=$1
cd /rigel/psych/users/cmh2228/SB/${n}/anatomical/DTI
pwd
eddy_openmp --imain=${n}_dwi.nii.gz --mask=nodif_brain_mask.nii.gz --index=/rigel/psych/users/cmh2228/SB/index.txt --acqp=/rigel/psych/users/cmh2228/SB/acqparamsAP_PA.txt --bvecs=bvecs --bvals=bvals --fwhm=0 --flm=quadratic --repol --dont_peas --out=${n}_eddy

