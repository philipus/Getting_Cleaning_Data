## getting and cleaning course project

# how to use the script
copy the R script in the main directory of the samsung data. in this directory you can see the test directory and the train directory as well. you need to have installed the package reshape2. it will test if you have a data directory in the main directory. if not the script will create a data directory. in this directory after you will find the tidy_data_set.txt file 

# reading the datas
from train and test directories with read.csv and sep = " "
first I set the columns Names while reading the X data but later I realised setting the colums names using colnames(data) <- features

# reading features
with the features vector I named the columns of the X data. also I took the feature selection using this vector

# feature selection
use grepl() in order to apply grep on a list of strings which are the features in this case. use option fixed = TRUE othewise you also get meanfreq() features in your feature selection

# reading labels
labeled the colums by activity_id and activity itself

# reading subjects
got it later that I need also the subject for the last part. well, each line belongs to an activity of a subject. all together there are not so many subjects in the data set

# Comment
what i didnt like in the data are the missing IDs in X, Y and Subjects which makes the merge simply a cbind()

# putting the data together
merging the train and test data you did using rbind. the atrributes of X, the labels of Y and the subjects of the subject data set you merge using cbind().

# making the tidy data
using the reshape library "reshape2" one can melt the data with melt() and aggregate the data as well with dcast(). for aggregating the data you need to melt the data because here you define the variables. on the variables you apply the mean for averaging the feature selection in the dimension activity an subject 
