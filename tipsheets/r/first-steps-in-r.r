library("dplyr")
library('readxl')
library('RCurl')

getwd()
setwd()

#import in the exonerations data
exos <- read.csv("~/dev/personal/data-1/datasets/r/exonerations-20150828.csv", header = T, strip.white = T, sep=",", stringsAsFactors=TRUE)
#most common charge of exonerees?


#look at one variable(column) vector
exos$last_name

#give me my column names
names(exos)

#give me some overall summary stats for the whole dataframe
summary(exos)
#give me summary stats for just one column
summary(exos$age)

#How can I plot a histogram?
?hist

#histogram the ages
hist(exos$age)
#plot the ages versus the years
plot(exos$age, exos$exonerated)

#show me just the people who are younger than the median and select only a few certain variables
exos %>%
  filter(age<26) %>%
  select(state, age)

#let's import an Excel spreadsheet
#what's the max and min donation amount?
spreadsheet = "~/dev/personal/data-1/datasets/excel/nassau_police_union_contribs.xls"
cops = read_excel(spreadsheet, sheet=1, col_names=TRUE)

summary(cops)

#let's histogram the donations
hist(cops$AMOUNT, labels=TRUE, xlab="xname", plot=TRUE)

#let's plot them
plot(cops$AMOUNT)

cops %>%
  filter(AMOUNT<1000)

pay <- read.csv("~/dev/personal/data-1/datasets/excel/payrolldelimited3.txt", header = T, strip.white = T, sep=",", stringsAsFactors=FALSE)
#average years of service?

summary(pay)

hist(pay$Years.of.Service)
#when things go awry, we'll talk next week about changing data types and cleaning data in R
