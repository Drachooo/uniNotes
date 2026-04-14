install.packages("palmerpenguins")
library ("palmerpenguins")
data("penguins")

View(penguins)
penguins

str(penguins)

#Calcolare la media per le variaibli numeriche del dataset
#Deviazione standard e mediana
mean(penguins$bill_length_mm, na.rm = TRUE) #na.rm rimuove i parametri NA
sd(penguins$bill_length_mm, na.rm = TRUE)
median(penguins$bill_length_mm, na.rm = TRUE)


################################
#ALTERNATIVA

library(dplyr)
penguins %>%
    summarise(mean = mean(bill_length_mm, na.rm = TRUE),
    sd = sd(bill_length_mm, na.rm = TRUE),
    median = median(bill_length_mm, na.rm = TRUE))


#D. Creare una funzione chiamata stat_auto che restituisca contemporaneamente sia la media sia la deviazione standard di un vettore dato. Successivamente, applicarla alle stesse variabili numeriche del punto C per verificare i risultati.

stat_auto <- function(vec, removeNA = TRUE){
    avg <- mean(vec, na.rm = removeNA)
    stddev <- sd(vec, na.rm = removeNA)
    output <- list("Mean" = avg, "SD" = stddev)
    return(output)
}
stat_auto(penguins$bill_length_mm)
stat_auto(penguins$bill_depth_mm)


quantile(penguins$bill_length_mm, 0.25, na.rm = TRUE)
quantile()

#Plot
plot(penguins, col = c('#72BAA9', '#6E1A37', '#5bbb6d')
[penguins$species])





#Rappresentare graficamente i pinguini
install.packages("ggplot2")
mass_flipper <- ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
  # Qui ho corretto "specie" in "species"
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) + 
  scale_color_manual(values = c('#ba7283', '#72BAA9', '#4e17cd')) + 
  labs(title = "Flipper length and body mass",         # Corretto "FLipper"
       subtitle = "colored by Matteo, Giacomo e Giulia", 
       x = "flipper length (mm)",                      # Corretto "fipper"
       y = "Body mass (g)", 
       color = "Penguin species",                      # Tolta la "s" a Penguins per uniformità
       shape = "Penguin species") + 
  theme(legend.position = "bottom")

mass_flipper