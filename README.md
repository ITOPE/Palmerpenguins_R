# Palmerpenguins_R

---
Title: "Palmerspenguins Analysis"

Author: '"Itunu Fatokunbo"'

Date: '2022-06-10'

---


 We analyzed the palmerspenguins dataset. The dataset is based on three species of penguins (Adelie,Chinstrap and Gentoo), found on three islands (Biscoe, Dream and Torgersen) in  Palmer Archipelago.
 
 
## Loading of Packages and Dataset

```r
library(tidyverse)
library(tidyr)
library(dplyr)
library(ggplot2)
library(palmerpenguins)
```


```r
data("penguins")

glimpse(penguins)

summary(penguins)
```


## Cleaning and Analyzing of Dataset

```r
penguins2 <- penguins %>% drop_na()

penguins2[duplicated(penguins2), ]

glimpse(penguins2)

penguins2 %>% count(species)

penguins2 %>% count(species, sex)

penguins2 %>% count(species, island)

penguins2 %>% group_by(species) %>% count(sex, island)
```



## Visualization

### Count of species

```r
ggplot(data = penguins2, aes(x=species)) + geom_bar() +
  labs(title = "Count of Species") + geom_text(aes(label=after_stat(count)), 
   stat = 'count', vjust=-0.5) + coord_flip()
```
![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/count_of_species.png)



---
### Species by Sex

```r
ggplot(data = penguins2, mapping = aes(x=species,  fill=sex)) + geom_bar() +
  labs(title = "Species by Sex") + coord_flip()
```
![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/species_by_sex.png)




---
### Species by Island

```r
ggplot(data = penguins2, aes(x=species, fill=island)) + geom_bar() +
  labs(title = "Count of Species") + coord_flip()
```
![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/species_by_island.png)




---
### Body Mass and Bill Depth

```r
ggplot(data = penguins2, mapping = aes(x= bill_depth_mm,
  y=body_mass_g, color=species))  + geom_point() +
  labs(title = "Body Mass vs.Bill Depth") +
  geom_smooth(formula='y ~ x', method = "lm")
```
![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/body_mass-vs-bill_depth.png)



---
### Flipper Length and Bill Length

```r
ggplot(data = penguins2, mapping = aes(x= bill_length_mm,
  y=flipper_length_mm, color=species))  + geom_point() +
  labs(title = "Flipper Length vs.Bill Length") +
  geom_smooth(formula='y ~ x', method = "lm")
```
 ![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/flipper_length-vs-bill_length.png)
 
 
 
  
### Flipper Length and Bill Depth

```r
ggplot(data = penguins2, mapping = aes(x= bill_depth_mm,
  y=flipper_length_mm, color=species))  + geom_point() +
  labs(title = "Flipper Length vs.Bill Depth") +
  geom_smooth(formula='y ~ x', method = "lm")
```
![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/flipper_length-vs-bill_depth.png)
 
 
 
--- 
### Body Mass and Flipper Length

```r
ggplot(data = penguins2, mapping = aes(x= flipper_length_mm,
  y=body_mass_g, color=species))  + geom_point() +
  labs(title = "Body Mass vs.Flipper Length ") +
  geom_smooth(formula='y ~ x', method = "lm")
 ``` 

![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/body_mass-vs-flipper_length.png)




---
### Body Mass and Bill Length  

```r
ggplot(data = penguins2, mapping = aes(x= bill_length_mm,
  y=body_mass_g, color=species))  + geom_point() +
  labs(title = "Body Mass vs.Bill Length ") +
  geom_smooth(formula='y ~ x', method = "lm")
```
![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/body_mass-vs-bill_length.png)




---
### Bill_Length and Bill Depth

```r
ggplot(data = penguins2, mapping = aes(x= bill_depth_mm,
  y=bill_length_mm, color=species))  + geom_point() +
  labs(title = "Bill_Length vs.Bill Depth") +
  geom_smooth(formula='y ~ x', method = "lm")
```
![](https://github.com/ITOPE/Palmerpenguins_R/blob/main/bill_length-vs-bill_depth.png)

  
## Conclusion 

Adelie has the highest population of 146, with 73 females and 73 males. Gentoo followed with population of 119, with 58 females and 61 males. Chinstrap has the lowest population of 68, with 34 females and 34 males.

Adelie species were found on the three Islands(Torgersen, Dream, Biscoe), Gentoo species were only found on Biscoe Island and Chinstrap species were only be found on Dream Island.

From the relationship plots, we deduced the body features related positively with to each other.

* As the bill length increases, the bill depth increases.
* As the flipper length increases, the bill depth increases.
* As the flipper length increases the bill length increases.
* As the body mass increases, the bill length increases.
* As the body mass increases, the bill depth increases.
* As the body mass increases, the flipper length increases.


## Dataset Source

Data was collected by Dr. Kristen Gorman.
