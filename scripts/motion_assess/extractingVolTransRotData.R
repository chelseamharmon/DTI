subjectList <- read.table("longDataSubjectList_ALL.txt")

names(subjectList) <- "SUB_ID"

subjectList$avgTrans <- rep(0, nrow(subjectList))
subjectList$avgRot <- rep(0, nrow(subjectList))

for (i in 1:nrow(subjectList)){
  file <- paste0("/danl/SB/", subjectList$SUB_ID[i],"/anatomical/DTI/", subjectList$SUB_ID[i], "_eddy.eddy_parameters")
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
    motionFrame <- read.table(file, stringsAsFactors = F, skip=2)
    names(motionFrame) <- c("x_1", "y_1", "z_1", "t_1", "s_1", "w_1")
#       print(motionFrame)
        x <- mean(motionFrame$x_1)
        y <- mean(motionFrame$y_1)
        z <- mean(motionFrame$z_1)
        t <- mean(motionFrame$t_1)
        s <- mean(motionFrame$s_1)
        w <- mean(motionFrame$w_1)
#       print(mean(x, y, z))
    subjectList$avgTrans[i] <- mean(x,y,z)
    subjectList$avgRot[i] <- mean(t,s,w)
  }
}

write.csv(subjectList, file="volTransRot_data.csv")

