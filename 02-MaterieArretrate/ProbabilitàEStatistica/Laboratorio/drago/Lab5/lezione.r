######################
#Ciclo for


somma = function(n){

    somma = 0
    for ( i in 1:n)
        somma = somma + i

    return(somma)
}


multiply = function(n){
    multiply = 1
    for(i in 1:n)
        multiply = multiply * i
    return(multiply)
}


#Stessa funzione di prima ma ricorsiva
multiplyRicorsiva = function(n){
    if( n == 0)
        return(1)
    else 
       return(n * multiplyRicorsiva(n-1))
}




?sample()

n = 1e5
E <- c(2, 3)
risultatiPossibili = 1:6
set.seed(123)

?set.seed()
risultati= sample(risultatiPossibili, size = n, replace = TRUE)

nE = numeric(n)

for(i in 1:n){
    nE[i] = as.integer(risultati[i] %in% E)
}

#Calcola la probabilità cumulativa dividendo i successi per il numero di prove

pE = cumsum(nE) / (1:n)


pE



plot(x = 1:40, y = risultati[1:40], main = "Tossing a fair dice", xlab = "First 40 launches", ylab = "Results")

library(ggplot2)
df = data.frame("index" = seq_along(risultati), "res" = risultati, "pE" = pE)
df
ggplot(data = df[1:40], aes(x = index, y = res)) + geom_point() + labs(title = "Tossing a fair dice", x = "First 40 launches", y = "Results")

plot(x = 1:n, y = pE, type = "l", log = "x")
abline(h = 1/3, col = "red")

ggplot(data = df, aes(x = index, y = pE)) +
    geom_line() +
    geom_hline(aes(yintercept = 1/3), linetype = "dashed", color = "red") scale_x_continuous(trans = "log10") + labs(title = "Probability of event E = {2,3}", subtitle = "From launch 1 to launch 10^5", x = "Launches", y = "Results")


A = c(1,2)
B = c(2,3,6)
C = c(1,4,5)

n = 10^5

set.speed(123)
res = sample(x = 1:6)

nA = nB = nC = nAB = nBC = numeric(n)


