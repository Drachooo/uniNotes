età = seq(20, 29, 1) #si poteva anche usare 20:29
students = c(2,1,5,3,4,2,0,2,1,0)
barplot(
  students,
  xlab = "Age of students",
  ylab = "Number of students",
  names.arg = età #aggiunge sotto la barra di ogni frequenza il corrispettivo dato d'età
)