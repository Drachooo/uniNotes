#------------------------------------------------------------
install.packages("ggplot2")
library('ggplot2')

mass_fillper <- ggplot(
  penguins,
  aes(
    x = flipper_length_mm,
    y = body_mass_g
  )
) +
    geom_point(
      aes(
        color = species,
        shape = species
      ),
      size = 3,
      alpha = 0.8
    ) + 
    scale_color_manual(
      values = c("darkorange", "purple", "cyan4")
    ) + 
    labs(
      title = "Flipper length and body mass",
      subtitle = "Colored by Adelie, Chinstrap and Gentoo Penguins",
      x = "Flipper length (mm)",
      y = "Body mass (g)",
      color = "Penguin species",
      shape = "Penguin species"
    ) +
    theme(legend.position = "bottom")

mass_fillper
#------------------------------------------------------------
#Creare una variabile categorica con i valori di flipper length e diverla in classe da 10mm
flipper <- penguins$flipper_length_mm[!is.na(penguins$flipper_length_mm)]
classes <- seq(170, 235, 10)
flipperCut <- cut(
  flipper,
  classes,
  include.lowest = TRUE,
  right = FALSE
)

#Creare un dataset con la funzione table() su flipperCut
flipper_df <- data.frame(table(flipperCut))
colnames(flipper_df) <- c("flipper_length_mm", "absolute_freq")

#Creare una colonna per le frequenze relative, frequenze cumulative assolute e le frequenze cumulative relative
flipper_df$comulative_absolute_freq <- cumsum(flipper_df$absolute_freq)
flipper_df$relative_freq <- flipper_df$absolute_freq / sum(flipper_df$absolute_freq)
flipper_df$cumulative_relative_frq <- cumsum(flipper_df$relative_freq)

ggplot(
  flipper_df,
  aes(
    x = flipper_length_mm,
    y = absolute_freq
  )
) + 
  geom_col() +
  geom_text(
    aes(
      label = paste0(
        round(
          relative_freq * 100, digits = 1
        ), "%"
      ), 
      nudge_y = 3
    )
  ) +
  labs(
    x = "Flipper length (10mm classes)",
    y = "Absolute frequency",
    title = "Flipper lengths distribution",
    subtitle = "Percentage over the bars"
  )