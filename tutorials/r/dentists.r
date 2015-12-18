library('dplyr')

setwd('/Users/podium/Downloads') #remember to set this as the working directory on *your machine*

#before you run this step, be certain to find a replace # in the text file with a single space

#read the fixed width file into a dataframe called dentists
dentists <- read.fwf('Pratt.txt', widths=c(2,1,6,36,21,21,21,19,2,9,2,6,1,3,8,4,1,1,8,25), header=F)

#use this function to rename your columns by pushing a vector of column names into the names() function
#names(dentists) <- c("col1", "col2", "col3"...)

#make a subset of your dataframe
small_dentists <- dentists %>% 
  select(V2:V6, V20)