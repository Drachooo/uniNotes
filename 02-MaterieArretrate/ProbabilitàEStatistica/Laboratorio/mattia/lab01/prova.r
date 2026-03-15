students <- 1:100 #genera un vettore di interi da 1 a 100 (estremi compresi)

grades <- matrix(
  round(
    runif(1000, 4, 10), #genera 1000 numeri tra 4 e 10 arroondandoli al numeri decimale più vicino, con 0 cifre decimali
    digits = 0
  ),
  nrow = length(students)
)

colnames(grades) <- paste("Test", seq(1, 10, 1)) #rinomina le colonne
rownames(grades) <- paste("Student", students) #rinomina le righe

avg_grades <- rowMeans(grades) #calcola le medie di tutti gli studenti (righe)

best_stud <- which(avg_grades == max(avg_grades)) #trova la  posizione dello studente migliore trovando le media più alta di tutti gli studenti

cat("The best student is: student", best_stud) #stampa a video la stringa concocatenato alla posizione dello studente con la mrfia più alta
cat("The avg quote of the best student is:", max(avg_grades)) #stamapa a video la stringa concatenato alla media dello studente

insuf <- NULL

for(i in 1:nrow(grades)) {
  insuf[i] <- 0
  for(j in 1:ncol(grades)) {
    if(grades[i,j]  < 6)
      insuf[i] <- insuf[i] + 1
  }
} #conta le insufficienze di ogni studente

barplot(
  table(insuf) / 100, #conta le frequenze di ogni insufficienza
  xlab = "Number of insuficcient tests",
  ylab = "Relative abundance",
  main = "Relative abudance of insufficient tests"
)