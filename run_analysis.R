## Process and refine Wareable Data per assignment
## Getting and Cleaning Data Course Project
## See Codebook.md and Readme.md for description of solution.
## 
library(dplyr)
library(reshape2)
library(tidyr)

## Get names for feature columns 
headerFeatures <- read.table('./data/features.txt',header=FALSE)

# Make frames for test and training data applying column names
trainSetFeatures <- read.table('./data/train/X_train.txt',header=FALSE,dec='.',
                            col.names = headerFeatures[,2])
testSetFeatures <- read.table('./data/test/X_test.txt',header=FALSE,dec='.',
                           col.names = headerFeatures[,2])

## Add acitvity domain codes to feature data. 
trainActivity <- read.table('./data/train/y_train.txt',
                         header=FALSE,dec='.', col.names = c("Activity"))
trainSetFeatures$Activity <- trainActivity[,1]

testActivity <- read.table('./data/test/y_test.txt',
                        header=FALSE,dec='.', col.names = c("Activity"))
testSetFeatures$Activity <- testActivity[,1]

## Add the subject domain to the feature data set
trainSubject <- read.table('./data/train/subject_train.txt',
                        header=FALSE,dec='.', col.names = c("Subject"))
trainSetFeatures$Subject <- trainSubject[,1]

testSubject <- read.table('./data/test/subject_test.txt',
                       header=FALSE,dec='.', col.names = c("Subject"))
testSetFeatures$Subject <- testSubject[,1]

# Combine test and training data sets.
features <- rbind(testSetFeatures,trainSetFeatures)

# Reduce columns to the necessary mean and std feature columns
features <- features[,grep('[Mm]ean|[Ss]td|Activity|Subject',
                           colnames(features))]

## Convert activity codes to descriptive activity codes 
activityLabelLookup <- read.table('./data/activity_labels.txt',
                                  header=FALSE,dec='.', 
                                  col.names = c("Index","Name"))
features$Activity <- activityLabelLookup[match(features$Activity,
                                               activityLabelLookup$Index),2]
# Clean measurement names
colnames(features) <- gsub('\\.+','_',colnames(features))


# Create tidy summary dataset into long with feature column
# (While wide would be nice long seems more customer friendly)
meltedFeatures = melt(features,id=c("Activity","Subject"))
tidyMeanFeatures = dcast(meltedFeatures ,Activity+Subject ~ variable, mean)


# Write tidy data set  
write.csv(tidyMeanFeatures,"TidyDataSet.csv")
