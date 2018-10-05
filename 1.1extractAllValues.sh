#!/bin/tcsh

#for habanero 08.08.18
#foreach n(SB001 SB001_fu1 SB002_fu2 SB007_fu1 SB011_fu1 SB013_fu1 SB018_fu1 SB018_fu2 SB020_fu2 SB021_fu1 SB025_fu1 SB025_fu2 SB026_fu2 SB027_fu1 SB027_fu2 SB030_fu1 SB030_fu2 SB033_fu2 SB034_fu1 SB034_fu2 SB036_fu1 SB036_fu2 SB041_fu1 SB046_fu2 SB050 SB050_fu1 SB051_fu1 SB054_fu2 SB058 SB058_fu1 SB058_fu2 SB061_fu2 SB064_fu2 SB067_fu1 SB067_fu2 SB069 SB071_fu1 SB071_fu2 SB072_fu1 SB075_fu1 SB076_fu1 SB076_fu2 SB079_fu1 SB079_fu2 SB080_fu1 SB080_fu2 SB081 SB081_fu1 SB085_fu1 SB085_fu2 SB087_fu1 SB087_fu2 SB088_fu1 SB088_fu2 SB091_fu1 SB092_fu1 SB094 SB098_fu1 SB102_fu1 SB102_fu2 SB103_fu1 SB105_fu1 SB107 SB107_fu1 SB108 SB108_fu1 SB112 SB115_fu2 SB116_fu1 SB123_fu1 SB123_fu2 SB124_fu1 SB124_fu2 SB127_fu1 SB127_fu2 SB128 SB128_fu1 SB130 SB131_fu1 SB132_fu2 SB133_fu1 SB133_fu2 SB134_fu1 SB135 SB139_fu1 SB140 SB140_fu1 SB142 SB142_fu1 SB143 SB143_fu1 SB143_fu2 SB144 SB146 SB147 SB147_fu1 SB147_fu2 SB148 SB148_fu1 SB152_fu2 SB154 SB154_fu1 SB154_fu2 SB156_fu1 SB163_fu1 SB163_fu2 SB164 SB164_fu1 SB164_fu2 SB169_fu1 SB169_fu2 SB171 SB178_fu2 SB181 SB181_fu1 SB181_fu2 SB182 SB182_fu1 SB182_fu2 SB186_fu2 SB188 SB188_fu1 SB190_fu1 SB191_fu1 SB192 SB192_fu1 SB196 SB197 SB197_fu1 SB197_fu2 SB199 SB199_fu1 SB202 SB207 SB207_fu1 SB217 SB217_fu1 SB218 SB218_fu1 SB220_fu1 SB220_fu2 SB227 SB228 SB234 SB234_fu1 SB234_fu2 SB235_fu2 SB236 SB236_fu1 SB236_fu2 SB239_fu1 SB239_fu2 SB240 SB240_fu1 SB240_fu2 SB242_fu1 SB242_fu2 SB245 SB245_fu1 SB245_fu2 SB256_fu1 SB256_fu2 SB258 SB258_fu1 SB264 SB264_fu1 SB274 SB276 SB276_fu1 SB276_fu2 SB277 SB277_fu1 SB277_fu2 SB278 SB278_fu1 SB282_fu1 SB283 SB291_fu1 SB291_fu2 SB297_fu1 SB298 SB298_fu1 SB299 SB299_fu1 SB300_fu2 SB303_fu1 SB306_fu1 SB306_fu2 SB307_fu1 SB308_fu1 SB308_fu2 SB312_fu1 SB313_fu1 SB320 SB322 SB327 SB328 SB330 SB330_fu1 SB330_fu2 SB332_fu1 SB332_fu2 SB334_fu2 SB335_fu2 SB336_fu1 SB336_fu2)

#for habanero 09.26.18 
foreach n(SB001 SB001_fu1 SB002_fu2 SB007_fu1 SB011_fu1 SB013_fu1 SB018_fu1 SB018_fu2 SB019_fu2 SB020_fu2 SB021_fu1 SB025_fu1 SB025_fu2 SB026_fu2 SB027_fu1 SB027_fu2 SB030_fu1 SB030_fu2 SB033_fu2 SB036_fu1 SB036_fu2 SB041_fu1 SB046_fu2 SB050 SB050_fu1 SB051_fu1 SB054_fu2 SB058 SB058_fu1 SB058_fu2 SB061_fu2 SB064_fu2 SB067_fu1 SB067_fu2 SB069 SB071_fu1 SB071_fu2 SB072_fu1 SB072_fu2 SB075_fu1 SB076_fu1 SB076_fu2 SB079_fu1 SB079_fu2 SB080_fu1 SB080_fu2 SB081 SB081_fu1 SB085_fu1 SB085_fu2 SB087_fu1 SB087_fu2 SB088_fu1 SB088_fu2 SB091_fu1 SB092_fu1 SB094 SB098_fu1 SB102_fu1 SB102_fu2 SB103_fu1 SB105_fu1 SB107 SB107_fu1 SB108 SB108_fu1 SB112 SB115_fu2 SB116_fu1 SB123_fu1 SB123_fu2 SB124_fu1 SB124_fu2 SB127_fu1 SB127_fu2 SB128 SB128_fu1 SB130 SB131_fu1 SB132_fu2 SB133_fu1 SB133_fu2 SB134_fu1 SB135 SB139_fu1 SB140 SB140_fu1 SB142 SB142_fu1 SB143 SB143_fu1 SB143_fu2 SB144 SB146 SB147 SB147_fu1 SB147_fu2 SB148 SB148_fu1 SB152_fu1 SB152_fu2 SB154 SB154_fu1 SB154_fu2 SB156_fu1 SB163_fu1 SB163_fu2 SB164 SB164_fu1 SB164_fu2 SB169_fu1 SB169_fu2 SB171 SB171_fu1 SB181_fu1 SB181_fu2 SB182 SB182_fu1 SB182_fu2 SB186_fu2 SB188 SB188_fu1 SB190_fu1 SB191_fu1 SB192 SB192_fu1 SB196 SB197 SB197_fu1 SB197_fu2 SB199 SB199_fu1 SB202 SB207 SB207_fu1 SB217 SB217_fu1 SB218 SB218_fu1 SB220_fu1 SB220_fu2 SB227 SB228 SB234 SB234_fu1 SB234_fu2 SB235_fu2 SB236 SB236_fu1 SB239_fu2 SB240_fu1 SB240_fu2 SB242_fu1 SB242_fu2 SB245_fu2 SB256_fu1 SB256_fu2 SB258 SB258_fu1 SB264 SB264_fu1 SB274 SB276 SB276_fu1 SB276_fu2 SB277 SB277_fu1 SB277_fu2 SB278 SB278_fu1 SB282_fu1 SB283 SB291_fu1 SB291_fu2 SB297 SB297_fu1 SB298 SB298_fu1 SB299 SB299_fu1 SB300_fu2 SB303_fu1 SB306_fu1 SB306_fu2 SB307_fu1 SB308_fu1 SB308_fu2 SB312_fu1 SB313_fu1 SB320 SB322 SB327 SB328 SB330 SB330_fu1 SB330_fu2 SB332_fu1 SB332_fu2 SB334_fu2 SB335_fu2 SB336_fu1 SB336_fu2)
#failed for visualization SB034_fu1 SB034_fu2 SB178_fu2 SB181 SB236_fu2 SB239_fu1 SB240 SB245 SB245_fu1

cd /danl/SB/DTI/autoptx/visualise/th_0.005/${n}/
#FA
fslmeants -i dti_FA.nii.gz -m atr_l_tract_FA.nii.gz -o atr_l_FA.txt
fslmeants -i dti_FA.nii.gz -m atr_r_tract_FA.nii.gz -o atr_r_FA.txt

fslmeants -i dti_FA.nii.gz -m cgc_l_tract_FA.nii.gz -o cgc_l_FA.txt
fslmeants -i dti_FA.nii.gz -m cgc_r_tract_FA.nii.gz -o cgc_r_FA.txt

fslmeants -i dti_FA.nii.gz -m cgh_l_tract_FA.nii.gz -o cgh_l_FA.txt
fslmeants -i dti_FA.nii.gz -m cgh_r_tract_FA.nii.gz -o cgh_r_FA.txt

fslmeants -i dti_FA.nii.gz -m ifo_l_tract_FA.nii.gz -o ifo_l_FA.txt
fslmeants -i dti_FA.nii.gz -m ifo_r_tract_FA.nii.gz -o ifo_r_FA.txt

fslmeants -i dti_FA.nii.gz -m ilf_l_tract_FA.nii.gz -o ilf_l_FA.txt
fslmeants -i dti_FA.nii.gz -m ilf_r_tract_FA.nii.gz -o ilf_r_FA.txt

fslmeants -i dti_FA.nii.gz -m ptr_l_tract_FA.nii.gz -o ptr_l_FA.txt
fslmeants -i dti_FA.nii.gz -m ptr_r_tract_FA.nii.gz -o ptr_r_FA.txt

fslmeants -i dti_FA.nii.gz -m slf_l_tract_FA.nii.gz -o slf_l_FA.txt
fslmeants -i dti_FA.nii.gz -m slf_r_tract_FA.nii.gz -o slf_r_FA.txt

fslmeants -i dti_FA.nii.gz -m str_l_tract_FA.nii.gz -o str_l_FA.txt
fslmeants -i dti_FA.nii.gz -m str_r_tract_FA.nii.gz -o str_r_FA.txt

fslmeants -i dti_FA.nii.gz -m unc_l_tract_FA.nii.gz -o unc_l_FA.txt
fslmeants -i dti_FA.nii.gz -m unc_r_tract_FA.nii.gz -o unc_r_FA.txt

#MD
fslmeants -i dti_MD.nii.gz -m atr_l_tract_MD.nii.gz -o atr_l_MD.txt
fslmeants -i dti_MD.nii.gz -m atr_r_tract_MD.nii.gz -o atr_r_MD.txt

fslmeants -i dti_MD.nii.gz -m cgc_l_tract_MD.nii.gz -o cgc_l_MD.txt
fslmeants -i dti_MD.nii.gz -m cgc_r_tract_MD.nii.gz -o cgc_r_MD.txt

fslmeants -i dti_MD.nii.gz -m cgh_l_tract_MD.nii.gz -o cgh_l_MD.txt
fslmeants -i dti_MD.nii.gz -m cgh_r_tract_MD.nii.gz -o cgh_r_MD.txt

fslmeants -i dti_MD.nii.gz -m ifo_l_tract_MD.nii.gz -o ifo_l_MD.txt
fslmeants -i dti_MD.nii.gz -m ifo_r_tract_MD.nii.gz -o ifo_r_MD.txt

fslmeants -i dti_MD.nii.gz -m ilf_l_tract_MD.nii.gz -o ilf_l_MD.txt
fslmeants -i dti_MD.nii.gz -m ilf_r_tract_MD.nii.gz -o ilf_r_MD.txt

fslmeants -i dti_MD.nii.gz -m ptr_l_tract_MD.nii.gz -o ptr_l_MD.txt
fslmeants -i dti_MD.nii.gz -m ptr_r_tract_MD.nii.gz -o ptr_r_MD.txt

fslmeants -i dti_MD.nii.gz -m slf_l_tract_MD.nii.gz -o slf_l_MD.txt
fslmeants -i dti_MD.nii.gz -m slf_r_tract_MD.nii.gz -o slf_r_MD.txt

#fslmeants -i dti_MD.nii.gz -m str_l_tract_MD.nii.gz -o str_l_MD.txt
#fslmeants -i dti_MD.nii.gz -m str_r_tract_MD.nii.gz -o str_r_MD.txt

fslmeants -i dti_MD.nii.gz -m unc_l_tract_MD.nii.gz -o unc_l_MD.txt
fslmeants -i dti_MD.nii.gz -m unc_r_tract_MD.nii.gz -o unc_r_MD.txt

#AD
fslmeants -i dti_L1.nii.gz -m atr_l_tract_L1.nii.gz -o atr_l_AD.txt
fslmeants -i dti_L1.nii.gz -m atr_r_tract_L1.nii.gz -o atr_r_AD.txt

fslmeants -i dti_L1.nii.gz -m cgc_l_tract_L1.nii.gz -o cgc_l_AD.txt
fslmeants -i dti_L1.nii.gz -m cgc_r_tract_L1.nii.gz -o cgc_r_AD.txt

fslmeants -i dti_L1.nii.gz -m cgh_l_tract_L1.nii.gz -o cgh_l_AD.txt
fslmeants -i dti_L1.nii.gz -m cgh_r_tract_L1.nii.gz -o cgh_r_AD.txt

fslmeants -i dti_L1.nii.gz -m ifo_l_tract_L1.nii.gz -o ifo_l_AD.txt
fslmeants -i dti_L1.nii.gz -m ifo_r_tract_L1.nii.gz -o ifo_r_AD.txt

fslmeants -i dti_L1.nii.gz -m ilf_l_tract_L1.nii.gz -o ilf_l_AD.txt
fslmeants -i dti_L1.nii.gz -m ilf_r_tract_L1.nii.gz -o ilf_r_AD.txt

fslmeants -i dti_L1.nii.gz -m ptr_l_tract_L1.nii.gz -o ptr_l_AD.txt
fslmeants -i dti_L1.nii.gz -m ptr_r_tract_L1.nii.gz -o ptr_r_AD.txt

fslmeants -i dti_L1.nii.gz -m slf_l_tract_L1.nii.gz -o slf_l_AD.txt
fslmeants -i dti_L1.nii.gz -m slf_r_tract_L1.nii.gz -o slf_r_AD.txt

#fslmeants -i dti_L1.nii.gz -m str_l_tract_L1.nii.gz -o str_l_AD.txt
#fslmeants -i dti_L1.nii.gz -m str_r_tract_L1.nii.gz -o str_r_AD.txt

fslmeants -i dti_L1.nii.gz -m unc_l_tract_L1.nii.gz -o unc_l_AD.txt
fslmeants -i dti_L1.nii.gz -m unc_r_tract_L1.nii.gz -o unc_r_AD.txt

#RD
fslmaths -dt input dti_L2.nii.gz -add dti_L3.nii.gz -div 2 dti_RD.nii.gz 
fslmaths -dt input atr_l_tract_L2.nii.gz -add atr_l_tract_L3.nii.gz -div 2 atr_l_tract_RD.nii.gz
fslmaths -dt input atr_r_tract_L2.nii.gz -add atr_r_tract_L3.nii.gz -div 2 atr_r_tract_RD.nii.gz

fslmaths -dt input cgc_l_tract_L2.nii.gz -add cgc_l_tract_L3.nii.gz -div 2 cgc_l_tract_RD.nii.gz
fslmaths -dt input cgc_r_tract_L2.nii.gz -add cgc_r_tract_L3.nii.gz -div 2 cgc_r_tract_RD.nii.gz

fslmaths -dt input cgh_l_tract_L2.nii.gz -add cgh_l_tract_L3.nii.gz -div 2 cgh_l_tract_RD.nii.gz
fslmaths -dt input cgh_r_tract_L2.nii.gz -add cgh_r_tract_L3.nii.gz -div 2 cgh_r_tract_RD.nii.gz

fslmeants -dt input ifo_l_tract_L2.nii.gz -add ifo_l_tract_L3.nii.gz -div 2 ifo_l_tract_RD.nii.gz
fslmeants -dt input ifo_r_tract_L2.nii.gz -add ifo_r_tract_L3.nii.gz -div 2 ifo_r_tract_RD.nii.gz

fslmaths -dt input ilf_l_tract_L2.nii.gz -add ilf_l_tract_L3.nii.gz -div 2 ilf_l_tract_RD.nii.gz
fslmaths -dt input ilf_r_tract_L2.nii.gz -add ilf_r_tract_L3.nii.gz -div 2 ilf_r_tract_RD.nii.gz

fslmaths -dt input ptr_l_tract_L2.nii.gz -add ptr_l_tract_L3.nii.gz -div 2 ptr_l_tract_RD.nii$
fslmaths -dt input ptr_r_tract_L2.nii.gz -add ptr_r_tract_L3.nii.gz -div 2 ptr_r_tract_RD.nii$

fslmaths -dt input slf_l_tract_L2.nii.gz -add slf_l_tract_L3.nii.gz -div 2 slf_l_tract_RD.nii$
fslmaths -dt input slf_r_tract_L2.nii.gz -add slf_r_tract_L3.nii.gz -div 2 slf_r_tract_RD.nii$

fslmaths -dt input str_l_tract_L2.nii.gz -add str_l_tract_L3.nii.gz -div 2 str_l_tract_RD.nii.gz
fslmaths -dt input str_r_tract_L2.nii.gz -add str_r_tract_L3.nii.gz -div 2 str_r_tract_RD.nii.gz

fslmaths -dt input unc_l_tract_L2.nii.gz -add unc_l_tract_L3.nii.gz -div 2 unc_l_tract_RD.nii.gz
fslmaths -dt input unc_r_tract_L2.nii.gz -add unc_r_tract_L3.nii.gz -div 2 unc_r_tract_RD.nii.gz

fslmeants -i dti_RD.nii.gz -m atr_l_tract_RD.nii.gz -o atr_l_RD.txt
fslmeants -i dti_RD.nii.gz -m atr_r_tract_RD.nii.gz -o atr_r_RD.txt 

fslmeants -i dti_RD.nii.gz -m cgc_l_tract_RD.nii.gz -o cgc_l_RD.txt
fslmeants -i dti_RD.nii.gz -m cgc_r_tract_RD.nii.gz -o cgc_r_RD.txt 

fslmeants -i dti_RD.nii.gz -m cgh_l_tract_RD.nii.gz -o cgh_l_RD.txt
fslmeants -i dti_RD.nii.gz -m cgh_r_tract_RD.nii.gz -o cgh_r_RD.txt 

fslmeants -i dti_RD.nii.gz -m ifo_l_tract_RD.nii.gz -o ifo_l_RD.txt
fslmeants -i dti_RD.nii.gz -m ifo_r_tract_RD.nii.gz -o ifo_r_RD.txt

fslmeants -i dti_RD.nii.gz -m ilf_l_tract_RD.nii.gz -o ilf_l_RD.txt
fslmeants -i dti_RD.nii.gz -m ilf_r_tract_RD.nii.gz -o ilf_r_RD.txt 

fslmeants -i dti_RD.nii.gz -m ptr_l_tract_RD.nii.gz -o ptr_l_RD.txt
fslmeants -i dti_RD.nii.gz -m ptr_r_tract_RD.nii.gz -o ptr_r_RD.txt

fslmeants -i dti_RD.nii.gz -m slf_l_tract_RD.nii.gz -o slf_l_RD.txt
fslmeants -i dti_RD.nii.gz -m slf_r_tract_RD.nii.gz -o slf_r_RD.txt

fslmeants -i dti_RD.nii.gz -m str_l_tract_RD.nii.gz -o str_l_RD.txt
fslmeants -i dti_RD.nii.gz -m str_r_tract_RD.nii.gz -o str_r_RD.txt 

fslmeants -i dti_RD.nii.gz -m unc_l_tract_RD.nii.gz -o unc_l_RD.txt
fslmeants -i dti_RD.nii.gz -m unc_r_tract_RD.nii.gz -o unc_r_RD.txt 

echo ${n}

end
