library(gganimate)
library(plotly)

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


# January wind vector map

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

animate(wind_ani_jan, fps = 10)
anim_save("wind_ani_jan.gif")

# Method 2 ---------------------------------------------------------------------

anim_plot <- function(data) {

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
    labs(x = NULL, y = NULL) +
    transition_time(t) +
    ease_aes("linear")
}

plt.dat %>%
  # dplyr::filter(t == "2020-12-01") %>%
  dplyr::group_split(t) %>%
  purrr::map(.f = anim_plot)


# Animate... --------------------------------------------------------------

# animate in the terminal using ffmpeg:
ffmpeg \
-framerate 2 \
-pattern_type glob -i 'OISST_*.jpg' \
-vf scale=1280:-2 \
OISST_Extreme_events_animate.mp4 \
;

