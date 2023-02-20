data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-DDo20/main/COVID-19%20Survey%20Student%20Responses.csv")
library(dplyr)
library(ggplot2)
library(stringr)
graph_data <- data %>% group_by(Prefered.social.media.platform) %>%
  summarize(avg_time_spent = mean(Time.spent.on.social.media, na.rm = TRUE))
ggplot(data = graph_data) +
  geom_col(mapping= aes(x= Prefered.social.media.platform, y= avg_time_spent, fill = Prefered.social.media.platform)) + 
  labs(
    title = "Average Amount of Time Spent on Prefered Media Platform",
    x = "Platform",
    y = "Average Amount of Hours Spent",
  ) +
  theme(legend.position="none")

