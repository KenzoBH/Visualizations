
library(tidyverse)

anos <- c(1980, 1990, 2000, 2010)
df <- data.frame(
  proporcao = c(48.5,34.7,29.5,25.7, 45,58.1,61.4,64.8, 6.5,7.2,9.1,9.5),
  faixa = c("J","J","J","J", "A","A","A","A", "I","I","I","I"),
  ano = c(anos, anos, anos)
)

x <- 1960
azul <- "#4392f1"
cinza <- "#dddddd"

df %>% 
  ggplot() +
  geom_line(aes(x = ano, y = proporcao, line = faixa,
                color = ifelse(faixa == "J", "Jovens", "Nao Jovens")),
            size = 4, show.legend = FALSE) +
  geom_point(data = df %>% filter(ano%in%c(1980, 2010)),
             aes(x = ano, y = proporcao,
                 color = ifelse(faixa == "J", "Jovens", "Nao Jovens")),
             size = 7, show.legend = FALSE) +
  scale_color_manual(values = c(azul, cinza)) +
  
  annotate("text", x = x, y = 49.5, color = azul, hjust = 0,
           fontface="bold", label = "Proporcão de jovens") +
  annotate("text", x = x, y = 45, color = "#cccccc", hjust = 0,
           fontface="bold", label = "Proporcão de adultos") +
  annotate("text", x = x, y = 6.5, color = "#cccccc", hjust = 0,
           fontface="bold", label = "Proporcão de idosos") +
  
  annotate("text", x = x + 14, y = 49.5, color = azul, hjust = 0,
           fontface="bold", label = "49.5 %") +
  annotate("text", x = x + 14, y = 45, color = "#cccccc", hjust = 0,
           fontface="bold", label = "45.0 %") +
  annotate("text", x = x + 14, y = 6.5, color = "#cccccc", hjust = 0,
           fontface="bold", label = "6.5 %") +
  annotate("text", x = 2012, y = 25.7, color = azul, hjust = 0,
           fontface="bold", label = "25.7 %") +
  annotate("text", x = 2012, y = 64.8, color = "#cccccc", hjust = 0,
           fontface="bold", label = "64.8 %") +
  annotate("text", x = 2012, y = 9.5, color = "#cccccc", hjust = 0,
           fontface="bold", label = "9.5 %") +
  
  labs(
    title = "Jovens estão em extinção no Brasil!",
    subtitle = "A proporção de jovens no país vem diminuindo",
    caption = "Fonte: IBGE"
  ) +
  
  scale_x_continuous(breaks = c(1980, 1990, 2000, 2010),
                     limits=c(1960, 2015)) +
  theme(
    plot.title = element_text(size = 17.5, color = "black"),
    plot.subtitle = element_text(size = 10, color = "#888888", hjust = 0),
    plot.caption = element_text(size = 10, color = "#888888", hjust = 0),
    panel.background = element_blank(),
    axis.title = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )
