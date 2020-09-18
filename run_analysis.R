# Get all files
files_dir <- "./UCI HAR Dataset/"
act_labels <- read.table(paste(files_dir,"activity_labels.txt",sep=""))
features <- read.table(paste(files_dir,"features.txt",sep=""))
x_test <- read.table(paste(files_dir,"test/","X_test.txt",sep=""))
y_test <- read.table(paste(files_dir,"test/","y_test.txt",sep=""))
subject_test <- read.table(paste(files_dir,"test/","subject_test.txt",sep=""))
x_train <- read.table(paste(files_dir,"train/","X_train.txt",sep=""))
y_train <- read.table(paste(files_dir,"train/","y_train.txt",sep=""))
subject_train <- read.table(paste(files_dir,"train/","subject_train.txt",sep=""))

# Merge training and testing sets to create one data set
x <- rbind(x_train, x_test) # merge x_train and x_test in x
y <- rbind(y_train, y_test) # merge y_train and y_test in y
subject <- rbind(subject_train, subject_test) # merge subject_train and subject_test in subject
rm(x_test, x_train, y_test, y_train, subject_train, subject_test) # remove unneeded data

# Use features data to assign column names in x dataset
names(x) <- features[,2] ; rm(features)

#Extract only the measurements on the mean and standard deviation for each measurement.
x <- x[,grepl("mean[()]|std[()]", names(x))]

#Appropriately label the x data set with descriptive variable names.
new.names <- names(x)
new.names <- sub("^t", "Time",new.names)
new.names <- sub("^f", "Freq",new.names)
new.names <- sub("mean[(][)]", "Mean",new.names)
new.names <- sub("std[(][)]", "StdDev",new.names)
new.names <- sub("Acc", "Accelerometer",new.names)
new.names <- sub("Gyro", "Gyroscope",new.names)
new.names <- sub("Mag", "Magnitude",new.names)
new.names <- sub("([XYZ])$", "\\1Axis",new.names)
new.names <- gsub("-", "",new.names)
new.names <- gsub("BodyBody", "Body",new.names)
names(x) <- new.names ; rm(new.names)

# Set y as factor vector
y <- unname(factor(unlist(y), levels = 1:6))
# Use activity_labels data to decode y dataset and set factor levels
levels(y) <- tolower(gsub("_"," ",act_labels[,2])); rm(act_labels)

# Set subject as factor vector
subject <- unname(factor(unlist(subject)))

# Merge x, y, and subject into one "tidydata" dataset
tidydata <- cbind(subject,y,x)
# Set "subject" column name to "SubjectID", "y" to "Activity" and keep x column names
names(tidydata) <- c("SubjectID", "Activity", names(x)) ; rm(x, y, subject)

# Create tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
tidymeans <- tidydata %>% group_by(SubjectID,Activity) %>% summarise_all(mean)

# Save new tidy data set to working directory
write.table(tidymeans, "tidymeans.txt") 