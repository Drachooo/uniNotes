#Creaere un istogramma sulla lunghezza delle pinne
flipper_hist <- ggplot(
  penguins,
  aes(x = flipper_length_mm)
) + 
  geom_histogram(
    aes(fill = species),
    alpha = 0.5,
    position = "identity"
  ) +
  scale_fill_manual(
    values = c("darkorange", "purple", "cyan4")
  ) + 
  labs(
    x = "Flipper length (mm)", 
    y = "Frequency",
    title = "Penguin flipper lengths"
  )

flipper_hist

#Calcolare per ogni specie la media, mediana, deviazione standard e varianza della lunghezza della pinna
penguinsStats <- penguins %>%
  group_by(species) %>%
  summarise(
    avg <- mean(flipper_length_mm, na.rm = TRUE),
    med <- median(flipper_length_mm, na.rm = TRUE),
    sddev <- sd(flipper_length_mm, na.rm = TRUE),
    var <- var(flipper_length_mm, na.rm = TRUE)
  )

View(penguinsStats)
colnames(penguinsStats) <- c("Species","Mean", "Median", "Standard devation", "Variance")

#Creaere un boxplot sulla lunghezza delle pinne
flipper_box <- ggplot(
  penguins,
  aes(
    x = species,
    y = flipper_length_mm
  )
) + 
  geom_boxplot(
    aes(outlier.alpha = 0)
  ) + 
  geom_jitter(alpha = 0.5) +
  scale_fill_manual(
    values = c("darkorange", "purple", "cyan4")
  ) + 
  labs(
    x = "Flipper length (mm)", 
    y = "Frequency",
    title = "Penguin flipper lengths"
  )

flipper_box