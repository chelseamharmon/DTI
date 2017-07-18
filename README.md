# DTI
SB DTI Pipeline

##Preprocessing 

##Brain extraction – extract b0 create mask 

fslroi *.nii.gz ${n}_b0_AP 0 1
bet ${n}_b0_AP ${n}_brain -m -f 0.3

#cannot run topup becuase only 1 b0 image 

##run eddy (on Yeti) 

examples: 
eddy --imain=${n}_dwi.nii.gz --mask=${n}_brain_mask.nii.gz --index=/danl/SB/DTI/index.txt --acqp=/danl/SB/DTI/acqparams.txt --bvec=${n}_bvecs --bvals=${n}_bvals /
--fwhm=0 --flm=quadratic --out=eddy_unwarped_images

For n in SB00{1..9}; do launch -n SB00${n}_eddy -r 30:00:00 -y 10000mb "eddy --imain=SB${n}_dwi.nii.gz --mask=SB00${n}_brain_mask.nii.gz --index=index.txt --acq=acqparams.txt --bvecs=SB00${n}_bvecs --bvals=SB00${n} --fwhm=0 --flm=quadratic --out=eddy_images /vega/psych/users/cmh2228/danl/SB/DTI/eddy"

HELP 

#copy data on yeti from lux 
tar -cf - /danl/SB/DTI.eddy | ssh cmh2228@yetisubmit.cc.columbia.edu "cd /vega/psych/users/cmh2228/; tar -cf -" 

-bash-4.1$ For n in {1..9};do launch -k -n SB00${n}_eddy -r 30:00:00 -y 10000mb "eddy --imain=SB${n}_dwi.nii.gz --mask=SB00${n}_brain_mask.nii.gz --index=index.txt --acq=acqparams.txt(acqparamsAP_PA.txt) --bvecs=SB00${n}_bvecs --bvals=SB00${n} --fwhm=0 --flm=quadratic --out=eddy_images /vega/psych/users/cmh2228/danl/SB/DTI/eddy"; done
-bash: syntax error near unexpected token `do'

take out path at the end of "" <- specific to freesurfer 
figure out where the output path is so that it doenst export to akrams in ~/.profile 

For n in SB00{1..9};do launch -k -n SB00${n}_eddy -r 30:00:00 -y 10000mb "eddy --imain=SB${n}_dwi.nii.gz --mask=SB00${n}_brain_mask.nii.gz --index=index.txt --acq=acqparams.txt(acqparamsAP_PA.txt) --bvecs=SB00${n}_bvecs --bvals=SB00${n} --fwhm=0 --flm=quadratic --out=eddy_images /vega/psych/users/cmh2228/danl/SB/DTI/eddy"; done


-bash-4.1$ qsub -I -W group_list=yetipsych -l walltime=04:00:00,mem=1gb -X
qsub: waiting for job 2506972.moose.cc.columbia.edu to start
qsub: job 2506972.moose.cc.columbia.edu ready

qstat: Unauthorized Request  2506972.moose.cc.columbia.edu
                  .--.
         ,-,-,--(/o  o\)-,-,-,.
       ,'      //  oo  \\      ',
      ,'       /|  __  |\       ',
      ,'       //\,__,/\\       ',
      ,    /\              /\    ,
      ,   /'`\            /' \   ,
      |  /'  `\          /'  '\  |
      |  \    (          )    /  |
     ( /\|    /'        '\    |/\ )
      \|     /'   /'`\   '\     |/
            |    /'  `\    |
           (    (      )    )
           `\    \    /'   /'
             `\   \  /'   /'
             /    /  \    \
             v v v    v v v
   +--------------------------------+
   |                                |
   | You are in an interactive job. |
   |                                |
   |   Your walltime is     |
   |                                |
   +--------------------------------+
-bash-4.1$ eddy

-bash-4.1$ eddy --imain=SB100_dwi.nii.gz --mask=SB100_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB100_bvecs --bvals=SB100_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB001/eddy_image

#WORKING: 

launch -k -n SB100_eddy -r 30:00:00 -y 10000mb "eddy --imain=SB100_dwi.nii.gz --mask=SB100_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB100_bvecs --bvals=SB100_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB100/eddy_images"


launch -k -n SB001_eddy -r 30:00:00 -y 10000mb "eddy --imain=SB001_dwi.nii.gz --mask=SB001_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB001_bvecs --bvals=SB001_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB001/eddy_image"

#copying image from Yeti back to lux 
#in lux terminal window 

ssh cmh2228@yetisubmit.cc.columbia "cd /vega/psych/users/cmh2228/danl/SB/eddy; tar -cf - eddy_images | tar -xf - 

add this to ~/.profile for current version of FSL for eddy
export PATH="$PATH:/vega/psych/app/fsl-5.0.10/bin:"
export FSLDIR=/vega/psych/app/fsl-5.0.10
. /vega/psych/app/fsl-5.0.10/etc/fslconf/fsl.sh



launch -k -n SB001 -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB001_dwi.nii.gz --mask=SB001_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB001_bvecs --bvals=SB001_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB001/SB001"

For n in SB00{1..9};do launch -k -n SB00${n} -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB00${n}_dwi.nii.gz --mask=SB00${n}_brain_mask.nii.gz --index=index.txt --acq=acqparams.txt(acqparamsAP_PA.txt) --bvecs=SB00${n}_bvecs --bvals=SB00${n}_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB00${n}/SB00${n}"; done

error with do 
error with done 

For n in SB00{1..9};launch -k -n SB00${n} -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB00${n}_dwi.nii.gz --mask=SB00${n}_brain_mask.nii.gz --index=index.txt --acq=acqparams.txt(acqparamsAP_PA.txt) --bvecs=SB00${n}_bvecs --bvals=SB00${n}_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB00${n}/SB00${n}"

??

for n in SB00{2..9}; do launch -k -n SB00${n} -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB00${n}_dwi.nii.gz --mask=SB00${n}_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB00${n}_bvecs --bvals=SB00${n}_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB00${n}/SB00${n}"; done

 for n in SB00{2..9}; do launch -k -n SB00${n}_fu1 -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB00${n}_fu1_dwi.nii.gz --mask=SB00${n}_fu1_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB00${n}_fu1_bvecs --bvals=SB00${n}_fu1_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB00${n}_fu1/SB00${n}_fu1"; done
 
 
 
  for n in SB00{2..9}; do launch -k -n SB00${n}_fu2 -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB00${n}_fu2_dwi.nii.gz --mask=SB00${n}_fu2_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB00${n}_fu2_bvecs --bvals=SB00${n}_fu2_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB00${n}_fu2/SB00${n}_fu2"; done
  
   for n in SB0{10..99}; do launch -k -n SB0${n} -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB0${n}_dwi.nii.gz --mask=SB0${n}_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB0${n}_bvecs --bvals=SB0${n}_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB0${n}/SB0${n}"; done
   
   for n in SB0{10..99}; do launch -k -n SB0${n}_fu1 -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB0${n}_fu1_dwi.nii.gz --mask=SB0${n}_fu1_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB0${n}_fu1_bvecs --bvals=SB0${n}_fu1_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB0${n}_fu1/SB0${n}_fu1"; done

 for n in SB0{10..99}; do launch -k -n SB0${n}_fu2 -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB0${n}_fu2_dwi.nii.gz --mask=SB0${n}_fu2_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB0${n}_fu2_bvecs --bvals=SB0${n}_fu2_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB0${n}_fu2/SB0${n}_fu2"; done

for n in SB1{0..99}; do launch -k -n SB0${n} -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB1${n}_dwi.nii.gz --mask=SB1${n}_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB1${n}_bvecs --bvals=SB1${n}_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB1${n}/SB1${n}"; done

for n in SB1{00..09}; do launch -k -n SB0${n} -r 30:00:00 -y 10000mb "eddy_openmp --imain=SB1${n}_dwi.nii.gz --mask=SB1${n}_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=SB1${n}_bvecs --bvals=SB1${n}_bvals --fwhm=0 --flm=quadratic --out=/vega/psych/users/cmh2228/danl/SB/DTI/eddy/SB1${n}/SB1${n}"; done

moves to lux 

#run bet first! 

eddy --imain=${n}_dwi.nii.gz --mask=${n}_brain_mask.nii.gz --index=index.txt --acqp=acqparamsAP_PA.txt --bvecs=${n}_bvecs --bvals=${n}_bvals --fwhm=0 --flm=quadratic --out=${n}_eddy
  
