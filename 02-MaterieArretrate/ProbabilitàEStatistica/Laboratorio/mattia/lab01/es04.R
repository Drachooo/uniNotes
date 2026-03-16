#----------------------------------------
install.packages('dplyr')
library('dplyr')
data("iris")
View(iris)

setosaPetals <- iris %>%
  filter(Species == 'setosa') %>%
  select(Petal.Length, Petal.Width)
View(setosaPetals)
#----------------------------------------

setosaSpecies <- iris %>%
  filter(Species == 'setosa')

setosaSpecies %>% arrange(Sepal.Length) %>% head()
View(setosaSpecies)