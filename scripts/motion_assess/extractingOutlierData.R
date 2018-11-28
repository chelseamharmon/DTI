subjectList <- read.table("longDataSubjectList_ALL.txt")

names(subjectList) <- "SUB_ID"

subjectList$outlierSlices <- rep(0, nrow(subjectList))
subjectList$relative_outliers <- rep(0, nrow(subjectList))

for (i in 1:nrow(subjectList)){
  file <- paste0("/danl/SB/", subjectList$SUB_ID[i],"/anatomical/DTI/", subjectList$SUB_ID[i], "_eddy.eddy_outlier_map")
  subjectList$exists[i] <- (file.exists(file))
  #  if(file.exists(file)){
  #Get mean Motion
  if(!file.exists(file)){
    print(paste0("no outlier text file for ",  subject, run, ", go fix this!"))
    #subjectList$SUB_ID[i] <- SUB_ID[i]
    subjectList$outlierSlices[i] <- NA
    subjectList$relative_outliers[i] <- NA
  }else{ # if the subject has the run, and the motion folder exists...
    #print(file)
    motionFrame <- read.table(file, stringsAsFactors = F, skip=1)
    names(motionFrame) <- 1:ncol(motionFrame)
#    print(motionFrame)
#    print(colSums(motionFrame))
#    print(nrow(motionFrame))
#    print(ncol(motionFrame))
    colSumsTemp <- colSums(motionFrame)
#    print(sum(colSumsTemp))
    subjectList$outlierSlices[i] <- sum(colSumsTemp)
    subjectList$relative_outliers[i] <- sum(colSumsTemp)/(ncol(motionFrame)+nrow(motionFrame))
  }
}

write.csv(subjectList, file="outlier_data.csv")
