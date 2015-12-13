library('dplyr')
library('readxl')

setwd("/Users/podium")

spreadsheet = "nassau_police_union_contribs.xls"

cops <- read_excel(spreadsheet, sheet=1, col_names=TRUE)

summary(cops)

hist(cops$AMOUNT, labels=TRUE, xlab="donations", plot=TRUE)

plot(cops$AMOUNT)

names(cops)<-make.names(names(cops),unique=TRUE)

plot(cops$AMOUNT, cops$Zip.Code)
options(scipen=999)