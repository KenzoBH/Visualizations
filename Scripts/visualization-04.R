
library(tidyverse)

df <- data.frame(
  ano = c("2019", "2019", "2020", "2020"),
  tipo = c("Para beber", "Para limpar as mãos", 
           "Para limpar as mãos", "Para beber"),
  porc = c(0.95, 0.05, 0.95, 0.05)
)

df %>% 
  ggplot() +
  geom_col(aes(x = ano, y = porc, fill = tipo)) +
  scale_fill_manual(values = c("#dddddd", "#4392f1")) +
  labs(
    title = "Uso do álcool",
    subtitle = "O Covid nos obriga a ser tristes",
    caption = "Fonte: dados fictícios",
    x = "", y = "", fill = ""
  ) +
  theme(
    plot.title = element_text(size = 17.5, color = "black"),
    plot.subtitle = element_text(size = 10, color = "#888888"),
    plot.caption = element_text(hjust = 0, color = "#888888"),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
  )
