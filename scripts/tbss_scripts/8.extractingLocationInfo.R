data <- read.csv("clusterLocat_AgeEffect.csv")

for (i in 1:length(data$scalar)){
  print("scalar, cope num, cluser num, measurement (ie MAX, COG, COPE-MAX) TRACT LABEL")
  print(paste0(data$scalar[i], "   ", data$cope[i], "   ", data$cluser[i], "   ", data$X[i]))
  command <- paste0("atlasq query jhu-tracts -c ", data$x[i]," ", data$y[i]," ", data$z[i])
  system(command)
}


for (i in 1:length(data$scalar)){
  print("scalar, cope num, cluser num, measurement (ie MAX, COG, COPE-MAX) DTI Label")
  print(paste0(data$scalar[i], "   ", data$cope[i], "   ", data$cluser[i], "   ", data$X[i]))
  command <- paste0("atlasq query jhu-labels -c ", data$x[i]," ", data$y[i]," ", data$z[i])
  system(command)
}
