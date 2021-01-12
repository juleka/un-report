library(tidyverse)
library(tidyr)

gapminder_data <- read_csv("data/gapminder_data.csv")

gapminder_data %>% 
  filter(year==1952) %>% 
  summarize(averageGDP_percap = mean(gdpPercap), 
            first_year = min(year))

#group_by
gapminder_data %>% 
  group_by(continent) %>% 
  summarize(averageLifeExp = mean(lifeExp))

#arrange

# mutate - add more columns to your dataset
gapminder_data %>%
  mutate(popMil = pop/1000000)

# select
gapminder_data %>% 
  select(-continent)

# long vs. wide data format: pivot_longer/pivot_wider
gapminder_data %>%
  select(country, continent, year, lifeExp) %>% 
  pivot_wider(names_from = year, values_from = lifeExp)
## for some reason, i cannot update tidyverse 
##   to get function pivot_wider
## probably because my R version is from Dec 2018



