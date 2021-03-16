# remember to load software from parent script

load("map/south_africa_coast_hi_res.Rdata")
source("map/scaleBarFunc.R")
release_sites_chp3 <- read.csv("metadata/release_sites_chp3.csv", sep = ";")


map_sa <- ggplot(data = south_africa_coast_hi_res) +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID), size = 1.0, colour = "black", fill = "gray") +
  geom_rect(data = south_africa_coast_hi_res,aes(xmin=14, xmax=20, ymin=-30, ymax=-35), inherit.aes = FALSE, fill = NA, colour =    "black", size = 1.5) +
  coord_cartesian(xlim = c(8, 28), ylim = c(-38, -26)) +
  #coord_map("mercator", clip = "on") +
  #coord_cartesian(xlim = c(15, 20), ylim = c(-30, -35)) +
  #scale_x_continuous(trans = "reverse") +
  #theme(axis.ticks = element_blank()) + # Remove tick marks
  theme_bw() +
  xlab("Latitude") +
  ylab("Longitude")
map_sa

ggsave(filename = "map_sa.jpg", plot = last_plot(), device = "jpeg", path = "map/", dpi = 320, width = 10, height = 10)

## Make 2nd map of just the peninsula
map_pen <- ggplot() +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 1.0, colour = "black", fill = "gray") +
  #coord_map("mercator", clip = "on") +
  scaleBar(lon = 15, lat = -34.9, distanceLon = 20, distanceLat = 20, distanceLegend = -5, dist.unit = "km",
           arrow.length = 40, arrow.distance = 20, arrow.North.size = 5) +
  geom_point(data = release_sites_chp3, aes(x = lon, y = lat), color = "black", nudge_x = 0, nudge_y = 0.1, size = 5, shape = 17) +
  theme_bw() +
  xlab("Latitude") +
  ylab("Longitude") +
  coord_cartesian(xlim = c(15, 20), ylim = c(-35, -30))
  #theme(axis.ticks = element_blank(), # Remove tick marks
  #     axis.text = element_blank(), # Remove lat/ lon numbers
  #     axis.title = element_blank())  # Remove lat/ lon labels

ggsave(filename = "map_pen.jpg", plot = last_plot(), device = "jpeg", path = "map/", dpi = 320, width = 10, height = 10)

ggarrange(map_sa, map_pen, ncol = 2, nrow = 1, align = c("hv"))
