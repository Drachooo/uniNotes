#########

hours <- seq(0, 21, 3)
temperatures <- c(55.5, 52.4, 52.6, 55.7, 75.6, 77.7, 70.3, 66.6)

plot(hours, temperatures, pch = "+")

plot(hours, temperatures, pch = "+", xlim = c(-1, 22))

####
cm2pollice <- function(cm){
    return (cm/2.54)
}
cm2pollice(10)