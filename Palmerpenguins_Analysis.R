
# Loading of Packages and Dataset

library(tidyverse)
library(tidyr)
library(dplyr)
library(ggplot2)
library(palmerpenguins)

data("penguins")

glimpse(penguins)

summary(penguins)

# Cleaning and Analyzing of Dataset

penguins2 <- penguins %>% drop_na()

penguins2[duplicated(penguins2), ]

glimpse(penguins2)

penguins2 %>% count(species)

penguins2 %>% count(species, sex)

penguins2 %>% count(species, island)

penguins2 %>% group_by(species) %>% count(sex, island)


# Visualizations

ggplot(data = penguins2, aes(x=species)) + geom_bar() +
  labs(title = "Count of Species") + geom_text(aes(label=after_stat(count)),
                                               stat = 'count', vjust=-0.5) + coord_flip()

ggplot(data = penguins2, mapping = aes(x=species,  fill=sex)) + geom_bar() +
  labs(title = "Species by Sex") + coord_flip()


ggplot(data = penguins2, aes(x=species, fill=island)) + geom_bar() +
  labs(title = "Species by Island") + coord_flip()


ggplot(data = penguins2, mapping = aes(x= bill_depth_mm,
  y=body_mass_g, color=species))  + geom_point() +
  labs(title = "Body Mass vs.Bill Depth") +
  geom_smooth(formula='y ~ x', method = "lm")


ggplot(data = penguins2, mapping = aes(x= bill_length_mm,
  y=flipper_length_mm, color=species))  + geom_point() +
  labs(title = "Flipper Length vs.Bill Length") +
  geom_smooth(formula='y ~ x', method = "lm")


ggplot(data = penguins2, mapping = aes(x= bill_depth_mm,
  y=flipper_length_mm, color=species))  + geom_point() +
  labs(title = "Flipper Length vs.Bill Depth") +

  ggplot(data = penguins2, mapping = aes(x= flipper_length_mm,
  y=body_mass_g, color=species))  + geom_point() +
  labs(title = "Body Mass vs.Flipper Length ") +
  geom_smooth(formula='y ~ x', method = "lm")


ggplot(data = penguins2, mapping = aes(x= bill_length_mm,
  y=body_mass_g, color=species))  + geom_point() +
  labs(title = "Body Mass vs.Bill Length ") +
  geom_smooth(formula='y ~ x', method = "lm")


ggplot(data = penguins2, mapping = aes(x= bill_depth_mm,
  y=bill_length_mm, color=species))  + geom_point() +
  labs(title = "Bill_Length vs.Bill Depth") +
  geom_smooth(formula='y ~ x', method = "lm")

