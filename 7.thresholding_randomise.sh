#!/bin/tcsh

#FA Age Effects COPE 1 
#1. Thresholding
fslmaths tbss_FA_AgeEffect_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_FA_AgeEffect_results_mask1
#2. extracting FA values from mask 
fslmeants -i all_FA_skeletonised.nii.gz -m significant_FA_AgeEffect_results_mask1.nii.gz -o avg_FA_tstat1.txt
#3. for visualizing purposes 
tbss_fill tbss_FA_AgeEffect_clustere_corrp_tstat1.nii.gz 0.949 mean_FA tbss_FA_AgeEffect_clustere_corrp_tstat1_filled 
#4. clustering
cluster -i tbss_FA_AgeEffect_tfce_corrp_tstat1.nii.gz -t 0.95 -c tbss_FA_AgeEffect_tstat1.nii.gz --scalarname="1-p">cluster_FA_AgeEffect_corrp1.txt 
#5. use atlasq to determine if coordinate is in a tract or labelled 

#COPE 2
fslmaths tbss_FA_AgeEffect_clustere_corrp_tstat2.nii.gz -thr 0.95 -bin significant_FA_AgeEffect_results_mask2
fslmeants -i all_FA_skeletonised.nii.gz -m significant_FA_AgeEffect_results_mask2.nii.gz -o avg_FA_tstat2.txt
tbss_fill tbss_FA_AgeEffect_clustere_corrp_tstat2.nii.gz 0.949 mean_FA tbss_FA_AgeEffect_clustere_corrp_tstat2_filled 
cluster -i tbss_FA_AgeEffect_tfce_corrp_tstat2.nii.gz -t 0.95 -c tbss_FA_AgeEffect_tstat2.nii.gz --scalarname="1-p">cluster_FA_AgeEffect_corrp2.txt 

#COPE 3 
fslmaths tbss_FA_AgeEffect_clustere_corrp_tstat3.nii.gz -thr 0.95 -bin significant_FA_AgeEffect_results_mask3
fslmeants -i all_FA_skeletonised.nii.gz -m significant_FA_AgeEffect_results_mask3.nii.gz -o avg_FA_tstat3.txt
tbss_fill tbss_FA_AgeEffect_clustere_corrp_tstat3.nii.gz 0.949 mean_FA tbss_FA_AgeEffect_clustere_corrp_tstat3_filled 
cluster -i tbss_FA_AgeEffect_tfce_corrp_tstat3.nii.gz -t 0.95 -c tbss_FA_AgeEffect_tstat3.nii.gz --scalarname="1-p">cluster_FA_AgeEffect_corrp3.txt 

#COPE 4
fslmaths tbss_FA_AgeEffect_clustere_corrp_tstat4.nii.gz -thr 0.95 -bin significant_FA_AgeEffect_results_mask4
fslmeants -i all_FA_skeletonised.nii.gz -m significant_FA_AgeEffect_results_mask4.nii.gz -o avg_FA_tstat4.txt
tbss_fill tbss_FA_AgeEffect_clustere_corrp_tstat4.nii.gz 0.949 mean_FA tbss_FA_AgeEffect_clustere_corrp_tstat4_filled 
cluster -i tbss_FA_AgeEffect_tfce_corrp_tstat4.nii.gz -t 0.95 -c tbss_FA_AgeEffect_tstat4.nii.gz --scalarname="1-p">cluster_FA_AgeEffect_corrp4.txt 

#FA Interaction COPE 1 
fslmaths tbss_FA_AgeInt_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_FA_AgeInt_results_mask1
fslmeants -i all_FA_skeletonised.nii.gz -m significant_FA_AgeInt_results_mask1.nii.gz -o avg_FA_Int_tstat1.txt
tbss_fill tbss_FA_AgeInt_clustere_corrp_tstat1.nii.gz 0.949 mean_FA tbss_FA_AgeInt_clustere_corrp_tstat1_filled 
cluster -i tbss_FA_AgeInt_clustere_corrp_tstat1.nii.gz -t 0.95 -c tbss_FA_AgeInt_tstat1.nii.gz --scalarname="1-p">cluster_FA_AgeInt_corrp1.txt 

#COPE 2 
fslmaths tbss_FA_AgeInt_clustere_corrp_tstat2.nii.gz -thr 0.95 -bin significant_FA_AgeInt_results_mask2
fslmeants -i all_FA_skeletonised.nii.gz -m significant_FA_AgeInt_results_mask1.nii.gz -o avg_FA_Int_tstat2.txt
tbss_fill tbss_FA_AgeInt_clustere_corrp_tstat2.nii.gz 0.949 mean_FA tbss_FA_AgeInt_clustere_corrp_tstat2_filled 
cluster -i tbss_FA_AgeInt_clustere_corrp_tstat2.nii.gz -t 0.95 -c tbss_FA_AgeInt_tstat2.nii.gz --scalarname="1-p">cluster_FA_AgeInt_corrp2.txt 

#MD 
#COPE1 
fslmaths tbss_MD_AgeEffect_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_MD_AgeEffect_results_mask1
fslmeants -i all_MD_skeletonised.nii.gz -m significant_MD_AgeEffect_results_mask1.nii.gz -o avg_MD_AgeEffect__tstat1.txt
tbss_fill tbss_MD_AgeEffect_clustere_corrp_tstat1.nii.gz 0.949 mean_MD tbss_MD_AgeEffect_clustere_corrp_tstat1_filled 
cluster -i tbss_MD_AgeEffect_tfce_corrp_tstat1.nii.gz -t 0.95 -c tbss_MD_AgeEffect_tstat1.nii.gz --scalarname="1-p">cluster_MD_AgeEffect_corrp1.txt 
#COPE2
fslmaths tbss_MD_AgeEffect_clustere_corrp_tstat2.nii.gz -thr 0.95 -bin significant_MD_AgeEffect_results_mask2
fslmeants -i all_MD_skeletonised.nii.gz -m significant_MD_AgeEffect_results_mask2.nii.gz -o avg_MD_AgeEffect__tstat2.txt
tbss_fill tbss_MD_AgeEffect_clustere_corrp_tstat2.nii.gz 0.949 mean_MD tbss_MD_AgeEffect_clustere_corrp_tstat2_filled 
cluster -i tbss_MD_AgeEffect_tfce_corrp_tstat2.nii.gz -t 0.95 -c tbss_MD_AgeEffect_tstat2.nii.gz --scalarname="1-p">cluster_MD_AgeEffect_corrp2.txt 
#COPE3
fslmaths tbss_MD_AgeEffect_clustere_corrp_tstat3.nii.gz -thr 0.95 -bin significant_MD_AgeEffect_results_mask3
fslmeants -i all_MD_skeletonised.nii.gz -m significant_MD_AgeEffect_results_mask3.nii.gz -o avg_MD_AgeEffect__tstat3.txt
tbss_fill tbss_MD_AgeEffect_clustere_corrp_tstat3.nii.gz 0.949 mean_MD tbss_MD_AgeEffect_clustere_corrp_tstat3_filled 
cluster -i tbss_MD_AgeEffect_tfce_corrp_tstat3.nii.gz -t 0.95 -c tbss_MD_AgeEffect_tstat3.nii.gz --scalarname="1-p">cluster_MD_AgeEffect_corrp3.txt 
#COPE4
fslmaths tbss_MD_AgeEffect_clustere_corrp_tstat4.nii.gz -thr 0.95 -bin significant_MD_AgeEffect_results_mask4
fslmeants -i all_MD_skeletonised.nii.gz -m significant_MD_AgeEffect_results_mask4.nii.gz -o avg_MD_AgeEffect_tstat4.txt
tbss_fill tbss_MD_AgeEffect_clustere_corrp_tstat4.nii.gz 0.949 mean_MD tbss_MD_AgeEffect_clustere_corrp_tstat4_filled 
cluster -i tbss_MD_AgeEffect_tfce_corrp_tstat4.nii.gz -t 0.95 -c tbss_MD_AgeEffect_tstat4.nii.gz --scalarname="1-p">cluster_MD_AgeEffect_corrp4.txt 

#INT COPE1
fslmaths tbss_MD_AgeInt_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_MD_AgeInt_results_mask1
fslmeants -i all_MD_skeletonised.nii.gz -m significant_MD_AgeInt_results_mask1.nii.gz -o avg_MD_AgeInt_tstat1.txt
tbss_fill tbss_MD_AgeInt_clustere_corrp_tstat1.nii.gz 0.949 mean_MD tbss_MD_AgeInt_clustere_corrp_tstat1_filled 
cluster -i tbss_MD_AgeInt_tfce_corrp_tstat1.nii.gz -t 0.95 -c tbss_MD_AgeInt_tstat1.nii.gz --scalarname="1-p">cluster_MD_AgeInt_corrp1.txt 
#INT COPE2
fslmaths tbss_MD_AgeInt_clustere_corrp_tstat2.nii.gz -thr 0.95 -bin significant_MD_AgeInt_results_mask2
fslmeants -i all_MD_skeletonised.nii.gz -m significant_MD_AgeInt_results_mask1.nii.gz -o avg_MD_AgeInt_tstat2.txt
tbss_fill tbss_MD_AgeInt_clustere_corrp_tstat2.nii.gz 0.949 mean_MD tbss_MD_AgeInt_clustere_corrp_tstat2_filled 
cluster -i tbss_MD_AgeInt_tfce_corrp_tstat2.nii.gz -t 0.95 -c tbss_MD_AgeInt_tstat2.nii.gz --scalarname="1-p">cluster_MD_AgeInt_corrp2.txt 


#AD
#COPE1 
fslmaths tbss_AD_AgeEffect_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_AD_AgeEffect_results_mask1
fslmeants -i all_AD_skeletonised.nii.gz -m significant_AD_AgeEffect_results_mask1.nii.gz -o avg_AD_AgeEffect__tstat1.txt
tbss_fill tbss_AD_AgeEffect_clustere_corrp_tstat1.nii.gz 0.949 mean_AD tbss_AD_AgeEffect_clustere_corrp_tstat1_filled 
cluster -i tbss_AD_AgeEffect_tfce_corrp_tstat1.nii.gz -t 0.95 -c tbss_AD_AgeEffect_tstat1.nii.gz --scalarname="1-p">cluster_AD_AgeEffect_corrp1.txt 
#COPE2
fslmaths tbss_AD_AgeEffect_clustere_corrp_tstat2.nii.gz -thr 0.95 -bin significant_AD_AgeEffect_results_mask2
fslmeants -i all_AD_skeletonised.nii.gz -m significant_AD_AgeEffect_results_mask2.nii.gz -o avg_AD_AgeEffect__tstat2.txt
tbss_fill tbss_AD_AgeEffect_clustere_corrp_tstat2.nii.gz 0.949 mean_AD tbss_AD_AgeEffect_clustere_corrp_tstat2_filled 
cluster -i tbss_AD_AgeEffect_tfce_corrp_tstat2.nii.gz -t 0.95 -c tbss_AD_AgeEffect_tstat2.nii.gz --scalarname="1-p">cluster_AD_AgeEffect_corrp2.txt 
#COPE3
fslmaths tbss_AD_AgeEffect_clustere_corrp_tstat3.nii.gz -thr 0.95 -bin significant_AD_AgeEffect_results_mask3
fslmeants -i all_AD_skeletonised.nii.gz -m significant_AD_AgeEffect_results_mask3.nii.gz -o avg_AD_AgeEffect__tstat3.txt
tbss_fill tbss_AD_AgeEffect_clustere_corrp_tstat3.nii.gz 0.949 mean_AD tbss_AD_AgeEffect_clustere_corrp_tstat3_filled 
cluster -i tbss_AD_AgeEffect_tfce_corrp_tstat3.nii.gz -t 0.95 -c tbss_AD_AgeEffect_tstat3.nii.gz --scalarname="1-p">cluster_AD_AgeEffect_corrp3.txt 
#COPE4
fslmaths tbss_AD_AgeEffect_clustere_corrp_tstat4.nii.gz -thr 0.95 -bin significant_AD_AgeEffect_results_mask4
fslmeants -i all_AD_skeletonised.nii.gz -m significant_AD_AgeEffect_results_mask4.nii.gz -o avg_AD_AgeEffect_tstat4.txt
tbss_fill tbss_AD_AgeEffect_clustere_corrp_tstat4.nii.gz 0.949 mean_AD tbss_AD_AgeEffect_clustere_corrp_tstat4_filled 
cluster -i tbss_AD_AgeEffect_tfce_corrp_tstat4.nii.gz -t 0.95 -c tbss_AD_AgeEffect_tstat4.nii.gz --scalarname="1-p">cluster_AD_AgeEffect_corrp4.txt 

#INT COPE1
fslmaths tbss_AD_AgeInt_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_AD_AgeInt_results_mask1
fslmeants -i all_AD_skeletonised.nii.gz -m significant_AD_AgeInt_results_mask1.nii.gz -o avg_AD_AgeInt_tstat1.txt
tbss_fill tbss_AD_AgeInt_clustere_corrp_tstat1.nii.gz 0.949 mean_AD tbss_AD_AgeInt_clustere_corrp_tstat1_filled 
cluster -i tbss_AD_AgeInt_tfce_corrp_tstat1.nii.gz -t 0.95 -c tbss_AD_AgeInt_tstat1.nii.gz --scalarname="1-p">cluster_AD_AgeInt_corrp1.txt 
#INT COPE2
fslmaths tbss_AD_AgeInt_clustere_corrp_tstat2.nii.gz -thr 0.95 -bin significant_AD_AgeInt_results_mask2
fslmeants -i all_AD_skeletonised.nii.gz -m significant_AD_AgeInt_results_mask2.nii.gz -o avg_AD_AgeInt_tstat2.txt
tbss_fill tbss_AD_AgeInt_clustere_corrp_tstat2.nii.gz 0.949 mean_AD tbss_AD_AgeInt_clustere_corrp_tstat2_filled 
cluster -i tbss_AD_AgeInt_tfce_corrp_tstat2.nii.gz -t 0.95 -c tbss_AD_AgeInt_tstat2.nii.gz --scalarname="1-p">cluster_AD_AgeInt_corrp2.txt 


#RD
fslmaths tbss_RD_AgeEffect_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_RD_AgeEffect_results_mask1
fslmeants -i all_RD_skeletonised.nii.gz -m significant_RD_AgeEffect_results_mask1.nii.gz -o avg_RD_AgeEffect__tstat1.txt
tbss_fill tbss_RD_AgeEffect_clustere_corrp_tstat1.nii.gz 0.949 mean_RD tbss_RD_AgeEffect_clustere_corrp_tstat1_filled 
cluster -i tbss_RD_AgeEffect_tfce_corrp_tstat1.nii.gz -t 0.95 -c tbss_D_AgeEffect_tstat1.nii.gz --scalarname="1-p">cluster_RD_AgeEffect_corrp1.txt 
#COPE2
fslmaths tbss_RD_AgeEffect_clustere_corrp_tstat2.nii.gz -thr 0.95 -bin significant_RD_AgeEffect_results_mask2
fslmeants -i all_RD_skeletonised.nii.gz -m significant_RD_AgeEffect_results_mask2.nii.gz -o avg_RD_AgeEffect__tstat2.txt
tbss_fill tbss_RD_AgeEffect_clustere_corrp_tstat2.nii.gz 0.949 mean_RD tbss_RD_AgeEffect_clustere_corrp_tstat2_filled 
cluster -i tbss_RD_AgeEffect_tfce_corrp_tstat2.nii.gz -t 0.95 -c tbss_RD_AgeEffect_tstat2.nii.gz --scalarname="1-p">cluster_RD_AgeEffect_corrp2.txt 
#COPE3
fslmaths tbss_RD_AgeEffect_clustere_corrp_tstat3.nii.gz -thr 0.95 -bin significant_RD_AgeEffect_results_mask3
fslmeants -i all_RD_skeletonised.nii.gz -m significant_RD_AgeEffect_results_mask3.nii.gz -o avg_RD_AgeEffect__tstat3.txt
tbss_fill tbss_RD_AgeEffect_clustere_corrp_tstat3.nii.gz 0.949 mean_RD tbss_RD_AgeEffect_clustere_corrp_tstat3_filled 
cluster -i tbss_RD_AgeEffect_tfce_corrp_tstat3.nii.gz -t 0.95 -c tbss_RD_AgeEffect_tstat3.nii.gz --scalarname="1-p">cluster_RD_AgeEffect_corrp3.txt 
#COPE4
fslmaths tbss_RD_AgeEffect_clustere_corrp_tstat4.nii.gz -thr 0.95 -bin significant_RD_AgeEffect_results_mask4
fslmeants -i all_RD_skeletonised.nii.gz -m significant_RD_AgeEffect_results_mask4.nii.gz -o avg_RD_AgeEffect_tstat4.txt
tbss_fill tbss_RD_AgeEffect_clustere_corrp_tstat4.nii.gz 0.949 mean_RD tbss_RD_AgeEffect_clustere_corrp_tstat4_filled 
cluster -i tbss_RD_AgeEffect_tfce_corrp_tstat4.nii.gz -t 0.95 -c tbss_RD_AgeEffect_tstat4.nii.gz --scalarname="1-p">cluster_RD_AgeEffect_corrp4.txt 

#INT COPE1
fslmaths tbss_RD_AgeInt_clustere_corrp_tstat1.nii.gz -thr 0.95 -bin significant_RD_AgeInt_results_mask1
fslmeants -i all_RD_skeletonised.nii.gz -m significant_RD_AgeInt_results_mask1.nii.gz -o avg_RD_AgeInt_tstat1.txt
tbss_fill tbss_RD_AgeInt_clustere_corrp_tstat1.nii.gz 0.949 mean_RD tbss_RD_AgeInt_clustere_corrp_tstat1_filled 
cluster -i tbss_RD_AgeInt_tfce_corrp_tstat1.nii.gz -t 0.95 -c tbss_RD_AgeInt_tstat1.nii.gz --scalarname="1-p">cluster_RD_AgeInt_corrp1.txt 
#INT COPE2
fslmaths tbss_RD_AgeInt_clustere_corrp_tstat2.nii.gz -thr 0.95 -bin significant_RD_AgeInt_results_mask2
fslmeants -i all_RD_skeletonised.nii.gz -m significant_RD_AgeInt_results_mask2.nii.gz -o avg_RD_AgeInt_tstat2.txt
tbss_fill tbss_RD_AgeInt_clustere_corrp_tstat2.nii.gz 0.949 mean_RD tbss_RD_AgeInt_clustere_corrp_tstat2_filled 
cluster -i tbss_RD_AgeInt_tfce_corrp_tstat2.nii.gz -t 0.95 -c tbss_RD_AgeInt_tstat2.nii.gz --scalarname="1-p">cluster_RD_AgeInt_corrp2.txt 
