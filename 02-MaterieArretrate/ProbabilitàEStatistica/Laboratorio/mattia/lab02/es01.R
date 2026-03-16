#Calcolare la media, la deviazione standard e la mediana dei dati numerici del dataset

#Calcoli per la colonna bill_length_mm
mean(penguins$bill_length_mm, na.rm = TRUE)
sd(penguins$bill_length_mm, na.rm = TRUE)
median(penguins$bill_length_mm, na.rm = TRUE)

#Calcoli per la colonna bill_depth_mm
mean(penguins$bill_depth_mm, na.rm = TRUE)
sd(penguins$bill_depth_mm, na.rm = TRUE)
median(penguins$bill_depth_mm, na.rm = TRUE)


#Creare una funzione stat_auto che calcola contempraneamente la media e la deviazione standard dato un vettore
stat_auto <- function(vec, removeNA = TRUE) {
  avg <- mean(vec, na.rm = removeNA)
  stddev <- sd(vec, na.rm = removeNA)
  output <- list("Mean" = avg, "SD" = stddev)
  return(output)
}
#stat_auto(penguins$bill_length_mm)

#Creare una funzione stat_manual che  calcola contemporaneamente la media e la standard deviation manualmente
stat_manual <- function(vec, removeNA = TRUE) {
  if(removeNA == TRUE)
    vec <- na.omit(vec)
  
  avg <- sum(vec) / length(vec)
  stddev <- sqrt(sum((vec - avg)^2) / (length(vec) - 1))
  output <- list("Mean" = avg, "SD" = stddev)
  return(output)
}
#stat_manual(penguins$bill_length_mm, removeNA = TRUE)