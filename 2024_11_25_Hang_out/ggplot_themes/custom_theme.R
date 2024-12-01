require(ggplot2)


# colors and palettes -----------------------------------------------------

my_colors <- list(
  red = "#e41a1c",
  blue = "#377eb8",
  yellow = "#ffff33",
  green = "#4daf4a"
  
)

palettes_colors <- list(
  vibrant_harmonious = list(
    crimson_red = '#DC143C',
    amber_yellow = '#FFC107',
    forest_green = '#228B22',
    sky_blue = '#87CEEB',
    royal_purple = '#7851A9',
    sunset_orange = '#FF4500',
    ocean_teal = '#008080',
    charcoal_gray = '#36454F',
    sand_beige = '#F5DEB3',
    pearl_white = '#FDFDFD'
  ),
  accessible = list(
    blue = '#377eb8',          # Vibrant Blue
    orange = '#ff7f00',        # Bold Orange
    green = '#4daf4a',         # Soft Green
    pink = '#f781bf',          # Bright Pink
    brown = '#a65628',         # Earthy Brown
    purple = '#984ea3',        # Deep Purple
    yellow = '#ffff33',        # Bright Yellow
    red = '#e41a1c',           # Strong Red
    gray = '#999999',          # Neutral Gray
    cyan = '#a6cee3'           # Light Cyan
  )
)
# usage
# scale_colour_manual(values = unlist(palettes_colors$accessible, use.names = FALSE))



# new theme ---------------------------------------------------------------

theme_workshop <- function(){
  ggplot2::theme_minimal(base_family = "Palatino") +
    ggplot2::theme(
      #add your configurations here
    )
    
}

# example theme ------------------------------------------------------------------

#we'll create a function to then call it later from ggplot pipe
#start providing a default theme to start working with, then add customisations

theme_marc <- function( base_family_font = "Palatino" ){
  ggplot2::theme_bw(base_family = base_family_font) +
    ggplot2::theme(       text             = element_text(color="grey11"),
                          plot.title       = element_text(size=16, 
                                                          lineheight=0.8, 
                                                          hjust=0,
                                                          face = "bold",
                                                          color="black"),
                          #plot.subtitle    = element_text(color='grey11'),
                          #plot.caption      = element_text(color='grey11'),
                          #axis.text        = element_text(size=12, color='grey11'),
                          axis.title.x     = element_text(size = 14, margin = margin(t = 10)),
                          axis.title.y     = element_text(size = 14, margin = margin(r = 10)),
                          panel.background = element_rect(fill = "grey88"),
                          plot.background  = element_rect(fill = "white"),
                          strip.background = element_rect(fill = "black"),
                          strip.text       = element_text(color = "white",
                                                          face = "bold"),
                          legend.key        = element_rect(fill = "white"),
                          legend.background = element_rect(fill = "white")
    )
}

