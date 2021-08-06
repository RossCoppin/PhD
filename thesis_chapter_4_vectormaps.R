load("map/south_africa_coast_hi_res.Rdata")
#ggsave("fig_3A.jpeg", plot = temp_plot, dpi = 300, device = "jpeg" , path = "figures/")

ocean_summer_2018 <- tidync("OceanParcels/chapter_4_oceanmodel/copernicus_phy001_030/global-reanalysis-phy-001-030-daily_1625758460342.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, longitude, latitude, uo, vo) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.Date(as.POSIXct(t * 3600, origin = "2019-01-01 00:00:00"),
                     "GMT",
                     "%Y-%m-%d-%h"))

ocean_autumn_2018 <- tidync("OceanParcels/chapter_4_oceanmodel/copernicus_phy001_030/global-reanalysis-phy-001-030-daily_1625759550563.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, longitude, latitude, uo, vo) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.Date(as.POSIXct(t * 3600, origin = "2019-01-01 00:00:00"),
                     "GMT",
                     "%Y-%m-%d-%h"))

ocean_winter_2018 <- tidync("OceanParcels/chapter_4_oceanmodel/copernicus_phy001_030/global-reanalysis-phy-001-030-daily_1625760938909.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, longitude, latitude, uo, vo) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.Date(as.POSIXct(t * 3600, origin = "2019-01-01 00:00:00"),
                     "GMT",
                     "%Y-%m-%d-%h"))

ocean_spring_2018 <- tidync("OceanParcels/chapter_4_oceanmodel/copernicus_phy001_030/global-reanalysis-phy-001-030-daily_1625761875172.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, longitude, latitude, uo, vo) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.Date(as.POSIXct(t * 3600, origin = "2019-01-01 00:00:00"),
                     "GMT",
                     "%Y-%m-%d-%h"))

ocean_summer_2018$velocity <- with(ocean_summer_2018, sqrt(uo^2 + vo^2))
ocean_autumn_2018$velocity <- with(ocean_autumn_2018, sqrt(uo^2 + vo^2))
ocean_winter_2018$velocity <- with(ocean_winter_2018, sqrt(uo^2 + vo^2))
ocean_spring_2018$velocity <- with(ocean_spring_2018, sqrt(uo^2 + vo^2))

ocean_summer_2018 <- ocean_summer_2018 %>%
  group_by(longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

ocean_autumn_2018 <- ocean_autumn_2018 %>%
  group_by(longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

ocean_winter_2018 <- ocean_winter_2018 %>%
  group_by(longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

ocean_spring_2018 <- ocean_spring_2018 %>%
  group_by(longitude, latitude) %>%
  summarise(uo = median(uo, na.rm = TRUE),
            vo = median(vo, na.rm = TRUE),
            velocity = median(velocity, na.rm = TRUE))

ocean_summer_2018_map <-  ggplot() +
  geom_tile(data = ocean_summer_2018, aes(fill = velocity, x = longitude, y = latitude)) +
  #geom_segment(data = ocean_jan_summary[seq(5, nrow(ocean_jan_summary),5), ],
  #aes(x = longitude, xend = longitude+uo/30, y = latitude,
  # yend = latitude+vo/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 0.4, colour = "black",fill = "grey") +
  scale_fill_viridis_c(aesthetics = "fill", option = "D", limits = c(0, 0.8)) +
  coord_fixed(ratio=1, xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1),
        element_blank()) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E))

ggsave("chapter_4_vectormap_summer.jpeg", plot = ocean_summer_2018_map, dpi = 300, device = "jpeg" , path = "figures/chapter_4/")

ocean_autumn_2018_map <-  ggplot() +
  geom_tile(data = ocean_autumn_2018, aes(fill = velocity, x = longitude, y = latitude)) +
  #geom_segment(data = ocean_jan_summary[seq(5, nrow(ocean_jan_summary),5), ],
  #aes(x = longitude, xend = longitude+uo/30, y = latitude,
  # yend = latitude+vo/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 0.4, colour = "black",fill = "grey") +
  scale_fill_viridis_c(aesthetics = "fill", option = "D", limits = c(0, 0.8)) +
  coord_fixed(ratio=1, xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1),
        element_blank()) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E))

ggsave("chapter_4_vectormap_autumn.jpeg", plot = ocean_autumn_2018_map, dpi = 300, device = "jpeg" , path = "figures/chapter_4/")

ocean_winter_2018_map <-  ggplot() +
  geom_tile(data = ocean_winter_2018, aes(fill = velocity, x = longitude, y = latitude)) +
  #geom_segment(data = ocean_jan_summary[seq(5, nrow(ocean_jan_summary),5), ],
  #aes(x = longitude, xend = longitude+uo/30, y = latitude,
  # yend = latitude+vo/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 0.4, colour = "black",fill = "grey") +
  scale_fill_viridis_c(aesthetics = "fill", option = "D", limits = c(0, 0.8)) +
  coord_fixed(ratio=1, xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1),
        element_blank()) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E))

ggsave("chapter_4_vectormap_winter.jpeg", plot = ocean_winter_2018_map, dpi = 300, device = "jpeg" , path = "figures/chapter_4/")

ocean_spring_2018_map <-  ggplot() +
  geom_tile(data = ocean_spring_2018, aes(fill = velocity, x = longitude, y = latitude)) +
  #geom_segment(data = ocean_jan_summary[seq(5, nrow(ocean_jan_summary),5), ],
  #aes(x = longitude, xend = longitude+uo/30, y = latitude,
  # yend = latitude+vo/30), arrow = arrow(length = unit(0.25, "cm"))) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 0.4, colour = "black",fill = "grey") +
  scale_fill_viridis_c(aesthetics = "fill", option = "D", limits = c(0, 0.8)) +
  coord_fixed(ratio=1, xlim = c(15, 20), ylim = c(-35, -30)) +
  guides(fill=guide_legend(title="Velocity")) +
  theme_bw() +
  theme(axis.text = element_text(size = 11, colour = 1),
        element_blank()) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E))

ggsave("chapter_4_vectormap_spring.jpeg", plot = ocean_spring_2018_map, dpi = 300, device = "jpeg" , path = "figures/chapter_4/")

