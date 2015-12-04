#import our libraries
#this library handles excel files
library('readxl')
#this library helps wrangle data
library('dplyr')

#this is a comment. Any line that starts with # is a note for humans to read and will not be run as part of the program.

#what working directory are we in? 
getwd()
#let's set the new working directory to whatever directory we're in.
setwd('/Users/podium')#this will be different on each machine you're working on. Remember, you can find this in terminal if you need to

#to run each line of code and to see the results in the console, put your cursor on that line and hit the command and Enter keys at the same time.

#now, let's import our csv into our new exonerations dataframe
exonerations <- read.csv('exonerations-20150828.csv', header = T, strip.white = T, sep = ",", stringsAsFactors = TRUE)

#if we need help with any R function, you can ask for help with the ?
?read.csv
#or with the help function
help(read.csv)

#now let's list the names of our columns, or variables as they're called in R, with the names() function
names(exonerations)

#the summary() function will give us statistics on each column in our dataframe
summary(exonerations)

#to examine just one column at a time, use the $ after the name of the dataframe to call on a column, in this case the last_name variable
exonerations$last_name

#you can also use the summary() function on a single column
summary(exonerations$crime)

#now we're going to start using some of dplyr's data wrangling functions.
#start with our dataframe, and pipe that with the %>% to the dplyr functions.
#remember the shortcut for the %>% is to hold the command, shift and m keys at the same time.
exonerations %>% 
  #the filter() function will give us only the rows that meet our criteria. here we want rows where the exoneree's age was less than 26
  filter(age<26) %>% 
  #the select() function returns only the variables (columns) we specify: state and age
  select(state, age)

#with the hist() function, we can make a quick plot of the distribution of values in the age variable
hist(exonerations$age)
