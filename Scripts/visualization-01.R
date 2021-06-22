
library(tidyverse)

df <- data.frame(
  year = 2016:2025,
  sales = c(63,76,80,82,90,96,102,131,144,158)) %>% 
  mutate(type = ifelse(year >= 2021, "prevision", "real")) %>% 
  add_row(year = 2021, sales = 96, type = "real") %>% 
  arrange(year, desc(type))

df %>% 
  ggplot() +
  scale_color_manual(values = c("#4392f1", "black")) +
  geom_line(aes(x = year, y = sales,
                linetype = ifelse(type != "real", "solid", "dashed"),
                colour = ifelse(type != "real", "#4392f1", "black")),
            show.legend = FALSE, size = 0.5) +
  geom_point(data = df %>% filter(year >= 2021),
             aes(x = year, y = sales), color = "#4392f1") +
  geom_text(data = df %>% filter(year >= 2021), color = "#4392f1",
            aes(x = year, y = sales + 20, label = sales)) +
  labs(title = "Previsões das vendas nos próximos anos",
       subtitle = "Com base nas campanhas de marketing",
       y = "Vendas ($)", x = "Ano") +
  annotate("rect",
           xmin = 2020.75, xmax = 2025.25, ymin = -Inf, ymax = Inf, 
           alpha = 0.05) +
  ylim(0,200) +
  scale_x_continuous(breaks = 2016:2025) +
  theme(
    plot.subtitle = element_text(size = 10, color = "#888888"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"))