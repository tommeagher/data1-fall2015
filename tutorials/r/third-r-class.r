library('dplyr')

setwd('Downloads')#be sure to put YOUR working director inhere in quotes

#now let's do a join
exos <- read.csv("exonerations-20150828.csv", header = T, strip.white = T, sep=",", stringsAsFactors=TRUE)

#go to http://statetable.com/ and download a csv with regional info.
geos <- read.csv("~/Downloads/state_table.csv", header=TRUE)

#what region has the most exonerations? Which census division?
joined <- left_join(exos, geos, by = c("state"="abbreviation"))

#what region has the most exonerations?
joined %>%
  group_by(census_region_name) %>%
  count(census_region_name)

#create a new dataframe
to_csv <- joined %>%
  group_by(census_division_name) %>%
  count(census_division_name) %>%
  arrange(desc(n))

#what do these divisions mean?
joined %>%
  filter(census_division_name=="West South Central") %>%
  select(state) %>%
  distinct(state)

write.table(to_csv, file="exonerations_by_region.csv")