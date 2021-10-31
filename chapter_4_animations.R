# use chapter 4 script to load the data, packages specific to the animation will be loaded here
library(ggplot2)
library(gganimate)
library(gifski)

load("map/south_africa_coast_hi_res.Rdata")
load("map/sa_bathy.RData")

total_summer <- total_summer %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))

summer_kelp_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_point(data = total_summer, aes(x = lon, y = lat, shape = site), size = 2.5) +
  scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  #scale_fill_viridis_c(aesthetics = "fill", option = "C") +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = total_summer_mean,aes(x = lon, y = lat, color = 'red'), show.legend =     FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Hours: {frame_time}') +
  guides(shape=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(summer_kelp_ani, device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_4/summer_kelp_ani.gif", summer_kelp_ani)


total_summer2 <- total_summer2 %>%
  mutate(t = as.Date.POSIXct(t, origin = "2017-12-01 00:00:00", format ="%Y-%m-%d %H:%M:%OS"))

summer2_kelp_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_point(data = total_summer2, aes(x = lon, y = lat, shape = site), size = 2.5) +
  scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  #scale_fill_viridis_c(aesthetics = "fill", option = "C") +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = total_summer_mean,aes(x = lon, y = lat, color = 'red'), show.legend =     FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Hours: {frame_time}') +
  guides(shape=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(summer2_kelp_ani, device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_4/summer2_kelp_ani.gif", summer2_kelp_ani)

autumn_kelp_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_point(data = total_autumn, aes(x = lon, y = lat, shape = site), size = 2.5) +
  scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  #scale_fill_viridis_c(aesthetics = "fill", option = "C") +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = total_summer_mean,aes(x = lon, y = lat, color = 'red'), show.legend =     FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Hours: {frame_time}') +
  guides(shape=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(autumn_kelp_ani, device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_4/autumn_kelp_ani.gif", autumn_kelp_ani)

autumn2_kelp_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_point(data = total_autumn2, aes(x = lon, y = lat, shape = site), size = 2.5) +
  scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  #scale_fill_viridis_c(aesthetics = "fill", option = "C") +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = total_summer_mean,aes(x = lon, y = lat, color = 'red'), show.legend =     FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Hours: {frame_time}') +
  guides(shape=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(autumn2_kelp_ani, device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_4/autumn2_kelp_ani.gif", autumn2_kelp_ani)

winter_kelp_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_point(data = total_winter, aes(x = lon, y = lat, shape = site), size = 2.5) +
  scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  #scale_fill_viridis_c(aesthetics = "fill", option = "C") +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = total_summer_mean,aes(x = lon, y = lat, color = 'red'), show.legend =     FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Hours: {frame_time}') +
  guides(shape=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(winter_kelp_ani,fps = 4, device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_4/winter_kelp_ani.gif", winter_kelp_ani)

winter2_kelp_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_point(data = total_winter2, aes(x = lon, y = lat, shape = site), size = 2.5) +
  scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  #scale_fill_viridis_c(aesthetics = "fill", option = "C") +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = total_summer_mean,aes(x = lon, y = lat, color = 'red'), show.legend =     FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Hours: {frame_time}') +
  guides(shape=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(winter2_kelp_ani, fps = 4,device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_4/winter2_kelp_ani.gif", winter2_kelp_ani)

spring_kelp_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_point(data = total_spring, aes(x = lon, y = lat, shape = site), size = 2.5) +
  scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  #scale_fill_viridis_c(aesthetics = "fill", option = "C") +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = total_summer_mean,aes(x = lon, y = lat, color = 'red'), show.legend =     FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Hours: {frame_time}') +
  guides(shape=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(spring_kelp_ani, fps = 4,device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_4/spring_kelp_ani.gif", spring_kelp_ani)

spring2_kelp_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_summer, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  geom_point(data = total_spring2, aes(x = lon, y = lat, shape = site), size = 2.5) +
  scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  #scale_fill_viridis_c(aesthetics = "fill", option = "C") +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = total_summer_mean,aes(x = lon, y = lat, color = 'red'), show.legend =     FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Hours: {frame_time}') +
  guides(shape=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(spring2_kelp_ani, fps = 4,device = 'png', duration = 60)
anim_save("OceanParcels/animations/chapter_4/spring2_kelp_ani.gif", spring2_kelp_ani)

# eddy experiments

total_kelp_eddy_ani <- read.csv(file = "OceanParcels/chapter_4_data/df_total_kelp_eddy.csv") %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))

eddy_plot_path_ani <- ggplot() +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2)+
  #geom_hex(data = total_kelp_eddy, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  #scale_fill_viridis_c(aesthetics = "fill", option = "B", limits = c(1, 300)) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  geom_point(data = total_kelp_eddy_ani, aes(x = lon, y = lat, colour = site), show.legend = TRUE) +
  #scale_shape_manual(values=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))+
  coord_cartesian(xlim = c(8.5, 18), ylim = c(-37, -29)) +
  #facet_wrap("site") +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  labs(title = 'Age (hrs): {frame_time}') +
  guides(colour=guide_legend(title="Site")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12)) +
  theme(legend.position = "bottom") +
  transition_time(age)

animate(eddy_plot_path_ani, fps = 4, device = 'png', duration = 30)
anim_save("OceanParcels/animations/chapter_4/eddy_plot_path_ani.gif", eddy_plot_path_ani)



