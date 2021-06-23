library(tidyverse)

### Open Philly Data Clean Up
open_philly_complaints <- read.csv('open_philly_ppd_complaint.csv',header=T) %>%
  subset(select=-summary) %>%
  mutate(date_received = as.Date(date_received))
open_philly_findings <- read.csv('open_philly_ppd_complaint_findings.csv',header=T) %>% na.omit()

### Joined Open Philly Data
open_philly_data <- open_philly_findings %>% left_join(open_philly_complaints,by='complaint_id') %>%
  filter(date_received >= '2015-04-01' & date_received < '2021-04-01')


### Sam Learner Data Clean Up
sam_philly_complaints <- read.csv('ppd_complaints_7-18.csv', header = T) %>%
  mutate(date_received = as.Date(date_received),complaint_id = cap_number)
sam_philly_findings <- read.csv('ppd_findings.csv',header=T) %>% na.omit()

### To be incorporated when needed
sam_philly_complaints_discipline <- read.csv('ppd_complaint_disciplines_7-18.csv',header=T)
sam_philly_complaints_complainants <- read.csv('ppd_complaint_complainants_7-18_corrected.csv',header=T)

### Joined Sam data 
sam_data <- sam_philly_complaints %>% inner_join(sam_philly_findings,by='complaint_id') %>%
  filter(date_received >= '2015-04-01' & date_received < '2021-04-01')

save(sam_data,open_philly_data,file='philly.RData')
