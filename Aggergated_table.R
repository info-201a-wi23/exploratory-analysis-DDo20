
project_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-DDo20/main/COVID-19%20Survey%20Student%20Responses.csv")

library(dplyr)
library(stringr)
library(tidyverse)

agg_table <- project_data %>% 
  group_by(Age.of.Subject) %>% 
  summarize(Ave_time_on_class = mean(Time.spent.on.Online.Class), Ave_study_time = mean(Time.spent.on.self.study), Ave_sleep_time = mean(Time.spent.on.sleep), Ave_physical_activity = mean(Time.spent.on.fitness)) %>% filter(Age.of.Subject <= 25) %>% filter(Age.of.Subject >= 15)
                                                                                                






