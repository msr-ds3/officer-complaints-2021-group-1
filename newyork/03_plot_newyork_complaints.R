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

### allegations made to each officer (collapsed multiple allegations in one incident into only ONE allegation)
officers_complaints <- ny_complaints %>%
  filter(ReceivedDate >= "2007-01-01" & ReceivedDate < "2018-01-01") %>%
  group_by(OfficerID,ComplaintID,FirstName,LastName,CurrentRankLong) %>%
  summarise() %>% ungroup()

### total number of distinct allegations made to each officer
distinct_complaints <- officers_complaints %>% group_by(OfficerID) %>%
  summarise(num_complaints = n()) %>% ungroup() %>%
  mutate(decile = ntile(num_complaints,10))


distinct_complaints %>%
  group_by(decile) %>%
  summarise(total_complaints = sum(num_complaints)) %>%
  mutate(percent_of_total = total_complaints/sum(total_complaints)) %>%
  ggplot(aes(x=decile,y=percent_of_total)) + geom_histogram(stat = 'identity') +
  ylab("Proportion of complaints") + xlab("Decile")