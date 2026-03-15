#Esercizio 1

#Creare il vettore [1,2,3,4,5,6,7,8,9,10] usando l'operatore colonna
#Creare il vettore [2,7,12]
vec1 <- 1:10
vec2 <- seq(2,12,5)

#Creare una matrice mymat 4x2 di zeri. Dopo riempire la seconda riga con un vettore di interi c(3,6)
mymat <- matrix(
  0,
  nrow = 4,
  ncol = 2
)
mymat[2,] <- c(3,6)

#Creare un vettore x contenente 20 valori equidistanziati all'interno dell'intervallo [-pi, pi]
#Creare un vettore y contente la funzione di sin(x)
x <- seq(-pi, pi, length.out = 20)
y <- sin(x)

#Creare un matrice mat 4x6 di numeri interi compresi tra [-5, 5]
#Creare una mtrice contente tutti i valori assoluti della matrice mat
mat <- matrix(
  sample(-5:5, 24, replace = TRUE),
  nrow = 4,
  ncol = 6
)
matAbsoluteValue <- abs(mat)

#Creare un grafico (plot) con la funzione exp(x) del vettore [-2, 2, 0.1]
xPlot <- seq(-2, 2, 0.1)
plot(
  x = xPlot,
  y = exp(xPlot),
  type = "l",
  xlab = "Vector",
  ylab = "Exponecial",
  main = "Exponencial function of vector x"
)

#Creare un vettore x [1, 100, 5]
#Creare un vettotore y contente le radici quadrate di ogni elememnto
#Creare un grafico (barplot)
x2 <- seq(1, 100, 5)
y2 <- sqrt(x2)
  barplot(
    y2,
    xlab = "Valori di x",
    ylab = "Radici quadrate di x",
    main = "Grafico delle radici quadrate di x",
    names.arg = x2
  )