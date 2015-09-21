setwd("C:/Users/Antonio/Dropbox/Universidade/Data Scientist Toolbox/Getting and Cleaning Data/Project")

#I load relevant data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Merge all
test <- cbind(x_test,y_test,subject_test)
train <-cbind(x_train,y_train,subject_train)
data <- rbind(test,train)

#get list of mean and std variables
features <- read.table("./UCI HAR Dataset/features.txt")

#rename columns
columnNames <- as.vector(features[,2])
columnNames <- c(columnNames,"activity","subject")
names(data) <- columnNames

#index variables of means and std
a <- grep("mean", features$V2)
b <- grep("std",features$V2)

#Compile and add activities and subjects to the list
columns2Keep<- c(a,b,562,563)
#data with just relevant columns
data <- data[,columns2Keep]

#get activity labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
labelList <- as.vector(activities[,2])

#recode
data$activity[data$activity== 1] <-labelList[1]
data$activity[data$activity== 2] <-labelList[2]
data$activity[data$activity== 3] <-labelList[3]
data$activity[data$activity== 4] <-labelList[4]
data$activity[data$activity== 5] <-labelList[5]
data$activity[data$activity== 6] <-labelList[6]

#here is the clean data to fulfill points 1:4

data
#Here I create a different data set
#first empty
#tidyData <- data.frame()

#then split by activity and subject. And input mean value
#for(i in 1:length(levels(as.factor(data$activity)))){
#  cachedata1 <- subset(data, data$activity == labelList[i])
#  
#  for(f in 1:length(levels(as.factor(cachedata1$subject)))){
#    cachedata2 <- subset(cachedata1,cachedata1$subject ==f)  
#    line <- as.vector(c(colMeans(cachedata2[1:79]),i,f))
#    tidyData <- rbind(tidyData,line)
#    }
#}

#names(tidyData) <- names(data)

#write.table(tidyData, file="tidyData.txt", row.name= F)
