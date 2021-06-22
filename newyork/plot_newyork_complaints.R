# set up libraries and options
library(tidyverse)
library(dplyr)
library(ggplot2)
library(scales)
library(modelr)
library(lubridate)

theme_set(theme_bw())
options(repr.plot.width=4, repr.plot.height=3)

### read in new york data
load('ny_complaints.RData')

### get number of complaints by Officer ID
officers_complaints <- ny_complaints %>% group_by(OfficerID,FirstName,LastName,CurrentRankLong) %>%
  summarise(num_complaints = n()) %>% ungroup() %>% mutate(decile = ntile(num_complaints,10))

officers_complaints %>%
  group_by(decile) %>%
  summarise(total_complaints = sum(num_complaints)) %>%
  mutate(percent_of_total = total_complaints/sum(total_complaints)) %>%
  ggplot(aes(x=decile,y=percent_of_total)) + geom_histogram(stat = 'identity') 