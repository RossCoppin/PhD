# use chapter 3 script to load the data, packages specific to the animation will be loaded here

library(ggplot2)
library(gganimate)
library(gifski)


waterdrag_plot <- ggplot()+
  geom_path(data = p_RK4_mean, aes(x = lon, y = lat), color = 'black') +
  geom_point(data = p_RK4_mean, aes(x = lon, y = lat), color = 'black') +
  geom_path(data = Mean_Kfloat_H100_W00_mean, aes(x = lon, y = lat), color = 'blue') +
  geom_path(data = Mean_Kfloat_H100_W00_mean, aes(x = lon, y = lat), color = 'orange') +
  geom_path(data = Max_Kfloat_H100_W00_mean, aes(x = lon, y = lat), color = 'red') +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme_bw() +
  transition_time(t)

######################################## Animations for the density plots ################################################
## Coastline of Southern Africa
load("map/south_africa_coast_hi_res.Rdata")

ani_heatmap_RK4 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_RK4, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = p_RK4, bins = 80, aes(x = lon, y = lat), legend = FALSE) +  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("Passive") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_RK4.gif", ani_heatmap_RK4)

ani_heatmap_Min_Kfloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Min_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MinH100W100") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Min_Kfloat_H100_W00.gif", ani_heatmap_Min_Kfloat_H100_W00)

ani_heatmap_Min_Kfloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Min_Kfloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MinH095W05") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Min_Kfloat_H095_W05.gif", ani_heatmap_Min_Kfloat_H095_W05)

ani_heatmap_Min_Kfloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Min_Kfloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MinH090W10") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Min_Kfloat_H090_W10.gif", ani_heatmap_Min_Kfloat_H090_W10)

ani_heatmap_Min_Kfloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Min_Kfloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",        limits = c(1, 13000)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MinH085W15") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Min_Kfloat_H085_W15.gif", ani_heatmap_Min_Kfloat_H085_W15)

ani_heatmap_Mean_Kfloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Mean_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",       limits = c(1, 13000)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MeanH100W00") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Mean_Kfloat_H100_W00.gif", ani_heatmap_Mean_Kfloat_H100_W00)

ani_heatmap_Mean_KFloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app1, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Mean_KFloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +  scale_fill_continuous(type = "gradient",       limits = c(1, 13000)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MeanH095W05") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Mean_KFloat_H095_W05.gif", ani_heatmap_Mean_KFloat_H095_W05)

ani_heatmap_Mean_KFloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Mean_KFloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MeanH090W10") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Mean_KFloat_H090_W10.gif", ani_heatmap_Mean_KFloat_H090_W10)

ani_heatmap_Mean_KFloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Mean_KFloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MeanH085W15") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Mean_KFloat_H085_W15.gif", ani_heatmap_Mean_KFloat_H085_W15)

ani_heatmap_Max_KFloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Max_Kfloat_H100_W00, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MaxH100W00") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Max_KFloat_H100_W00.gif", ani_heatmap_Max_KFloat_H100_W00)

ani_heatmap_Max_KFloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Max_Kfloat_H095_W05, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MaxH095W05") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Max_KFloat_H095_W05.gif", ani_heatmap_Max_KFloat_H095_W05)

ani_heatmap_Max_KFloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Max_Kfloat_H090_W10, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_viridis_c(name = "Density", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MaxH090W10") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Max_KFloat_H090_W10.gif", ani_heatmap_Max_KFloat_H090_W10)

ani_heatmap_Max_KFloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  #geom_bin2d(data = k_app2, bins = 80, aes(x = lon, y = lat)) +
  geom_hex(data = Max_Kfloat_H085_W15, bins = 80, aes(x = lon, y = lat)) +
  scale_fill_viridis_c(name = "Density ", limits = c(0, 1000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MaxH085W15") +
  #guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_heatmap_Max_KFloat_H085_W15.gif", ani_heatmap_Max_KFloat_H085_W15)

######################## Animations using points ##############################################################################

ani_point_RK4 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = p_RK4, aes(x = lon, y = lat), legend = FALSE) +  scale_fill_continuous(type = "gradient", limits = c(1, 13000)) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("Passive") +
  guides(fill=guide_legend(title="Velocity (m/s)")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_RK4.gif", ani_point_RK4)

ani_point_Min_Kfloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Min_Kfloat_H100_W00, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim =   c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MinH100W100") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Min_Kfloat_H100_W00.gif", ani_point_Min_Kfloat_H100_W00)

ani_point_Min_Kfloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Min_Kfloat_H095_W05, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MinH095W05") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Min_Kfloat_H095_W05.gif", ani_point_Min_Kfloat_H095_W05)

ani_point_Min_Kfloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Min_Kfloat_H090_W10, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MinH090W10") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Min_Kfloat_H090_W10.gif", ani_point_Min_Kfloat_H090_W10)

ani_point_Min_Kfloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Min_Kfloat_H085_W15, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MinH085W15") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Min_Kfloat_H085_W15.gif", ani_point_Min_Kfloat_H085_W15)

ani_point_Mean_Kfloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Mean_Kfloat_H100_W00, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MeanH100W00") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Mean_Kfloat_H100_W00.gif", ani_point_Mean_Kfloat_H100_W00)

ani_point_Mean_KFloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Mean_KFloat_H095_W05, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MeanH095W05") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Mean_KFloat_H095_W05.gif", ani_point_Mean_KFloat_H095_W05)

ani_point_Mean_KFloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Mean_KFloat_H090_W10, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MeanH090W00") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Mean_KFloat_H090_W10.gif", ani_point_Mean_KFloat_H090_W10)

ani_point_Mean_KFloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Mean_KFloat_H085_W15, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MeanH085W15") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Mean_KFloat_H085_W15.gif", ani_point_Mean_KFloat_H085_W15)

ani_point_Max_KFloat_H100_W00 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Max_Kfloat_H100_W00, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MaxH100W00") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Max_KFloat_H100_W00.gif", ani_point_Max_KFloat_H100_W00)

ani_point_Max_KFloat_H095_W05 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Max_Kfloat_H095_W05, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MaxH095W05") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Max_KFloat_H095_W05.gif", ani_point_Max_KFloat_H095_W05)

ani_point_Max_KFloat_H090_W10 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Max_Kfloat_H090_W10, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MaxH090W10") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Max_KFloat_H090_W10.gif", ani_point_Max_KFloat_H090_W10)

ani_point_Max_KFloat_H085_W15 <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = NA) +
  geom_point(data = Max_Kfloat_H085_W15, aes(x = lon, y = lat, colour = velocity)) +
  scale_color_viridis_c(name = "Velocity\n (m/s)") +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  xlab("Longtitude") +
  ylab("Latitude") +
  ggtitle("MaxH085W15") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  transition_time(t)

anim_save("OceanParcels/animations/ani_point_Max_KFloat_H085_W15.gif", ani_heatmap_Max_KFloat_H085_W15)


##--- Eddy experiment (experiment 2)

total_eddy_passive <- total_eddy_passive %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
total_eddy_hydro <- total_eddy_hydro %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
total_eddy_comb <- total_eddy_comb %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))

eddy_comb_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  geom_point(data = total_eddy_passive, aes(x = lon, y = lat, colour = "blue"), show.legend = TRUE) +
  geom_point(data = total_eddy_hydro, aes(x = lon, y = lat, colour = "green"), show.legend = TRUE) +
  geom_point(data = total_eddy_comb, aes(x = lon, y = lat, colour = "red"), show.legend = TRUE) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Time : {frame_time}') +
  guides(colour=guide_legend(title="Type")) +
  coord_fixed(ratio=1, clip = "on", xlim = c(11, 20), ylim = c(-36, -28)) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(t)

animate(eddy_comb_ani, device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_3/eddy_comb_ani.gif", eddy_comb_ani)

#--- New animations for updated data. script taken from associated rmd file (thesis_chapter_3) ---#

## Heatmaps of study domain, use previous data for study site map and histograms

point_summer_ani <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  facet_wrap("type") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  geom_point(data = total_summer, aes(x = lon, y = lat, colour = velocity)) +
  scale_colour_continuous(type = "viridis")  +
  coord_cartesian(xlim = c(11, 20), ylim = c(-35, -28)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("Kelp Particles") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  transition_time(age)

animate(point_summer_ani, device = 'png', duration = 25)
anim_save("OceanParcels/animations/chapter_3/point_summer_ani.gif", point_summer_ani)

point_autumn_ani <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  #geom_hex(data = total_autumn, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  #scale_fill_continuous(type = "viridis",limits = c(1, 5000))  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  facet_wrap("type") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  geom_point(data = total_autumn, aes(x = lon, y = lat, colour = velocity)) +
  scale_colour_continuous(type = "viridis")  +
  coord_cartesian(xlim = c(11, 20), ylim = c(-35, -28)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  transition_time(age)

animate(point_autumn_ani, device = 'png', duration = 25)
anim_save("OceanParcels/animations/chapter_3/point_autumn_ani.gif", point_autumn_ani)

point_winter_ani <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  #geom_hex(data = total_winter, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  #scale_fill_continuous(type = "viridis",limits = c(1, 5000))  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  facet_wrap("type") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  geom_point(data = total_winter, aes(x = lon, y = lat, colour = velocity)) +
  scale_colour_continuous(type = "viridis")  +
  coord_cartesian(xlim = c(11, 20), ylim = c(-35, -28)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("Kelp Particles") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  transition_time(age)

animate(point_winter_ani, device = 'png', duration = 25)
anim_save("OceanParcels/animations/chapter_3/point_winter_ani.gif", point_winter_ani)

point_spring_ani <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  #geom_hex(data = total_spring, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  #scale_fill_continuous(type = "viridis",limits = c(1, 5000))  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  facet_wrap("type") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  geom_point(data = total_spring, aes(x = lon, y = lat, colour = velocity)) +
  scale_colour_continuous(type = "viridis")  +
  coord_cartesian(xlim = c(11, 20), ylim = c(-35, -28)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  transition_time(age)

animate(point_spring_ani, device = 'png', duration = 25)
anim_save("OceanParcels/animations/chapter_3/point_spring_ani.gif", point_spring_ani)

### Passive passive

heatmap_summer_passive_ani <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  geom_hex(data = total_passive_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  scale_fill_continuous(type = "viridis",limits = c(1, 5000))  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  facet_wrap("type") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  coord_cartesian(xlim = c(11, 20), ylim = c(-35, -28)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("Passive Particles") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

heatmap_autumn_passive_ani <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  geom_hex(data = total_passive_autumn, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  scale_fill_continuous(type = "viridis",limits = c(1, 5000))  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  facet_wrap("type") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  coord_cartesian(xlim = c(11, 20), ylim = c(-35, -28)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

heatmap_winter_passive_ani <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  geom_hex(data = total_passive_winter, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  scale_fill_continuous(type = "viridis",limits = c(1, 5000))  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  facet_wrap("type") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  coord_cartesian(xlim = c(11, 20), ylim = c(-35, -28)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("Passive Particles") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

heatmap_spring_passive_ani <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  geom_hex(data = total_passive_spring, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  scale_fill_continuous(type = "viridis",limits = c(1, 5000))  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  facet_wrap("type") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  coord_cartesian(xlim = c(11, 20), ylim = c(-35, -28)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))








