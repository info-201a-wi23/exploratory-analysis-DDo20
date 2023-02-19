project_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-DDo20/main/COVID-19%20Survey%20Student%20Responses.csv")

library(tidyverse)
library(dplyr)
library(ggplot2)

age_study_df <- project_data %>% 
  select(Age.of.Subject, Time.spent.on.self.study) %>%
  rename("Age" = "Age.of.Subject") %>%
  rename("Self_Study_Time" = "Time.spent.on.self.study")

graph <- ggplot(age_study_df, aes(x = Age, y = Self_Study_Time)) +
  geom_point()

plot(graph +
  scale_x_continuous(breaks = seq(7, 59, by = 1)) +
  scale_y_continuous(breaks = seq(0, 18, by = 2)) +
  labs(
    x = "Age",
    y = "Time spent on Studying (Hours)",
    title = "Relationship between Age and how much time is spent studying",
  )
)
