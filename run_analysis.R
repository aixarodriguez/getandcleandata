#libraries
library(stringr)
library(dplyr)

#download file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip")

#features & activity
features<-read.table(unz("data.zip", "UCI HAR Dataset/features.txt"))
activity<-read.table(unz("data.zip", "UCI HAR Dataset/activity_labels.txt"))

#reading test files
subject_test<-read.table(unz("data.zip", "UCI HAR Dataset/test/subject_test.txt"))
x_test<-read.table(unz("data.zip", "UCI HAR Dataset/test/X_test.txt"))
y_test<-read.table(unz("data.zip", "UCI HAR Dataset/test/y_test.txt"))

#reading train files
subject_train<-read.table(unz("data.zip", "UCI HAR Dataset/train/subject_train.txt"))
x_train<-read.table(unz("data.zip", "UCI HAR Dataset/train/X_train.txt"))
y_train<-read.table(unz("data.zip", "UCI HAR Dataset/train/y_train.txt"))

#set column names
names(x_test)<-features[,2]
names(x_train)<-features[,2]
names(activity)<-c("activitycode","activity")
names(y_test)<-c("activitycode")
names(y_train)<-c("activitycode")
names(subject_test)<-c("subject")
names(subject_train)<-c("subject")

#set activities
y_test<-merge(y_test,activity,by.x="activitycode",by.y="activitycode",all.x=TRUE)
y_train<-merge(y_train,activity,by.x="activitycode",by.y="activitycode",all.x=TRUE)

#define data_set
test_dataset<-cbind(subject_test,y_test,x_test)
test_dataset$set_type="test"
train_dataset<-cbind(subject_train,y_train,x_train)
train_dataset$set_type="train"

#combined data_set
test_train<-rbind(test_dataset,train_dataset)

#extract mean and std measurement
column_names<-colnames(test_train)
test_train_ms<-test_train[,grepl("activity|subject|[Mm]ean|[Ss]td",column_names)==TRUE]

#get result average group by activity and subject for each measurement
test_train_res<-test_train_ms %>% 
                group_by(activitycode,activity,subject) %>% 
                summarise_each(funs="mean") %>% 
                arrange(activitycode,subject)
write.csv(test_train_res,"tydi_average.csv")
