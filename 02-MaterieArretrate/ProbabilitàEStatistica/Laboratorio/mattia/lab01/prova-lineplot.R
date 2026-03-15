dailyIncome <- runif(100, 10, 20)
plot(
  dailyIncome,
  type = "l", #tipo di linea
  xlab = "Day",
  ylab = "Daily income",
  main = "Daily income over 100 days"
)