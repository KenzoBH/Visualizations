options(scipen = 999)

library(tidyverse)

df <- data.frame(
  cliente = c(rep("Cliente 1", 2000), rep("Cliente 2", 1000)),
  valor = c(rnorm(2000, 10000, 25000), rnorm(1000, 30000, 50000))
  ) %>% 
    group_by(cliente) %>% 
    summarise(soma = sum(valor) / 1e6, qtd = n())

df

df %>% 
  ggplot() +
  geom_col(aes(x = cliente, y = soma), fill = "#4392f1") +
  
  annotate("text", x = 1, y = grouped_df$soma[1] + 1,
           label = str_c(round(grouped_df$soma[1], 0), "M $"),
           color = "black") +
  annotate("text", x = 2, y = grouped_df$soma[2] + 1,
           label = str_c(round(grouped_df$soma[2], 0), "M $"),
           color = "black") +
  
  annotate("text", x = 1, y = grouped_df$soma[1] - 5,
           label = str_c(grouped_df$qtd[1], "\nchargebacks"),
           color = "white") +
  annotate("text", x = 2, y = grouped_df$soma[2] - 5,
           label = str_c(grouped_df$qtd[2], "\nchargebacks"),
           color = "white") +
  
  labs(
    title = "Chargebacks do Cliente 2 são bem mais caros",
    subtitle = "Favor conversar com responsável pelos chargebacks",
    caption = "Dados referentes aos chargebacks de 2021",
    x = "Cliente", y = "Soma dos chagebacks (milhões de $)"
  ) +
  
  theme(
    plot.subtitle = element_text(size = 10, color = "#888888"),
    plot.caption = element_text(hjust = 0, color = "#888888"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"))
