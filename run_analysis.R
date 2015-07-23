# 0. read data
testData <- read.table('UCI HAR Dataset/test/X_test.txt')
trainData <- read.table('UCI HAR Dataset/train/X_train.txt')

# 1. merge data
mergedData <- rbind(testData,trainData)

# 2. extracts mean and deviation
features <- read.table('UCI HAR Dataset/features.txt')
meanStdCols <- features[grep("mean\\(\\)|std\\(\\)", features$V2),"V1"]
msOnly <- mergedData[,meanStdCols]

# 3. activity names
testLabel <- read.table('UCI HAR Dataset/test/y_test.txt')
trainLabel <- read.table('UCI HAR Dataset/train/y_train.txt')
mergedLabel <- rbind(testLabel,trainLabel)
activityLabel <- read.table('UCI HAR Dataset/activity_labels.txt')

mergedLabel$id <- 1:nrow(mergedLabel)
activityNames <- merge(mergedLabel, activityLabel, by="V1")
activityNamesOrdered <- activityNames[order(activityNames$id),]

# 4. variable names
colnames(msOnly) <- features[meanStdCols,]$V2
msOnly$activityName <- activityNamesOrdered$V2

# 5. second dataset
# add subject
testSubject <- read.table('UCI HAR Dataset/test/subject_test.txt')
trainSubject <- read.table('UCI HAR Dataset/train/subject_train.txt')
mergedSubject <- rbind(testSubject,trainSubject)

msOnly$subject <- mergedSubject$V1

# create second dataset
# split by activity and subject
sps <- split(msOnly[,1:(ncol(msOnly)-2)], list(msOnly$activityName, msOnly$subject), drop=TRUE)
# apply mean function
tidyMatrix <- sapply(sps, function(x) {sapply(x, mean)})
# transpose so that variables are columns
tidyMatrix <- t(tidyMatrix)

# write to file
write.table(tidyMatrix, "tidy.txt", row.names=FALSE)
