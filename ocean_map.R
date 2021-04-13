library(tidyverse)
library(oce)
library(lubridate)
library(gganimate)
library(ggplot2)

# Read in simulation data and data wrangling

ocean_vector <- tidync("OceanParcels/global-analysis-forecast-phy-001-024_1603882856077.nc") %>%
  hyper_tibble() %>%
  dplyr::select(longitude, latitude, time, uo, vo) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
 #filter(between(t, as.POSIXct("2018-01-01"), as.POSIXct("2018-01-05")))
 #mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))  %>% # calculate mean trajectory

ocean_vector$velocity <- with(ocean_vector, sqrt(uo^2 + vo^2))

ocean_summary = ocean_vector %>%
  group_by(longitude, latitude, t) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

load("map/south_africa_coast_hi_res.Rdata")

test_plot = ggplot() +
  geom_segment(data = ocean_summary,
               aes(x = longitude, xend = longitude+uo/60, y = latitude,
               yend = latitude+vo/60), arrow = arrow(length = unit(0.25, "cm"))) +
  #geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  #coord_cartesian(xlim = c(8, 28), ylim = c(-38, -26)) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL)
