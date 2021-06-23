library(tidyverse)
library(ggplot2)
library(scales)
library(modelr)
library(lubridate)

load('philly.RData')

### Load in data

open_philly_officers <- open_philly_data %>% select(complaint_id,officer_id,date_received) %>% filter()
sam_officers <- sam_data %>% select(complaint_id,officer_id,date_received) %>% filter(date_received < '2016-01-11')
plot_data <- open_philly_officers %>% full_join(sam_officers,by=c('complaint_id','officer_id','date_received'))

### Plot

plot_data_distinct <- plot_data %>% group_by(officer_id) %>%
  summarise(num_complaints = n()) %>%
  ungroup() %>%
  mutate(decile = ntile(num_complaints,10))

plot_data_distinct %>%
  group_by(decile) %>%
  summarise(total_complaints = sum(num_complaints)) %>%
  mutate(percent_of_total = total_complaints/sum(total_complaints)) %>%
  ggplot(aes(x=decile,y=percent_of_total)) + geom_histogram(stat = 'identity') +
  ylab("Proportion of complaints") + xlab("Decile")