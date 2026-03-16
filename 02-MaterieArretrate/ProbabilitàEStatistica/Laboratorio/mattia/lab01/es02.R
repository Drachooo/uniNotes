#Caricare il dataset sunspot.year
data("sunspot.year")
?sunspot.year

#Craeare un vettore contentente gli anni del dataset (guardare la documentazione)
year <- 1700:1988

#Creare una variabile sunspot contente i valori del dataset
sunspot <- sunspot.year

#Creare un dataset con le due variabili create prima
dataFrame <- data.frame(
  year = year,
  sunspot = sunspot
)

#Disegnare un lineplot delle due variabili
plot(
  dataFrame$year,
  dataFrame$sunspot,
  type = "l",
  xlab = "Year",
  ylab = "Sunspot",
  main = "Sunspot Year"
)

points(
  dataFrame$year,
  dataFrame$sunspot,
  pch = "*",
  col = 'red',
)

#Creare una colonna con 3 grafici contente 3 barplot dei sunspot
#Creare un istrogramma dei sunspot
par(mfrow = c(3,1))

#Position [1,1] 
plot(
  dataFrame$year,
  dataFrame$sunspot,
  type = "l",
  xlab = "Year",
  ylab = "Sunspot",
  main = "Sunspot Year"
)

points(
  dataFrame$year,
  dataFrame$sunspot,
  pch = "*",
  col = 'red',
)

#Posizione [2,1]
barplot(
  as.vector(dataFrame$sunspot),
  main = "Sunspot - barplot"
)

#Posizione [3,1]
hist(
  as.vector(dataFrame$sunspot),
  main = "Sunspot - histogram",
  xlab = "Sposts"
)