#Caricare il dataset sunspot.year
data("sunspot.year")
sunspot.year

#Ottenere informazione sul dataset ecreare un vettore con i rispettivi anni
?sunspot.year
year <- 1700:1988

#Creare la variabile sunspot contente i valori del dataset
sunspot <- sunspot.year

#Creare un data-frame
dataFrame <- data.frame(
  year = year,
  sunspot = sunspot
)