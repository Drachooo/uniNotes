sum_number <- function(n) {
  runsum <- 0
  for(i in 1:n)
    runsum = runsum + i
  
  return(runsum)
}

sum_number(10)

product_number <- function(n) {
  runprod <- 1
  for(i in 1:n)
    runprod = runprod * i
  
  return(runprod)
}

product_number(10)

prod_numer_recorsive <- function(n){
  if((n-1) > 0)
    return(n * prod_numer_recorsive(n-1))
  else return(1)
}

prod_numer_recorsive(10)