subjectList <- read.table("../../autoptx/preproc/subjectList.txt", stringsAsFactors=F)
tractList <- read.table("../../autoptx/preproc/tractList.txt")

names(tractList) <- "tracts"
names(subjectList) <- "SUB_ID"

subList  <-  data.frame(SUB_ID=rep(subjectList$SUB_ID[1],6), l=1:6, r=1:6, tract=1:6)

for (i in 1:nrow(subjectList)){
	for (ii in 1:length(tractList$tracts)){
	          		 name_temp1 <- paste0(tractList$tracts[ii], "_l_FA")
	          		 path1 <- paste0("../../autoptx/visualise/th_0.005/",subjectList$SUB_ID[i],"/", name_temp1, ".txt")
	          		 l_FA_temp <- read.table(path1)
	          		 subList$l[subList$l==ii]<- l_FA_temp[1,1]
		             name_temp2 <- paste0(tractList$tracts[ii], "_r_FA")
		             path2 <- paste0("../../autoptx/visualise/th_0.005/", subjectList$SUB_ID[i], "/", name_temp2, ".txt")
		             r_FA_temp <- read.table(path2)
		             subList$r[subList$r==ii] <- r_FA_temp[1,1]
		             subList$tract[subList$tract==ii] <- paste0(tractList$tracts[ii], "_FA")
	}
	j <- i +1
	subListTemp <- data.frame(SUB_ID=rep(subjectList$SUB_ID[j],6), l=1:6, r=1:6, tract=1:6)
	subList <- rbind(subList, subListTemp)
}

allTracts_FA <-(subList[1:(nrow(subList)-6),])


write.csv(allTracts_FA, file="../../autoptx/visualise/allTracts_FA0.005.csv")


subList  <-  data.frame(SUB_ID=rep(subjectList$SUB_ID[1],6), l=1:6, r=1:6, tract=1:6)

for (i in 1:nrow(subjectList)){
	for (ii in 1:length(tractList$tracts)){
	          		 name_temp1 <- paste0(tractList$tracts[ii], "_l_MD")
	          		 path1 <- paste0("../../autoptx/visualise/th_0.005/",subjectList$SUB_ID[i],"/", name_temp1, ".txt")
	          		 l_FA_temp <- read.table(path1)
	          		 subList$l[subList$l==ii]<- l_FA_temp[1,1]
		             name_temp2 <- paste0(tractList$tracts[ii], "_r_MD")
		             path2 <- paste0("../../autoptx/visualise/th_0.005/", subjectList$SUB_ID[i], "/", name_temp2, ".txt")
		             r_FA_temp <- read.table(path2)
		             subList$r[subList$r==ii] <- r_FA_temp[1,1]
		             subList$tract[subList$tract==ii] <- paste0(tractList$tracts[ii], "_MD")
	}
	j <- i +1
	subListTemp <- data.frame(SUB_ID=rep(subjectList$SUB_ID[j],6), l=1:6, r=1:6, tract=1:6)
	subList <- rbind(subList, subListTemp)
}

allTracts_MD <-(subList[1:(nrow(subList)-6),])


write.csv(allTracts_MD, file="../../autoptx/visualise/allTracts_MD0.005.csv")


subList  <-  data.frame(SUB_ID=rep(subjectList$SUB_ID[1],6), l=1:6, r=1:6, tract=1:6)

for (i in 1:nrow(subjectList)){
	for (ii in 1:length(tractList$tracts)){
	          		 name_temp1 <- paste0(tractList$tracts[ii], "_l_AD")
	          		 path1 <- paste0("../../autoptx/visualise/th_0.005/",subjectList$SUB_ID[i],"/", name_temp1, ".txt")
	          		 l_FA_temp <- read.table(path1)
	          		 subList$l[subList$l==ii]<- l_FA_temp[1,1]
		             name_temp2 <- paste0(tractList$tracts[ii], "_r_AD")
		             path2 <- paste0("../../autoptx/visualise/th_0.005/", subjectList$SUB_ID[i], "/", name_temp2, ".txt")
		             r_FA_temp <- read.table(path2)
		             subList$r[subList$r==ii] <- r_FA_temp[1,1]
		             subList$tract[subList$tract==ii] <- paste0(tractList$tracts[ii], "_AD")
	}
	j <- i +1
	subListTemp <- data.frame(SUB_ID=rep(subjectList$SUB_ID[j],6), l=1:6, r=1:6, tract=1:6)
	subList <- rbind(subList, subListTemp)
}

allTracts_AD <-(subList[1:(nrow(subList)-6),])


write.csv(allTracts_AD, file="../../autoptx/visualise/allTracts_AD0.005.csv")


subList  <-  data.frame(SUB_ID=rep(subjectList$SUB_ID[1],6), l=1:6, r=1:6, tract=1:6)

for (i in 1:nrow(subjectList)){
	for (ii in 1:length(tractList$tracts)){
	          		 name_temp1 <- paste0(tractList$tracts[ii], "_l_RD")
	          		 path1 <- paste0("../../autoptx/visualise/th_0.005/",subjectList$SUB_ID[i],"/", name_temp1, ".txt")
	          		 l_FA_temp <- read.table(path1)
	          		 subList$l[subList$l==ii]<- l_FA_temp[1,1]
		             name_temp2 <- paste0(tractList$tracts[ii], "_r_RD")
		             path2 <- paste0("../../autoptx/visualise/th_0.005/", subjectList$SUB_ID[i], "/", name_temp2, ".txt")
		             r_FA_temp <- read.table(path2)
		             subList$r[subList$r==ii] <- r_FA_temp[1,1]
		             subList$tract[subList$tract==ii] <- paste0(tractList$tracts[ii], "_RD")
	}
	j <- i +1
	subListTemp <- data.frame(SUB_ID=rep(subjectList$SUB_ID[j],6), l=1:6, r=1:6, tract=1:6)
	subList <- rbind(subList, subListTemp)
}

allTracts_RD <-(subList[1:(nrow(subList)-6),])


write.csv(allTracts_RD, file="../../autoptx/visualise/allTracts_RD0.005.csv")

write.csv(cbind(allTracts_FA, allTracts_MD[,2:4], allTracts_AD[,2:4], allTracts_RD[,2:4]), file="../../autoptx/visualise/allTracts_0.005.csv")
