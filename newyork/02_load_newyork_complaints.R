library(dplyr)
library(readr)

ny_complaints <- read.csv('newyork_police_complaints.csv',header = T) %>%
  mutate(ReceivedDate = as.Date(ReceivedDate,"%m/%d/%Y"),
         CloseDate = as.Date(CloseDate,"%m/%d/%Y"),
         AsOfDate = as.Date(AsOfDate,"%m/%d/%Y"))


save(ny_complaints,file='ny_complaints.RData')