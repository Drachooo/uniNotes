#Creare due vettori:
# hours: [0,3,6,9,12,15,18,21]
# temperature: [55.5,54.4,52.6,55.7,75.6,77.7,70.3,66.6]
hours <- seq(0,21,3)
temperatures <- c(55.5,54.4,52.6,55.7,75.6,77.7,70.3,66.6)

#Disegnare un plot usando come simbolo "+"
plot(
  hours,
  temperatures,
  xlab = "Hours",
  ylab = "Temperatures",
  main = "Temperature trend",
  pch = "+",
  xlim = c(-1, 22)
)

#Creare una funzione che prende in input una misura in cm e ritorna una misura in inches
conversion <- function(measure) {
  return (measure / 2.54)
}

conversion(2.54)