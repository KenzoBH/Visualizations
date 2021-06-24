
library(tidyverse)

data_url = "https://raw.githubusercontent.com/KenzoBH/Web-Scraping-and-EDA-iFood/main/scraped-data.csv"
df <- read_csv(data_url)

df %>% 
  group_by(`Tipo de comida`) %>% 
  summarise(qtd = n()) %>% 
  arrange(desc(qtd)) %>% 
  mutate(filtro = 
           ifelse(`Tipo de comida` %in% `Tipo de comida`[1:8],
                  `Tipo de comida`, "Outros")) %>% 
  ggplot() +
  geom_col(aes(x = fct_reorder(filtro, desc(qtd)), y = qtd,
               fill = ifelse(filtro == "Japonesa", "a", "b")),
           show.legend = FALSE) +
  ylim(c(0, 37.5)) +

  geom_segment(x = 3, xend = 3, y = 19, yend = 36) +
  annotate("text", x = 3.15, y = 35, hjust = "left",
           label = "Um bairro repleto de cultura japonesa",
           color = "#4392f1", fontface = "bold") +
  annotate("text", x = 3.15, y = 30, hjust = "left", size = 3,
           label = "O bairro abriga uma grande comunidade nipo-brasileira,
contando com o maior evento okinawano do país.",
           color = "#888888") +
  
  labs(
    title = "Restaurantes da Vila Carrão",
    subtitle = "Quantidade de restaurantes na região da Vila Carrão agrupados por tipo",
    caption = "Fonte: ifood
Foram utilizadas técnicas de Web Scraping para a coleta dos dados
Disponível em: GitHub.com/KenzoBH",
    x = "Tipo de restaurante",
    y = "Quantidade de restaurantes"
  ) +
  
  scale_fill_manual(values = c("#4392f1", "#888888")) +
  theme(
    plot.title = element_text(size = 17.5, color = "black"),
    plot.subtitle = element_text(size = 10, color = "#888888"),
    plot.caption = element_text(hjust = 0, color = "#888888"),
    axis.text.x = element_text(size = 6),
    axis.title.x = element_text(vjust = -1),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
  )
 