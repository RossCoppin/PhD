library(gganimate)
library(plotly)

ocean_vector <- tidync("OceanParcels/global-analysis-forecast-phy-001-024_1603882856077.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, longitude, latitude, uo, vo) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.Date(as.POSIXct(t * 3600, origin = "2018-01-01 00:00:00"),
                     "GMT",
                     "%Y-%m-%d"))

ocean_jan <-  ocean_vector %>%
  filter(t >= ("2086-01-01 00:00:00") & t <= ("2086-01-30 00:00:00"))
ocean_apr <-  ocean_vector %>%
  filter(t >= ("2086-04-01 00:00:00") & t <= ("2086-04-30 00:00:00"))
ocean_july <-  ocean_vector %>%
  filter(t >= ("2086-07-01 00:00:00") & t <= ("2086-07-30 00:00:00"))
ocean_oct <-  ocean_vector %>%
  filter(t >= ("2086-10-01 00:00:00") & t <= ("2086-10-30 00:00:00"))

ocean_jan$velocity <- with(ocean_jan, sqrt(uo^2 + vo^2))
ocean_apr$velocity <- with(ocean_apr, sqrt(uo^2 + vo^2))
ocean_july$velocity <- with(ocean_july, sqrt(uo^2 + vo^2))
ocean_oct$velocity <- with(ocean_oct, sqrt(uo^2 + vo^2))

ocean_jan_summary_ani <- ocean_jan %>%
  group_by(t, longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

ocean_apr_summary_ani <- ocean_apr %>%
  group_by(t, longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

ocean_july_summary_ani <- ocean_july %>%
  group_by(t, longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

ocean_oct_summary_ani <- ocean_oct %>%
  group_by(t, longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))


# January ocean vector map

load("map/south_africa_coast_hi_res.Rdata")

ocean_plot_jan_ani <-  ggplot() +
  geom_tile(data = ocean_jan_summary_ani, aes(fill = velocity, x = longitude, y = latitude)) +
  geom_segment(data = ocean_jan_summary_ani[seq(5, nrow(ocean_jan_summary_ani),2), ],
               aes(x = longitude, xend = longitude+uo/30, y = latitude,
                   yend = latitude+vo/30), arrow = arrow(length = unit(0.30, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 0.8)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL, title = "Month of : {frame_time}")+
  transition_time(t) +
  ease_aes("linear")

animate(ocean_plot_jan_ani)

# April ocean vector map

ocean_plot_apr_ani <-  ggplot() +
  geom_tile(data = ocean_apr_summary_ani, aes(fill = velocity, x = longitude, y = latitude)) +
  geom_segment(data = ocean_apr_summary_ani[seq(5, nrow(ocean_apr_summary_ani), 2), ],
               aes(x = longitude, xend = longitude+uo/30, y = latitude,
                   yend = latitude+vo/30), arrow = arrow(length = unit(0.30, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 0.8)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL, title = "Month of : {frame_time}")+
  transition_time(t) +
  ease_aes("linear")

animate(ocean_plot_apr_ani)

# July ocean vector map

ocean_plot_july_ani <-  ggplot() +
  geom_tile(data = ocean_july_summary_ani, aes(fill = velocity, x = longitude, y = latitude)) +
  geom_segment(data = ocean_july_summary_ani[seq(5, nrow(ocean_july_summary_ani), 2), ],
               aes(x = longitude, xend = longitude+uo/30, y = latitude,
                   yend = latitude+vo/30), arrow = arrow(length = unit(0.30, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 0.8)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL, title = "Month of : {frame_time}")+
  transition_time(t) +
  ease_aes("linear")

animate(ocean_plot_july_ani)

# October ocean vector map

ocean_plot_oct_ani <-  ggplot() +
  geom_tile(data = ocean_oct_summary_ani, aes(fill = velocity, x = longitude, y = latitude)) +
  geom_segment(data = ocean_oct_summary_ani[seq(5, nrow(ocean_oct_summary_ani), 2), ],
               aes(x = longitude, xend = longitude+uo/30, y = latitude,
                   yend = latitude+vo/30), arrow = arrow(length = unit(0.30, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 0.8)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL, title = "Month of : {frame_time}")+
  transition_time(t) +
  ease_aes("linear")

animate(ocean_plot_oct_ani)

# Wind animation script --------------------------------------------------------

wind_vector <- tidync("OceanParcels/CERSAT-GLO-BLENDED_WIND_L4-V6-OBS_FULL_TIME_SERIE_1603883929498.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, lon, lat, eastward_wind, northward_wind) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.Date(as.POSIXct(t * 3600, origin = "2018-01-01 00:00:00"),
                     "GMT",
                     "%Y-%m-%d"))

wind_jan <-  wind_vector %>%
  filter(t >= ("2136-01-01 00:00:00") & t <= ("2136-01-30 00:00:00"))
wind_apr <-  wind_vector %>%
  filter(t >= ("2136-04-01 00:00:00") & t <= ("2136-04-30 00:00:00"))
wind_july <-  wind_vector %>%
  filter(t >= ("2136-07-01 00:00:00") & t <= ("2136-07-30 00:00:00"))
wind_oct <-  wind_vector %>%
  filter(t >= ("2136-10-01 00:00:00") & t <= ("2136-10-30 00:00:00"))

wind_jan$velocity <- with(wind_jan, sqrt(eastward_wind^2 + northward_wind^2))
wind_apr$velocity <- with(wind_apr, sqrt(eastward_wind^2 + northward_wind^2))
wind_july$velocity <- with(wind_july, sqrt(eastward_wind^2 + northward_wind^2))
wind_oct$velocity <- with(wind_oct, sqrt(eastward_wind^2 + northward_wind^2))

wind_jan_summary_ani <- wind_jan %>%
  group_by(t, lon, lat) %>%
  summarise(eastward_wind = median(eastward_wind, na.rm = TRUE),
            northward_wind = median(northward_wind, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

wind_apr_summary_ani <- wind_apr %>%
  group_by(t, lon, lat) %>%
  summarise(eastward_wind = median(eastward_wind, na.rm = TRUE),
            northward_wind = median(northward_wind, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

wind_july_summary_ani <- wind_july %>%
  group_by(t, lon, lat) %>%
  summarise(eastward_wind = median(eastward_wind, na.rm = TRUE),
            northward_wind = median(northward_wind, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

wind_oct_summary_ani <- wind_oct %>%
  group_by(t, lon, lat) %>%
  summarise(eastward_wind = median(eastward_wind, na.rm = TRUE),
            northward_wind = median(northward_wind, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))


# January wind vector map animation

load("map/south_africa_coast_hi_res.Rdata")

wind_ani_jan <- ggplot() +
  geom_tile(data = wind_jan_summary_ani, aes(fill = velocity, x = lon, y = lat)) +
  #geom_raster(data = wind_vector, aes(x = lon, y = lat, fill = velocity))+
  geom_segment(data = wind_jan_summary_ani,
               aes(x = lon, xend = lon+eastward_wind/30, y = lat,
                   yend = lat+northward_wind/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 11)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL, title = "Month of : {frame_time}")+
  transition_time(t) +
  ease_aes("linear")

animate(wind_ani_jan)

# April wind vector map animation

wind_ani_apr <- ggplot() +
  geom_tile(data = wind_apr_summary_ani, aes(fill = velocity, x = lon, y = lat)) +
  #geom_raster(data = wind_vector, aes(x = lon, y = lat, fill = velocity))+
  geom_segment(data = wind_apr_summary_ani,
               aes(x = lon, xend = lon+eastward_wind/30, y = lat,
                   yend = lat+northward_wind/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 11)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL, title = "Month of : {frame_time}")+
  transition_time(t) +
  ease_aes("linear")

animate(wind_ani_apr)

# July wind vector map animation

wind_ani_july <- ggplot() +
  geom_tile(data = wind_july_summary_ani, aes(fill = velocity, x = lon, y = lat)) +
  #geom_raster(data = wind_vector, aes(x = lon, y = lat, fill = velocity))+
  geom_segment(data = wind_july_summary_ani,
               aes(x = lon, xend = lon+eastward_wind/30, y = lat,
                   yend = lat+northward_wind/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 11)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL, title = "Month of : {frame_time}")+
  transition_time(t) +
  ease_aes("linear")

animate(wind_ani_july)

# October wind vector map animation

wind_ani_oct <- ggplot() +
  geom_tile(data = wind_oct_summary_ani, aes(fill = velocity, x = lon, y = lat)) +
  #geom_raster(data = wind_vector, aes(x = lon, y = lat, fill = velocity))+
  geom_segment(data = wind_oct_summary_ani,
               aes(x = lon, xend = lon+eastward_wind/30, y = lat,
                   yend = lat+northward_wind/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black",fill = "grey") +
  scale_fill_continuous(type = "viridis", limits = c(0, 11)) +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1)) +
  labs(x = NULL, y = NULL, title = "Month of : {frame_time}")+
  transition_time(t) +
  ease_aes("linear")

animate(wind_ani_oct)
