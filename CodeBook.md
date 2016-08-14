The following describes the data and transformations when converting the
UCI smartphone motion sensor mean and std values into a tidy dataset.

The TidyDataSet Output

1) Activity in col 1: The subject activity performed for this row (observation):
    WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING
    
A) These descriptive values were added by replacing y_test/train.txt 
integers that matched the X_test.txt and X_train.txt observation rows 
via a lookup and replacement using activity_labels.txt.
    
2) Subject in col 2
An integer representing the subject who performed the 
activity for a row.  Range is 1-30.

3) The measurements averages are in colums 3-88.  

These columns are a subsample 
of all measurements in columns of X_test.txt and X_train.txt where the 
"mean"" or "std" was in the text name as found in features.txt.  

This tidy data set then averages these chosen measurements by taking the
mean on the aggregation of each (Activity,Subject) combination.

The Measurement column name matches those in .\Data\features.txt 
except for the following transformations to improve readable after import

A) An underscore "_" replaced "()", "(" or")" when text was between 
(), "-". and ",".

B) The measurement name roughly follows this pattern

    [t | f | angle][Body | Gravity]_[mean | std][Axis]
    
    Axis is optional.
    To find the meaning of these column values reference "./data/README.txt"
    
C) Units for the averages are identical to the sensor units per 
"./data/README.txt".  Therefore, acc units are standard gravity units while 
angular gyro measurements are in radians/second.
