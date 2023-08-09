

# load packages 
library(data.table)
library(dplyr)
library(ggplot2)
library(pander)
library(tidytext) # For unnest_tokens
library(stringr) # For managing text

# ggplot theme 
theme <- theme(
  
  # 1. Background
  # (1) Remove background grids 
  panel.background = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.line = element_line(colour = "black"),
  
  # 2. Legend
  # # (1) remove legend
  # legend.position = "none",
  
  # # (2) legend position
  # # (correspond to axis coordination)
  # legend.position = "top"
  # legend.position = "bottom"
  # legend.position = c(0.8, 0.2)  # bottom right 
  # legend.position = c(1, 1)      # very top right
  # legend.position = c(0, 0)      # very bottom left
  legend.position = "right",   # top left
  
  # # (3) legend text size 
  # # # (a)legend title (ex: Species)
  legend.title = element_text(size = 8),
  # # # (b) legend text (ex: dog/cat/bird)
  legend.text = element_text(size = 6),
  
  # (3) Title 
  # # (a) remove title
  # legend.title = element_blank(),
  
  # # (b) title: center
  # #     title text size
  plot.title = element_text(hjust = 0.5, 
                            size = 10),
  
  # (4) Subtitle 
  # # (a) subtitle: center 
  # #     subtitle text size
  plot.subtitle = element_text(hjust = 0.5, 
                               size = 8),
  
  # (5) X-, Y-Axis
  # # (a) X, Y axis title text size (ex: Week)
  axis.title = element_text(size = 10),
  # # change x or y axis title text size 
  # axis.title.x = element_text(size = 8),
  # axis.title.y = element_text(size = 8),
  
  # # (b) X, Y axis label text size (e.g. 01/01/2020)
  axis.text = element_text(size = 12),
  
  # # (c) X-axis text angle: 90 degree
  axis.text.x = element_text(angle = 0),
  
  # # (d) remove axis line
  # # remove x-axis
  # axis.line.x = element_blank(),
  # # remove y-axis
  # axis.line.y = element_blank(),
  
  # # (e) remove axis ticks
  # # remove x-axis ticks
  # axis.ticks.x = element_blank(),
  # # remove y-axis ticks
  # axis.ticks.y = element_blank(),
  
  # # (f) change axis tick size 
  # change x-axis tick size 
  # axis.ticks.x = element_line(size = 0.2),
  
  # # (g) change axis line weight 
  # change x-axis line weight 
  # axis.line.x.bottom = element_line(size = 0.2),
  
  # (6) Caption (footnote)
  # # (a) change caption text size 
  # #     change caption font
  plot.caption = element_text(size = 6,
                              face = "italic")
  
  # (7) Plot Background color
  # plot.background = 
  #         element_rect(fill = "gray")
  
  # (8) Change font family for main text 
  # text = element_text(family = "Palatino")
)




