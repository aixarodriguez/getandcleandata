# Code Book - Getting and Cleaning Data Project

## Variables
  - features -> Datatable containing the extraction from features.txt
  - activity -> Datatable containing the extraction from activity_labels.txt
  - subject_test -> Datatable containing the extraction from subject_test.txt
  - x_test -> Datatable containing the extraction from X_test.txt
  - y_test -> Datatable containing the extraction from y_test.txt
  - subject_train -> Datatable containing the extraction from subject_train.txt
  - x_train -> Datatable containing the extraction from X_train.txt
  - y_train -> Datatable containing the extraction from y_train.txt
  - test_dataset -> Result of combine data from subject_test, x_test and y_test
  - train_dataset -> Result of combine data from subject_train, x_train and y_train
  - test_train -> Result of merging test and train datasets
  - column_names -> List of column names from dataset test_train
  - test_train_ms -> Extract from dataset test_train the columns with certain especifications (activity,subject,mean and std)
  - test_train_res -> Final dataset with the average of each variable for each activity and each subject

## Functions
  - download.file -> Download the data file from url provided 
  - unz -> Unzip the file in temporal (memory)
  - read.table -> Gets the corresponding file from zip into a dataset
  - names -> Gets or set the names to a dataset
  - merge -> Join two or more datasets using a pivot column
  - cbind -> Combine columns from two or more datasets
  - rbind -> Merge rows from two or more datasets
  - colnames -> Gets a list of column names from a dataframe
  - grepl -> Obtains a TRUE/FALSE vector resulting from string search a pattern
  - group_by -> Group a dataset in a set of criterias
  - summarise_each -> Summarize from all columns with an specific function
  - arrange -> Orders a dataset based in a criteria
