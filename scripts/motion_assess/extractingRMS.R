subjectList <- read.table("longDataSubjectList_ALL.txt")

names(subjectList) <- "SUB_ID"

subjectList$RMS_total_mean <- rep(0, nrow(subjectList))
subjectList$RMS_relative_mean <- rep(0, nrow(subjectList))

for (i in 1:nrow(subjectList)){
  file <- paste0("/danl/SB/", subjectList$SUB_ID[i],"/anatomical/DTI/", subjectList$SUB_ID[i], "_eddy.eddy_movement_rms")
  subjectList$exists[i] <- (file.exists(file))
#  if(file.exists(file)){
    #Get mean Motion
    if(!file.exists(file)){
      print(paste0("no rms text file for ",  subject, run, ", go fix this!"))
      #subjectList$SUB_ID[i] <- SUB_ID[i]
      subjectList$RMS_total_mean[i] <- NA
      subjectList$RMS_relative_mean[i] <- NA
    }else{ # if the subject has the run, and the motion folder exists... 
      #print(file)
      motionFrame <- read.table(file, stringsAsFactors = F, skip = 2) 
      names(motionFrame) <- c('RMS_total', 'RMS_relative')
      subjectList$RMS_total_mean[i] <- mean(motionFrame$RMS_total)
      subjectList$RMS_relative_mean[i] <- mean(motionFrame$RMS_relative)
    }
}

write.csv(subjectList, file="rms_data.csv")
