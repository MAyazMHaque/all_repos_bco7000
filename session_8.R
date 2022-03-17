library(tidyverse)
library(skimr)

coffee_ratings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv')


  

ggplot(
  data = coffee_ratings) +
  geom_bar(mapping = aes(x=country_of_origin),
           fill="Navy") +
  coord_flip()

# creating linear regression between two continous variables 

coffee_ratings %>% 
  filter(aroma > 6 & acidity > 6) %>%
  ggplot(
    aes(x= aroma, y = acidity, color = species)) +
  geom_point() +
  geom_smooth(colour = 'blue')

coffee_ratings %>% ggplot(
    aes(x= moisture, y = sweetness, color = species)) +
  geom_point() +
  geom_smooth(colour = 'blue')


results <- lm(total_cup_points ~ altitude_mean_meters + aroma + 
                acidity + sweetness + uniformity, data = coffee_ratings)   

summary(results)
