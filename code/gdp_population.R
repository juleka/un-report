# load libraries
library(tidyverse)

#read in the data
gapminder_1997 <- read_csv("data/gapminder_1997.csv")
View(gapminder_1997)
gapminder_1997

ggplot(gapminder_1997, aes(x = gdpPercap, y = lifeExp, 
                           color = continent, size = pop/1000000)) +
  labs(x = "GDP per capita", y= "Life Expectancy", 
       size = "Population (in millions)",
       title = "Do people in wealthy countries live longer?") +
  geom_point() + scale_color_brewer(palette = "Set1")

# read in full data set
gapminder_data  <- read_csv("gapminder_data.csv")

# make a line plot
ggplot(gapminder_data) +
  aes(x=year, y = lifeExp, color = continent, group = country) +
  geom_line()

# make a boxplot
ggplot(gapminder_1997, aes(x= continent, y=lifeExp)) +
  labs(x='Continent', y='Life Expectancy (years)', title='Life expectancy by continent (1997)') +
  geom_boxplot()

#violin plot
violin_plot <- ggplot(gapminder_1997, aes(x= continent, y=lifeExp)) +
  labs(x='Continent', y='Life Expectancy (years)', title='Life expectancy by continent (1997)') +
  geom_violin(alpha=.5, aes(fill=continent)) + geom_jitter(aes(size=pop)) +
  theme_bw()
ggsave(plot=violin_plot, filename="vp-lifeExp-continent-1997.pdf", height = 5, width = 8)
ggsave(filename = "figures/my_awesome_plot.jpg", violin_plot, height = 5, width = 8)

#univariate plots (histogram)
ggplot(gapminder_1997) +
  aes(x=lifeExp) +
  geom_histogram(bins=20) +
  theme_bw() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#saving a ggplot
ggsave("figures/my_histogram.pdf", height = 6, width = 4)

#facetting
ggplot(gapminder_1997) +
  aes(x=gdpPercap, y=lifeExp) +
  geom_point() +
  facet_wrap(vars(continent))
