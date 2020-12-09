# Função marrut_style nada mais é do que a bbc_style do bbplot,
# que acho top, adaptada ao meu gosto.
# Desse modo copio a bbc_style e faço as modificações que 
# me interessam.

# 1º instalando e carregando os pacotes necessários.
pacman::p_load(dplyr, ggplot2, scales, gapminder, extrafont, showtext)


# Como gosto da fonte 'Ubuntu' tenho que baixá-la, usando o pacote 
# showtext.
# Carregando a fonte Ubuntu do Google fonts (https://fonts.google.com/)
showtext::font_add_google("Ubuntu", "ubuntu")

# Automatically use showtext to render text.
showtext::showtext_auto()



# A função propriamente dita.

marrut_style <- function() {
  
  font <- "ubuntu"
  
  ggplot2::theme(
    
    #Text format:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family=font,
                                       size=28,
                                       face="bold",
                                       color="#222222"),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family=font,
                                          size=22,
                                          margin=ggplot2::margin(9,0,9,0)),
    plot.caption = ggplot2::element_text(family=font,
                                         size=12),
    
    # Não gosto de legenda, então vou comentar (retirar) a do bbc_style e 
    # colocar legend.position = "none"
    #Legend format
    #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    # legend.position = "top",
    # legend.text.align = 0,
    # legend.background = ggplot2::element_blank(),
    # legend.title = ggplot2::element_blank(),
    # legend.key = ggplot2::element_blank(),
    # legend.text = ggplot2::element_text(family=font,
    #                                     size=18,
    #                                     color="#222222"),
    legend.position = "none",
    
    
    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    axis.title = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(family=font,
                                      size=18,
                                      color="#222222"),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),
    
    # Também acho que valores no eixo y poluem o gráfico.
    # Retirá-los-ei do gráfico.
    axis.title.y = ggplot2::element_blank(),
    axis.text.y = ggplot2::element_blank(),
    
    #Grid lines
    #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color="#cbcbcb"),
    panel.grid.major.x = ggplot2::element_blank(),
    
    #Blank background
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_blank(),
    
    #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
    strip.background = ggplot2::element_rect(fill="white"),
    strip.text = ggplot2::element_text(size  = 22,  hjust = 0)
  )
}

# Preparando os dados.
line_df <- gapminder %>% filter(country == "China")

# Fazendo o gráfico básico..
line_df %>% ggplot(aes(x = year, y = lifeExp)) +
  geom_line(colour = "#007f7f", size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  labs(title = "Vivendo mais",
       subtitle = "A expectativa de vida na China")

# Agora fazendo ao estilo BBC.
line_df %>% ggplot(aes(x = year, y = lifeExp)) +
  geom_line(colour = "#007f7f", size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  labs(title = "Vivendo mais",
       subtitle = "A expectativa de vida na China",
       caption = "fonte: gapminder") +
  bbc_style()

# Agora fazendo ao estilo BBC Ubuntu.
line_df %>% ggplot(aes(x = year, y = lifeExp)) +
  geom_line(colour = "#ff260b", size = 1.5) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  labs(title = "Vivendo mais",
       subtitle = "A expectativa de vida na China", 
       caption = "fonte: gapminder") +
  marrut_style()

