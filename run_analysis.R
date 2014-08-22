##List the files in the directory
list.files(".")


##Read Activity Lables and set column names

Act_Lbl <- read.table(file = "./activity_labels.txt",header = FALSE)

colnames(Act_Lbl) <- c("Id","Activity")


##Read Features and set column names

Features <- read.table(file = "./features.txt",header = FALSE)

colnames(Features) <- c("Id","Feature")


##Read Training Data
y_train <- read.table(file = "./y_train.txt",header = FALSE)

x_train <- read.table(file = "./x_train.txt",header = FALSE)

subject_train <- read.table(file = "./subject_train.txt",header = FALSE)

##Assign Column Names for Training Data

colnames(y_train) <- c("Activity_Id")

    ##Step 4. Appropriately labels the data set with descriptive variable names. 
colnames(x_train)<- Features[,2]

colnames(subject_train) <- c("Subject")

##Read Test Data
y_test <- read.table(file = "./y_test.txt",header = FALSE)

x_test <- read.table(file = "./x_test.txt",header = FALSE)

subject_test <- read.table(file = "./subject_test.txt",header = FALSE)


##Assign Column Names for test data
colnames(y_test) <- c("Activity_Id")

    ##Step 4. Appropriately labels the data set with descriptive variable names. 
colnames(x_test)<- Features[,2]

colnames(subject_test) <- c("Subject")



##Combine X , Y and Subject data

test_sub <- cbind(y_test,subject_test)

train_sub <- cbind(y_train,subject_train)


test <- cbind(x_test,test_sub)

train <- cbind(x_train,train_sub)



## Add new column to differentiate the records
test$Data_Set <- c("test")
train$Data_Set <- c("train")

##Combine test and training
##Step 1. Merges the training and the test sets to create one data set.

dat <- rbind(test,train)

##dataset with only mean and std columns
##Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
dat_mean_std <- dat[,grep("mean\\(\\)|std|Subject|Activity",colnames(dat))]


##Use plyr package
library(plyr)

##Step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Set <- ddply(dat_mean_std[,! colnames(dat_mean_std) %in% c("Data_Set") ],.(Subject,Activity_Id) , numcolwise(mean))


## Merge Y and Activity Lables
## Step 3. Uses descriptive activity names to name the activities in the data set
Data <- merge(Act_Lbl,Set,by.x="Id",by.y="Activity_Id",all=TRUE)

Data <- Data[,c(-1)]


##Read New Column Names and set column names
## Step 4. Appropriately labels the data set with descriptive variable names

New_Names <- read.table(file = "./New_Names.txt",header = FALSE)

colnames(Data)<- New_Names[,1]


## Write data to a file

write.table(Data, "./TidyData.txt", sep="\t", row.names= FALSE)

## Read data again and check if its readable in R and if columns and rows match
reread <- read.table("./TidyData.txt", header = TRUE)
nrow(Data) == nrow(reread)
# [1] TRUE
ncol(Data) == ncol(reread)
# [1] TRUE


