setwd("C:/Users/JONAH/Documents/Data Cleaning/WEEK 4/UCI HAR Dataset")

###step 1 - merge

#train data
train1data <- read.table("./train/X_train.txt", header = FALSE, sep = "", dec = ".")
train2data <- read.table("./train/y_train.txt")
train3data <- read.table("./train/subject_train.txt")
train <- rep(1,nrow(train1data))
traindata <- cbind(train3data, train, train2data, train1data)
mycol <- read.table("./features.txt")
mycol <- t(mycol)
names(traindata) <- c("subject", "partition", "activity", mycol[2,])

#test data
test1data <- read.table("./test/X_test.txt", header = FALSE, sep = "", dec = ".")
test2data <- read.table("./test/y_test.txt")
test3data <- read.table("./test/subject_test.txt")
test <- rep(2,nrow(test1data))
testdata <- cbind(test3data, test, test2data, test1data)
names(testdata) <- c("subject", "partition", "activity", mycol[2,])

mydata <- rbind(traindata,testdata)

###step 2 - extract
meanstd <- (grepl("subject", colnames(mydata)) | grepl("activity", colnames(mydata)) | grepl("mean()", colnames(mydata)) | grepl("std()", colnames(mydata)) )
extrdata <- mydata[, meanstd==TRUE]

###step 3 & 4 - describe and label
actlabel <- read.table("./activity_labels.txt", header = FALSE)
names(actlabel) <- c("activity", "activitylabel")
extrdatawlabel <- merge(extrdata, actlabel, by="activity", all.x=TRUE)

###step 5 - create tidy data
tidydata <- aggregate(. ~subject + activity, extrdatawlabel, mean)
tidydata <- tidydata[order(tidydata$subject, tidydata$activity),]

write.table(tidydata, "tidydata.txt", row.name=FALSE)
