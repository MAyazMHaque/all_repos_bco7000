# Classification 2

library(tidyverse)
library(skimr)
library(broom)
library(randomForest)

 # creating multiple models of different variables 
result_aroma <- lm(total_cup_points ~ aroma, data = coffee_ratings )
summary(result_aroma)
tidy(result_aroma)

result_sweetness <- lm(total_cup_points ~ sweetness, data = coffee_ratings)
summary(result_sweetness)
tidy(result_sweetness)

result_uniformity <- lm(total_cup_points ~ uniformity, data = coffee_ratings)
summary(result_uniformity)
tidy(result_uniformity)

result_balance <- lm(total_cup_points ~ balance, data = coffee_ratings)
summary(result_balance)
tidy(result_balance)

result_acidity <- lm(total_cup_points ~ acidity, data = coffee_ratings)
summary(result_acidity)
tidy(result_acidity)

result_aftertaste <- lm(total_cup_points ~ aftertaste, data = coffee_ratings)
summary(result_aftertaste)
tidy(result_aftertaste)

result_region <- lm(total_cup_points ~ region, data = coffee_ratings)
summary(result_region)
tidy(result_region)

# preparing for randomForest 

coffee_ratings %>% count(variety, sort=TRUE)

# created new variable with no NA in variety
coffee_lumped <- coffee_ratings %>% filter(
  !is.na(variety)
)


coffee_lumped %>% count(variety, sort=TRUE)

# Now combining the last all varieties as a other just keep the number of possible value of Variety minimum 

coffee_lumped <- coffee_ratings %>% filter(
  !is.na(variety) %>% mutate(
    variety = fct_lump(variety,12)
  )


  
