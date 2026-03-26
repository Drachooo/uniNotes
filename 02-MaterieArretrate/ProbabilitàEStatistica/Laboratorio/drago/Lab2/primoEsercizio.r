##################################
#Carica il dataset sunspot.year dal pacchetto datasets. Usa data("sunspot.year") e poi sunspot.year per caricarlo nello workspace.

data("sunspot.year")
sunspot.year

##############
#Consulta la documentazione per ottenere informazioni sul dataset e crea un vettore sequenziale corrispondente agli anni. Chiama questa variabile year.

help(sunspot.year)
year = 1700:1988 
year
##########################à
#C. Crea una variabile chiamata sunspot, contenente i valori del dataset.

sunspot = sunspot.year
sunspot


############################
#D. Unisci le variabili in un oggetto data.frame.

df = data.frame( year, sunspot)
df

##########################àà
#E. Crea un grafico a linee (line plot) dei sunspot in funzione degli anni.

plot(year, sunspot, type = "l", main= "Sunspots by year")

########################à
#Sovrapponi i punti dei dati come asterischi rossi. Aggiungi un secondo livello al grafico usando la funzione points(). Usa pch = "*" e col = "red" negli argomenti di points().
points(x = df$year, y = df$sunspot, pch = "*", col = "red")

