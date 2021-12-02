
library(dplyr)
library(lubridate)
library(tidyverse)
library(tidytext)
library(stringr)
library(tm)

#load csv into variable
primary <- read.csv('/Users/aster/Desktop/Fall 21/data_lib/final_project/info628_final-project_fair-is/data/processed_data/csv/primary_data.csv'
, skip=0, header=TRUE,)

#get column names just to make sure
names(primary)

#Cleaning Steps:
#make lower case title text and abstract text
primary[c('title', 'abstract')] <- sapply(primary[c('title', 'abstract')], function(x) tolower(x))
head(primary,1)


#remove punctuation
primary[c('title', 'abstract')] <- sapply(primary[c('title', 'abstract')], function(x) removePunctuation(x))
head(primary,1)

#removing stopwords
primary[c('title', 'abstract')] <- sapply(primary[c('title', 'abstract')], function(x) removeWords(x, stopwords('en') ))
head(primary,1)

#removing numbers
primary[c('title', 'abstract')] <- sapply(primary[c('title', 'abstract')], function(x) removeNumbers(x))
head(primary,1)

#striping whitespace
primary[c('title', 'abstract')] <- sapply(primary[c('title', 'abstract')], function(x) stripWhitespace(x))
head(primary,1)

#export cleaned csv for pre-processing in python
write.csv(primary,'/Users/aster/Desktop/Fall 21/data_lib/final_project/info628_final-project_fair-is/data/processed_data/csv/cleaned_primary_data_12022021.csv', row.names=FALSE )

#-----------------
#inspecting our csv
qa = read.csv('/Users/aster/Desktop/Fall 21/data_lib/final_project/info628_final-project_fair-is/data/processed_data/csv/cleaned_primary_data_12022021.csv', skip=0, header=TRUE,)
head(qa,1)
