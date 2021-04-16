library(tidyverse)
library(oce)
library(lubridate)
library(gganimate)
library(ggplot2)

# Read in simulation data and data wrangling

ocean_vector <- tidync("OceanParcels/global-analysis-forecast-phy-001-024_1603882856077.nc") %>%
  hyper_tibble() %>%
  #dplyr::select(longitude, latitude, time, uo, vo) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00")) %>%
  filter(t >= as.Date("2018-01-01 00:00:00") & t <= as.Date("2018-01-30 00:00:00"))



############################################


ocean_vector <- tidync("OceanParcels/global-analysis-forecast-phy-001-024_1603882856077.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, longitude, latitude, uo, vo)

ocean_vector$velocity <- with(ocean_vector, sqrt(uo^2 + vo^2))

ocean_vector <- ocean_vector %>%
  group_by(longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

wind_vector <- tidync("OceanParcels/CERSAT-GLO-BLENDED_WIND_L4-V6-OBS_FULL_TIME_SERIE_1603883929498.nc") %>%
  hyper_tibble() %>%
  dplyr::select(lon, lat, eastward_wind, northward_wind)

wind_vector$velocity <- with(wind_vector, sqrt(eastward_wind^2 + northward_wind^2))

wind_vector = wind_vector %>%
  group_by(lon, lat) %>%
  summarise(eastward_wind = median(eastward_wind, na.rm = TRUE),
            northward_wind = median(northward_wind, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

load("map/south_africa_coast_hi_res.Rdata")

ocean_plot <-  ggplot() +
  geom_tile(data = ocean_vector, aes(fill = velocity, x = longitude, y = latitude)) +
  geom_segment(data = ocean_vector,
               aes(x = longitude, xend = longitude+uo, y = latitude,
               yend = latitude+vo), arrow = arrow(length = unit(0.30, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 0.6)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL)

ggsave("ocean_plot.png", dpi = 320, width = 8, height = 8, path = "figures/chapter_3/", units = "in")


wind_plot <- ggplot() +
  geom_tile(data = wind_vector, aes(fill = velocity, x = lon, y = lat)) +
  #geom_raster(data = wind_vector, aes(x = lon, y = lat, fill = velocity))+
  geom_segment(data = wind_vector,
               aes(x = lon, xend = lon+eastward_wind/30, y = lat,
               yend = lat+northward_wind/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 10)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL)

ggsave("wind_plot.png", dpi = 320, width = 8, height = 8, path = "figures/chapter_3/", units = "in")

ggarrange(ocean_plot, wind_plot, font.label = list(size = 11, face = "bold"), ncol = 2, nrow = 1)

ggsave("wind_plot.png", dpi = 320, width = 8, height = 8, path = "figures/chapter_3/", units = "in")

ggplot() +
  geom_tile(data = wind_vector, aes(fill = velocity, x = lon, y = lat)) +
  scale_fill_continuous(type = "viridis", limits = c(0, 10)) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL) +
  coord_polar(direction = 1)
