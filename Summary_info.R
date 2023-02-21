
project_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-DDo20/main/COVID-19%20Survey%20Student%20Responses.csv")

library(dplyr)
library(stringr)

# 1. Minimum student age
Max_age <- project_data %>% 
  filter(Age.of.Subject == max(Age.of.Subject, na.rm = TRUE)) %>% 
  pull(Age.of.Subject)

# 2. Maximum student age
Min_age <- project_data %>% 
  filter(Age.of.Subject == min(Age.of.Subject, na.rm = TRUE)) %>% 
  pull(Age.of.Subject)

# 3 & 4 Percentage of Responses that had or did not have a health issue during the lock down.
Healthy <- project_data %>% 
  filter(Health.issue.during.lockdown == "NO") %>%
  group_by(Health.issue.during.lockdown) %>% 
  summarize(healthy = sum(Health.issue.during.lockdown == "NO"), na.rm = T) %>% 
  pull(healthy)

Not_healthy <- project_data %>% 
  filter(Health.issue.during.lockdown == "YES") %>% 
  group_by(Health.issue.during.lockdown) %>% 
  summarize(nothealthy = sum(Health.issue.during.lockdown == "YES"), na.rm = T) %>% 
  pull(nothealthy)

# 5. Number of students that felt like they had poor/very poor class experience.
Poor_class_experience <- project_data %>%
  filter(Rating.of.Online.Class.experience %in% c("Poor", "Very poor"))

Num_poor_class_experience <- nrow(Poor_class_experience)

# Summary info combined
sum_info <- list()
sum_info$Max_age <- Max_age
sum_info$Min_age <- Min_age
sum_info$Not_healthy <- Not_healthy
sum_info$Healthy <- Healthy
sum_info$Poor_class_experience <- Poor_class_experience
sum_info$Num_poor_class_experience <-Num_poor_class_experience