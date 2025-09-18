library(tidyverse)

ironman_data = read.csv("https://data.scorenetwork.org/data/ironman_lake_placid_female_2022.csv")
ironman_data %>%
  ggplot(aes(x = Bike.Time, y=Run.Time)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") + 
  theme_bw()

ironman_data %>%
  ggplot(aes(x = Bike.Time, y = Swim.Time)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") + 
  theme_bw()

B_SModel <- lm(Swim.Time ~ Bike.Time, data = ironman_data)
ironman_data <- ironman_data %>%
  filter(Swim.Time<1000)
B_SModel <- lm(Swim.Time ~ Bike.Time, data = ironman_data)
summary(B_SModel)

BSModel <- lm(Swim.Time ~ Bike.Time, data = ironman_data)
ironman_data %>%
  ggplot(aes(x = Bike.Time, y = Swim.Time)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Bike Times compared to Swim Times",
       x = "Bike Times",
       y = "Swim Times") +
  theme_bw()


ironman_data <- ironman_data %>%
  filter(Swim.Time < 1000)
BSModel <- lm(Swim.Time ~ Bike.Time, data = ironman_data)
ironman_data %>%
  ggplot(aes(x = Bike.Time, y = Swim.Time)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Bike Times compared to Swim Times",
       x = "Bike Times",
       y = "Swim Times") +
  theme_bw()
summary(BSModel)
