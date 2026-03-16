#Lancio un dado
n <- 1e5
E <- c(2,3)
support <- 1:6
set.seed(123)

res <- sample(support, n, replace = TRUE)

nE <- 0
for(i in 1:n)
  nE[i] <- sum(res[i] == E)

pE <- cumsum(nE) / (1:n)