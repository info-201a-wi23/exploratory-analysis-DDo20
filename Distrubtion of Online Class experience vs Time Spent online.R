project_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-DDo20/main/COVID-19%20Survey%20Student%20Responses.csv")

library(tidyverse)
library(dplyr)
library(ggplot2)
library(tidyr)

data_filtered <- project_data %>%
  filter(complete.cases(Rating.of.Online.Class.experience)) %>%
  mutate(Rating.of.Online.Class.experience = factor(Rating.of.Online.Class.experience, 
                                                    levels = c("Very Poor", "Poor", "Average", "Good", "Excellent")))

data_filtered$Rating.of.Online.Class.experience[is.na(data_filtered$Rating.of.Online.Class.experience)] <- "Very Poor"

ggplot(data_filtered, aes(x = Time.spent.on.Online.Class, y = Rating.of.Online.Class.experience, fill = Rating.of.Online.Class.experience)) +
  geom_boxplot() +
  labs(title = "Distribution of Online Class Experience by Time Spent Online",
       x = "Time Spent on Online Class",
       y = "Rating of Online Class Experience") +
  theme_classic() +
  scale_fill_manual(values = c("red", "orange", "yellow" , "blue", "green")) +
  scale_y_discrete(limits = c("Very Poor", "Poor", "Average", "Good", "Excellent"), expand = c(0.1, 0)) +
  coord_cartesian(ylim = c(1,5))
