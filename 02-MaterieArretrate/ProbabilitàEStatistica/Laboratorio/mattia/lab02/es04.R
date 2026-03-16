#Quante isole ci sono nel dataset
penguin_on_island <- table(penguins$species, penguins$island)
View(penguin_on_island)

#Creare un barpot per rappresentare la densità dei pinguini nelle varie isole
penguins_bar <- ggplot(
  penguins,
  aes(x = island)
) + 
  geom_bar(
    aes(fill = species),
    position = position_dodge(preserve = "single")
  ) + 
  scale_fill_manual(
    values = c("darkorange", "purple", "cyan4")
  )
  labs(
    x = "Island", 
    y = "Frequency", 
    fill = "Species",
    title = "Penguins by Island"
  )
  
penguins_bar