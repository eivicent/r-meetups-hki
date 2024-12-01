library(dplyr)
library(ggplot2)
library(patchwork)
#library(extrafont) #optional

source("custom_theme.R")

miris <- iris %>%
    mutate(cat2 = sample(1:4, n(), replace = TRUE),
           cat3 = sample(1:10, n(), replace = TRUE))


# Default Themes ----------------------------------------------------------

p <- miris %>%
  ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point() +
  #facet_wrap(~cat2) +
  labs(title='default theme',
       subtitle = 'Example subtitle',
       caption = "Here's a caption",
       x = 'Speed', y = 'Dist') 

p

p1 <- p + labs(title='bw theme') + theme_bw()
p2 <- p + labs(title='classic theme') + theme_classic()
p3 <- p + labs(title='minimal theme') + theme_minimal()
p4 <- p + labs(title='dark theme') + theme_dark()
p5 <- p + labs(title='void theme') + theme_void()

# any other favourite theme in the group?
themes_display <- (p | p1 | p2) / (p3 | p4 | p5) # making use of patchwork package
themes_display


# Fonts -------------------------------------------------------------------

# some fonts might need installing if they are not pre-installed in your system
# also fonts might have different names depending on the OS (in this case macOS)
# Herculanum, Baskerville, Impact, Luminari, Palatino, Trattatello, Monaco

p <- miris %>%
  ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point() +
  facet_wrap(~cat2, labeller = label_both) +
  labs(title='Example Chart',
       subtitle = 'Example subtitle',
       caption = "Here's a caption",
       x = 'Speed', y = 'Dist') + 
  theme_minimal()

p1 <- p + theme(text = element_text(family = "Herculanum"))
p2 <- p + theme(text = element_text(family = "Impact"))
p3 <- p + theme(text = element_text(family = "Luminari"))
p4 <- p + theme(text = element_text(family = "Palatino"))
p5 <- p + theme(text = element_text(family = "Monaco"))

# any other favourite theme in the group?
fonts_display <- (p | p1 | p2) / (p3 | p4 | p5) # making use of patchwork package
fonts_display


# Colors ------------------------------------------------------------------

pp <- p + 
  theme_minimal() + 
  theme(text = element_text(family = "Palatino"))

#change colors

pp +
  ggplot2::theme(strip.background = element_rect(fill = 'grey22'),
                strip.text       = element_text(color = "white",
                                                    face = 'bold'))

pp + 
  ggplot2::theme(panel.background = element_rect(fill = "grey88"))

pp + 
  ggplot2::theme(panel.background = element_rect(fill = "grey88"),
                 strip.background = element_rect(fill = 'grey22'),
                 strip.text       = element_text(color = "white",
                                                 face = 'bold'),
                 axis.text.x = element_text(angle=-90))

# requires sourcing or running the custom_theme R file
pp + 
  ggplot2::theme(panel.background = element_rect(fill = "grey88"),
                 strip.background = element_rect(fill = 'grey22'),
                 strip.text       = element_text(color = "white",
                                                 face = 'bold'),
                 plot.background  = element_rect(fill = my_colors$yellow),
                 legend.key        = element_rect(fill = my_colors$green),
                 legend.background = element_rect(fill = my_colors$blue),
                 legend.text = element_text(family = 'Impact'))

# requires sourcing or running the custom_theme R file
pp + 
  ggplot2::theme(panel.background = element_rect(fill = "grey88"),
                 strip.background = element_rect(fill = 'grey22'),
                 strip.text       = element_text(color = "white",
                                                 face = 'bold'),
                 plot.background  = element_rect(fill = my_colors$yellow)
                 )

pp +
  theme_marc()

# Extra: color palettes -------------------------------------------------------------------

# requires sourcing or running the custom_theme R file
pp + 
  scale_colour_manual(values = unlist(palettes_colors$vibrant_harmonious, use.names = FALSE)) +
  theme_marc()

# Extra: logos -------------------------------------------------------------------

library(ggtext)

#requires internet connection to download the logo from wikipedia
pp +
  labs(caption = "<img src='https://www.r-project.org/logo/Rlogo.png' width='25'/>") +
  theme(plot.caption = element_markdown())






