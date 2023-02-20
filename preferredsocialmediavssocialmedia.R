data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-DDo20/main/COVID-19%20Survey%20Student%20Responses.csv")
library(dplyr)
library(ggplot2)
library(stringr)
data$Prefered.social.media.platform <- gsub ("Whatsapp", "WhatsApp", data$Prefered.social.media.platform)
data$Prefered.social.media.platform <- gsub ("None ", "None", data$Prefered.social.media.platform)
graph_data <- data %>% group_by(Prefered.social.media.platform) %>%
  summarize(avg_time_spent = mean(Time.spent.on.social.media, na.rm = TRUE))
ggplot(data = graph_data) +
  geom_col(mapping= aes(x= Prefered.social.media.platform, y= avg_time_spent, fill = Prefered.social.media.platform)) + 
  labs(
    title = "Average Amount of Time Spent on Prefered Media Platform",
    x = "Platform",
    y = "Average Amount of Hours Spent",
  ) +
  theme(legend.position="none") +
  scale_fill_manual(values = c("#bc66fa", "#1f5aa3", "#fc30a7", "#096be3", "#000000", "#fc8a17", "#a60c0c", "#fa4402", "#ffdd03", "#945adb", "#52d9f7", "#52bbf7", "#04b804", "#fa0202"))
# Color of the logo of the app.
# Used a bar chart because comparing a specific continuous value for different categories in one group.
