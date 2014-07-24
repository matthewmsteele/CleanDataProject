#==============================================#
# Getting and Cleaning Data Course Project     #
# Matt Steele                                  #
#==============================================#

##=========== Read in data files ==================

#               Read in feature names 
features <- read.table("features.txt")

#               Select only mean and standard deviation features
featLogical <- grepl("mean\\(",features[,2]) | grepl("std",features[,2])
features <- features[featLogical,2]

#               Clean feature names
features <- gsub("-",".",features)
features <- gsub("[()]","",features)

#               Read in Train and Test data
colClasses <- rep("NULL",length(featLogical))
colClasses[featLogical] <- "numeric"

#                       Read main data file
trainData <- read.table("train/X_train.txt",colClasses=colClasses)
testData <- read.table("test/X_test.txt",colClasses=colClasses)
names(trainData) <- features
names(testData) <- features

#                       Read activities file
activityNames <- read.table("activity_labels.txt",colClasses=c("NULL","character")
                            ,stringsAsFactors=FALSE)[[1]]
trainData["activity"] <- read.table("train/y_train.txt",colClasses="integer")
testData["activity"] <- read.table("test/y_test.txt",colClasses="integer")
trainData["activity"] <- factor(trainData$activity,labels=activityNames)
testData["activity"] <- factor(testData$activity,labels=activityNames)

#                       Read subject identification file
trainData["subject"] <- read.table("train/subject_train.txt",colClasses="integer")
testData["subject"] <- read.table("test/subject_test.txt",colClasses="integer")


#================== Combine train and test data frames ========================

allData <- rbind(trainData,testData)

#=========== Create second tidy dat set of averages by activity and subject ===

#               Split on activity and subject
splitData <- split(allData,list(allData$activity,allData$subject),drop=TRUE)

#               Find averages for each variable
avgData <- sapply(splitData,function(x) colMeans(x[,features]))

#               tidy up resulting data
tidy2Data <- as.data.frame(t(avgData))
names(tidy2Data) <- paste("AVG.",names(tidy2Data),sep="")

tmpNames <- strsplit(names(splitData),"\\.")
tmpNames <- unlist(tmpNames)
dim(tmpNames) <- c(2,180)
tmpNames <- t(tmpNames)
tidy2Data$activity <- tmpNames[,1]
tidy2Data$subject <- tmpNames[,2]

#=============== Output to files ===============================
write.table(allData,"tidy_data1.txt")
write.table(tidy2Data,"tidy_data2.txt")
