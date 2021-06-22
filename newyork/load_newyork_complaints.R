library(dplyr)
library(readr)

ny_complaints <- read.csv('newyork_police_complaints.csv',header = T) %>%
  mutate(ReceivedDate = as.Date(ReceivedDate,"%m/%d/%y"), CloseDate = as.Date(CloseDate,"%m/%d/%y")) %>%
  mutate(OfficerGender = as.factor(OfficerGender)) %>%
  mutate(ImpactedRace = as.factor(ImpactedRace)) %>%
  mutate(ImpactedGender = as.factor)
