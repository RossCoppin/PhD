### Plots for temperature variables 

positions_temp <- c("Betty's Bay", "Roman Rock","Kalk Bay", "A-Frame", "Miller's Point", "Baboon Rock",  "Batsata Rock", "Buffelsbaai","Buffelsbaai South","Olifantsbos","Scarborough", "Soetwater", "Kommetjie","Hout Bay","Oudekraal","Sea Point","De Hoop", "St Helena Bay")

# Annual summary temp
temp_plot_A <- ggplot(data = temp_ann, aes(x = site, y = mean_temp)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = mean_temp - sd_temp, ymax = mean_temp + sd_temp)) + 
  geom_point(data = temp_ann, aes(x = site, y = max_temp, colour = "blue")) + 
  geom_point(data = temp_ann, aes(x = site, y = min_temp, colour = "pink")) + 
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  coord_flip() 
# Annual temperature range
temp_plot_B <- ggplot(data = temp_ann, aes(x = site, y = range_temp)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = , vjust = 0.5)) +
  geom_point() + 
  xlab("") + 
  ylab("") + 
  coord_flip()

# Summer summary temp
temp_plot_C <- ggplot(data = temp_clim, aes(x = site, y = Feb_mean_temp)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Feb_mean_temp - Feb_sd_temp, ymax = Feb_mean_temp + Feb_sd_temp   )) + 
  geom_point(data = temp_clim, aes(x = site, y = Feb_max_temp, colour = "blue")) + 
  geom_point(data = temp_clim, aes(x = site, y = Feb_min_temp, colour = "pink")) + 
  xlab("Sites") + 
  ylab("") + 
  theme(legend.position = "none") + 
  coord_flip() 

# Summer temperature range
temp_plot_D <- ggplot(data = temp_clim, aes(x = site, y = Feb_range_temp)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = , vjust = 0.5)) +
  geom_point() + 
  xlab("") + 
  ylab("") + 
  coord_flip()

# Winter summary temp
temp_plot_E <- ggplot(data = temp_clim, aes(x = site, y = Aug_mean_temp)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Aug_mean_temp - Aug_sd_temp, ymax = Aug_mean_temp + Aug_sd_temp   )) + 
  geom_point(data = temp_clim, aes(x = site, y = Aug_max_temp, colour = "blue")) + 
  geom_point(data = temp_clim, aes(x = site, y = Aug_min_temp, colour = "pink")) + 
  xlab("") + 
  ylab("Temperature (\u00B0C)") + 
  theme(legend.position = "none") + 
  coord_flip() 

# Winter temperature range
temp_plot_F <- ggplot(data = temp_clim, aes(x = site, y = Aug_range_temp)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = , vjust = 0.5)) +
  geom_point() + 
  xlab("") + 
  ylab("Temperature range (\u00B0C)") + 
  coord_flip()

temp_plot_all <- grid.arrange(temp_plot_A, temp_plot_B,temp_plot_C,temp_plot_D,temp_plot_E,temp_plot_F, ncol = 2, nrow = 3)

ggsave("temperature_plot.png", plot = temp_plot_all, path = "figures/", dpi = 300, width = 4, height = 4, limitsize = TRUE, scale = 2)

### Plots for wave variables
#Annual wave plots
wave_plot_A <- ggplot(data = wave_clim, aes(x = site, y = Ann_hs_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Ann_hs_mean - Ann_hs_sd, ymax = Ann_hs_mean + Ann_hs_sd)) + 
  xlab("Annual") + 
  ylab("") + 
  theme(legend.position = "none") + 
  ggtitle("Significant wave height (m)") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  coord_flip()  

wave_plot_B <- ggplot(data = wave_clim, aes(x = site, y = Ann_tp_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Ann_tp_mean - Ann_tp_sd, ymax = Ann_tp_mean + Ann_tp_sd)) + 
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  ggtitle("Significant wave period (seconds)") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip() 

#Summer wave plots
wave_plot_C <- ggplot(data = wave_clim, aes(x = site, y = Feb_hs_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Feb_hs_mean - Feb_hs_sd, ymax = Feb_hs_mean + Feb_hs_sd)) + 
  xlab("Summer") + 
  ylab("") + 
  theme(legend.position = "none") + 
  coord_flip() 

wave_plot_D <- ggplot(data = wave_clim, aes(x = site, y = Feb_tp_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Feb_tp_mean - Feb_tp_sd, ymax = Feb_tp_mean + Feb_tp_sd)) + 
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip() 

# Winter summary temp
wave_plot_E <- ggplot(data = wave_clim, aes(x = site, y = Aug_hs_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Aug_hs_mean - Aug_hs_sd, ymax = Aug_hs_mean + Aug_hs_sd)) + 
  xlab("Winter") + 
  ylab("") + 
  theme(legend.position = "none") + 
  coord_flip() 

# Winter temperature range
wave_plot_F <- ggplot(data = wave_clim, aes(x = site, y = Aug_tp_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Aug_tp_mean - Aug_tp_sd, ymax = Aug_tp_mean + Aug_tp_sd)) + 
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip() 

# wave direction
# Annual
wave_plot_G <- ggplot(data = wave_clim, aes(x = site, y = Ann_dir_median)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") +
  ggtitle("Median wave direction (bearing)") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip() 

# Summer
wave_plot_H <- ggplot(data = wave_clim, aes(x = site, y = Feb_dir_median)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip() 

# Winter
wave_plot_I <- ggplot(data = wave_clim, aes(x = site, y = Aug_dir_median)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip() 

wave_plot_all <- grid.arrange(wave_plot_A, wave_plot_B, wave_plot_G, wave_plot_C, wave_plot_D, wave_plot_H, wave_plot_E, wave_plot_F, wave_plot_I, ncol = 3, nrow = 3)

ggsave("wave_plot.png", plot = wave_plot_all, path = "figures/", dpi = 300, width = 6, height = 6, limitsize = TRUE, scale = 2)

###Wind variables
#Annual
wind_plot_A <- ggplot(data = wave_clim, aes(x = site, y = Ann_spw_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Ann_spw_mean - Ann_spw_sd, ymax = Ann_spw_mean + Ann_spw_sd))+ 
  xlab("Annual") + 
  ylab("") + 
  theme(legend.position = "none") + 
  ggtitle("Mean wind speed (m/s) and SD") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  coord_flip()  

wind_plot_B <- ggplot(data = wave_clim, aes(x = site, y = Ann_dirw_median)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  ggtitle("Median wind direction (True north)") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip()  

#Summer
wind_plot_C <- ggplot(data = wave_clim, aes(x = site, y = Feb_spw_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Feb_spw_mean - Feb_spw_sd, ymax = Feb_spw_mean + Feb_spw_sd))+ 
  xlab("Summer") + 
  ylab("") + 
  theme(legend.position = "none") + 
  ggtitle("") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  coord_flip()  

wind_plot_D <- ggplot(data = wave_clim, aes(x = site, y = Feb_dirw_median)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  ggtitle("") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip()  

#Winter
wind_plot_E <- ggplot(data = wave_clim, aes(x = site, y = Aug_spw_mean)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = Aug_spw_mean - Aug_spw_sd, ymax = Aug_spw_mean + Aug_spw_sd))+ 
  xlab("Winter") + 
  ylab("") + 
  theme(legend.position = "none") + 
  ggtitle("") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  coord_flip()  

wind_plot_F <- ggplot(data = wave_clim, aes(x = site, y = Aug_dirw_median)) +
  theme_bw() + 
  geom_point() + 
  scale_x_discrete(limits = positions_temp) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  xlab("") + 
  ylab("") + 
  theme(legend.position = "none") + 
  ggtitle("") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  coord_flip()  

wind_plot_all <- grid.arrange(wind_plot_A,wind_plot_B, wind_plot_C, wind_plot_D, wind_plot_E, wind_plot_F, ncol = 2, nrow = 3)

ggsave("wind_plot.png", plot = wind_plot_all, path = "figures/", dpi = 300, width = 4, height = 4, limitsize = TRUE, scale = 2)
