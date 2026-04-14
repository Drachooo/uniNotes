library(palmerpenguins)
library(ggplot2)
data("penguins")
penguins



flipper <- penguins$flipper_length_mm[!is.na(penguins$flipper_length_mm)]

range(flipper)

classes <- seq(170, 240, 10)
classes
flipper_cut <- cut(flipper, breaks = classes, include.lowest = TRUE, right = FALSE)

head(flipper_cut)
head(flipper)


tab = table(flipper_cut)
tab
flipper_df <- data.frame(tab)
flipper_df
colnames(flipper_df) <- c("flipper_length_mm", "absolute_freq")
flipper_df

#Aggiungi le colonne per : frequenze relative, frequenze assolute cumulative

#frequenze relative cumulative
flipper_df$relative_freq <- flipper_df$absolute_freq / sum(flipper_df$absolute_freq)

flipper_df$cumulative_absolute_freq <- comsum(flipper_df$absolute_freq)

flipper_df$cumulative_relative_freq <- cumsum(flipper_df$relative_freq)

flipper_df

#Usa la funzione geom_col() per rappresentare graficamente la frequenza di ciascuna classe. Poi, usando la funzione geom_text

ggplot(flipper_df, aes(x = flipper_length_mm, y = absolute_freq)) + geom_col() + geom_text(aes(label = paste0(round(relative_freq * 100, digits = 2), "%")), nudge_y = 5) + labs()