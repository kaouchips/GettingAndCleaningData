## this codebook script describes the steps to go from the data the original data to the tidy dataset.

# Getting the raw data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(url = url, destfile = temp, method = "curl")
dateDownloaded <- date()
unzip(temp)
unlink(temp)
rm(temp)

# From raw to technically correct data
## Reading text data into R data.frame
### reading features data:
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

### reading training data:
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

### reading testing data:
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)


## QC of data
### checking for variable unicity
unique_features <- unique(features[,2])
is_feature_variable_unique <- length(unique_features) == ncol(features)
if(!is_feature_variable_unique){
      feature_names <- make.names(features$V2, unique = TRUE, allow_ = TRUE)
}      
### other (smaller) variables were checked manually and are unique

#  From technically correct data to consistent data
## Using descriptive activity names to name the activities in the data set
y_test <- merge(y_test, activity_labels, by.x = "V1", by.y = "V1")
y_test <- select(y_test, V2)
colnames(y_test) = "activity"

y_train <- merge(y_train, activity_labels, by.x = "V1", by.y = "V1")
y_train <- select(y_train, V2)
colnames(y_train) = "activity"

## Renaming other columns
colnames(x_test) <- feature_names
colnames(subject_test) <- "subject_id"

colnames(x_train) <- feature_names
colnames(subject_train) <- "subject_id"


## Merging subjects and data 
test_data <- bind_cols(subject_test, y_test, x_test)
train_data <- bind_cols(subject_train, y_train,  x_train)

## Merging the training and the test sets to create one data set
merged_data <- bind_rows(train_data, test_data, .id = "source_id") 

# Extract only the measurements on the mean and standard deviation for each measurement
data <- select(merged_data, 1:3, matches('Mean|std'))

# Write data set
# write.table(data, "data.txt", sep="\t", row.names = FALSE)

# From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject
aggregated_data <- aggregate(data, by=list(data$subject_id, data$activity), FUN=mean)
tidyDataset <- select(aggregated_data, -source_id, -activity, -subject_id)

# Appropriately label the data set with descriptive variable names
names(tidyDataset)[names(tidyDataset)=="Group.1"] <- "subject_id"
names(tidyDataset)[names(tidyDataset)=="Group.2"] <- "activity"


# Write tidy data set
write.table(tidyDataset, "tidy_data.txt", sep="\t", row.names = FALSE)