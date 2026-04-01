library(palmerpenguins)
library(ggplot2)

data("penguins")
penguins

#Usnado la funzione geom_historygram() del pacchetto ggplot2,rappresenta la distribuzione della lunghezza dela pinna(flipper length) colorando ogni specie con un colore diverso

flipper_hist <- ggplot(data = penguins, aes(x = flipper_length_mm)) + geom_histogram(aes(fill = species), alpha = 0.9, position = "identity") + scale_fill_manual(values = c("darkorange", "purple", "cyan4")) + labs(x = "Flipper length (mm)", y = "Frequency", title = "Penguin flupper lengths")
flipper_hist


#####

fl_gentoo <- penguins$flipper_length_mm[penguins$species == "Gentoo"]
####
mean(fl_gentoo, na.rm = TRUE)
median(fl_gentoo, na.rm = TRUE)
sd(fl_gentoo)