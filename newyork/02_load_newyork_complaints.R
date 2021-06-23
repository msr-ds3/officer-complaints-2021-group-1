library(dplyr)
library(readr)

ny_complaints <- read.csv('newyork_police_complaints.csv',header = T) %>%
  mutate(ReceivedDate = as.Date(ReceivedDate,"%m/%d/%Y"),
         CloseDate = as.Date(CloseDate,"%m/%d/%Y"),
         AsOfDate = as.Date(AsOfDate,"%m/%d/%Y"))
  

factor_cols = c(5,6,8,9,11,12,16,20,21,22,23,27,29,30,31,32)
ny_complaints[factor_cols] <- lapply(ny_complaints[factor_cols],factor)


save(ny_complaints,file='ny_complaints.RData')