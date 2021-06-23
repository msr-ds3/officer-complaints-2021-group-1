library(tidyverse)

# Cleaning Complaints Data
chi_complaints <- read.csv('chicago_complaints.csv', header=T) %>% na.omit() %>%
  mutate(complaint_date = as.Date(complaint_date), complaint_id = cr_id)

# Cleaning Accused Data
chi_accused <- read.csv('chicago_accused.csv', header=T) %>% na.omit() %>%
  mutate(officer_id = UID)

# Join into 1 csv
chi_data <- chi_accused %>% left_join(chi_complaints, by='cr_id') %>%
  filter(complaint_date>= '2007-01-01' & complaint_date <= '2017-12-31')

save(chi_data, file='chicago.RData')