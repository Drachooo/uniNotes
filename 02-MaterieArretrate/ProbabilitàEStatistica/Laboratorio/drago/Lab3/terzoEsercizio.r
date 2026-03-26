data("sunspot.year")
sunspot.year


help("sunspot.year")
year <- 1700:1988
year

sunspot <- sunspot.year
sunspot

df <- data.frame(year = year, sunspot = sunspot)

plot(df$year, df$sunspot, type = "l")
points(x = df$year, y = df$sunspot, pch = "*", col = "red")


