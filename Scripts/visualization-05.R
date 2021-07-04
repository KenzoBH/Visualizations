
library(ggplot2)
library(ggtext)

df <- data.frame(
  perc = c(0.95, 0.05),
  motive = c("Comer", "Fazer gráficos")
)

ggplot(df, aes(x = "", y = perc, fill = motive)) +
  geom_bar(stat = "identity") +
  coord_polar("y") +
  
  labs(
    title = "Para que servem as pizzas",
    subtitle = "<span style='color:#888888'>
    Pizza é pra <span style='color:#4392F1'>comer!</span>
    </span>",
    caption = "Não faça gráficos de pizza - a não ser para condenar gráficos de pizza.",
    fill = ""
  ) +
  
  scale_fill_manual(values = c("#4392f1", "#dddddd")) +
  theme(
    plot.title = element_text(size = 17.5, color = "black"),
    plot.subtitle = element_markdown(),
    plot.caption = element_text(size = 10, color = "#888888", hjust = 0),
    panel.background = element_blank(),
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_blank()
  )

