########################################
########## load libraries ##############
########################################
library(tidyverse)
library(purrr)
library(magrittr)
library(scales)
library(gganimate)
library(magick)
library(gifski)

########################################
##### create artificial data set #######
########################################
data_revenue <-
  bind_rows(
    tibble(
      test_group = 'Control',
      age = 0:90,
      arpu = cumsum(seq(0.4, 0.1, length.out = 91) / 10)
    ),
    tibble(
      test_group = 'Test',
      age = 0:90,
      arpu = cumsum(seq(0.36, 0.26, length.out = 91) / 10)
    )
  ) %>%
  mutate(lower = arpu * (1 - seq(0.03, 0.08, length.out = 91)),
         upper = arpu * (1 + seq(0.03, 0.08, length.out = 91)))


###############################################
######## create a fancy animated chart ########
###############################################

#### Step 0
data_revenue


#### Step 1
gif1 <-
  data_revenue %>%
  ggplot(aes(
    x = age,
    y = arpu,
    color = test_group,
    fill = test_group
  )) +
  geom_ribbon(aes(ymin = lower, ymax = upper),
              alpha = 0.3,
              size = 0) +
  scale_y_continuous(labels = dollar_format(prefix = "$")) +
  theme_bw()

gif1

#### Step 2
gif2 <-
  gif1 +
  geom_point(aes(y = arpu), size = 7)

gif2

#### Step 3
gif3 <-
  gif2 +
  geom_errorbar(aes(
    ymin = lower,
    ymax = upper,
    width = (age + 1) / 20
  ),
  size = 1)

gif3


#### Step 4
gif4 <-
  gif3 +
  scale_y_continuous(labels = dollar_format(prefix = "$")) +
  theme_minimal() +
  theme(
    strip.text.x = element_text(size = 25, colour = "black"),
    axis.title.y = element_blank(),
    text = element_text(size = 25),
    plot.title = element_text(size = 25, hjust = 0.5),
    plot.subtitle = element_text(size = 20, hjust = 0.5),
    legend.position = 'top'
  )

gif4

#### Step 5
gif5 <-
  gif4 +
  labs(
    y = '',
    color = '',
    fill = '',
    linetype = '',
    title = 'LTV curve per test group',
    subtitle = '95% confidence intervals'
  )

gif5


################################################
############ Animating plot 1 ##################
################################################
#### Step 6
gif6 <-
  gif5 +
  transition_reveal(as.integer(age)) +
  labs(x = 'Days since install: {frame_along}') +
  view_follow(fixed_y = FALSE, fixed_x = FALSE)

#### Step 7
sink_gif_animated <-
  animate(
    gif6,
    fps = 40,
    detail = 40,
    duration = 10,
    width = 600,
    height = 800,
    units = "px",
    renderer = gifski_renderer()
  )

#### Step 8
save_animation(animation = sink_gif_animated, file = '~/arpu.gif')



################################################
############ Animating plot 2 ##################
################################################
#### Step 6
gif6 <-
  gif5 +
  transition_reveal(as.integer(age)) +
  labs(x = 'Days since install: {frame_along}') +
  view_follow(fixed_y = TRUE, fixed_x = FALSE)

#### Step 7
sink_gif_animated <-
  animate(
    gif6,
    fps = 40,
    detail = 40,
    duration = 10,
    width = 600,
    height = 800,
    units = "px",
    renderer = gifski_renderer()
  )

#### Step 8
save_animation(animation = sink_gif_animated, file = '~/arpu1.gif')


################################################
############ Animating plot 3 ##################
################################################
#### Step 6
gif6 <-
  gif5 +
  transition_reveal(as.integer(age)) +
  labs(x = 'Days since install: {frame_along}') +
  view_follow(fixed_y = FALSE, fixed_x = TRUE)

#### Step 7
sink_gif_animated <-
  animate(
    gif6,
    fps = 40,
    detail = 40,
    duration = 10,
    width = 600,
    height = 800,
    units = "px",
    renderer = gifski_renderer()
  )

#### Step 8
save_animation(animation = sink_gif_animated, file = '~/arpu2.gif')



################################################
############ Animating plot 4 ##################
################################################
#### Step 6
gif6 <-
  gif5 +
  transition_reveal(as.integer(age)) +
  labs(x = 'Days since install: {frame_along}') +
  view_follow(fixed_y = FALSE, fixed_x = FALSE)

#### Step 7
sink_gif_animated <-
  animate(
    gif6,
    fps = 40,
    detail = 40,
    duration = 10,
    width = 600,
    height = 800,
    units = "px",
    rewind = TRUE,
    renderer = gifski_renderer()
  )

#### Step 8
save_animation(animation = sink_gif_animated, file = '~/arpu3.gif')






################################################
############ Animating plot 5 ##################
################################################
#### Step 6
gif6 <-
  gif5 +
  transition_reveal(as.integer(age)) +
  labs(x = 'Days since install: {frame_along}') +
  view_follow(fixed_y = TRUE, fixed_x = TRUE)

#### Step 7
sink_gif_animated <-
  animate(
    gif6,
    fps = 40,
    detail = 40,
    duration = 10,
    width = 600,
    height = 800,
    units = "px",
    renderer = gifski_renderer()
  )

#### Step 8
save_animation(animation = sink_gif_animated, file = '~/arpu4.gif')
