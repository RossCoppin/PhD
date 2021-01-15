# use chapter 3 script to load the data, packages specific to the animation will be loaded here

#require(xtractomatic)
require(tidyverse)
require(oce)
require(lubridate)
require(gganimate)
require(sf)
require(transformr)

# Animations for the density plots
## Coastline of Southern Africa
load("map/south_africa_coast_hi_res.Rdata")

ani_heatmap_RK4 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_RK4, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = p_RK4, bins = 80, aes(x = lon, y = lat), legend = FALSE) +  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("Passive") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

ani_heatmap_Min_Kfloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Min_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("H100W100") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Min_Kfloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Min_Kfloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  ggtitle("H095W05") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Min_Kfloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Min_Kfloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("H090W10") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Min_Kfloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Min_Kfloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("H085W15") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Mean_Kfloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Mean_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",       limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Mean_KFloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app1, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Mean_KFloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",       limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Mean_KFloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Mean_KFloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Mean_KFloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Mean_KFloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Max_KFloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Max_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Max_KFloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Max_Kfloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  theme(plot.title = element_text(hjust = 0.5)) +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Max_KFloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Max_Kfloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Max_KFloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Max_Kfloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

######################## Animations using points ##############################################################################

ani_point_RK4 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = p_RK4, bins = 80, aes(x = lon, y = lat), legend = FALSE) +  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("Passive") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

ani_point_Min_Kfloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Min_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("H100W100") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Min_Kfloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Min_Kfloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  ggtitle("H095W05") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Min_Kfloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Min_Kfloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("H090W10") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Min_Kfloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Min_Kfloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("H085W15") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Mean_Kfloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Mean_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",       limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Mean_KFloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app1, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Mean_KFloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",       limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Mean_KFloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Mean_KFloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Mean_KFloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Mean_KFloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Max_KFloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Max_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Max_KFloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Max_Kfloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  theme(plot.title = element_text(hjust = 0.5)) +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_point_Max_KFloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Max_Kfloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)


ani_heatmap_Max_KFloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_point(data = Max_Kfloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

#################################### vector animation ##########################################################

 current_vector <- tidync("OceanParcels/model_data/global-analysis-forecast-phy-001-024_1603882856077.nc") %>%
  hyper_tibble() %>%
  dplyr::select(uo, vo, lon, lat, time) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
mean_current_vector <- current_vector %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))








