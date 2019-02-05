# Custom positions

positions_abio <- c("Betty's Bay", "Kalk Bay", "A-Frame", "Roman Rock", 
                    "Miller's Point", "Baboon Rock", "Batsata Rock", 
                    "Buffelsbaai South", "Buffelsbaai", "Scarborough", 
                    "Soetwater","Kommetjie","Hout Bay", 
                    "Oudekraal", "Sea Point", "St Helena Bay")

positions_abio_s <- paste(positions_abio, collapse=" ") 
positions_abio_s 

## Temperature variables

temp_max_plot <- ggplot(data = maxTemp, aes(x = value, y = site, colour = season, size = value))   +
  geom_point(aes(colour = season), show.legend = FALSE) +
  scale_y_discrete(limits = positions_abio) +
  facet_wrap(~season) + 
  theme_bw() 

temp_min_plot <- ggplot(data = minTemp, aes(x = value, y = site, color = season, size = value))   +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme_bw()

temp_mean_plot <- ggplot(data = meanTemp, aes(x = value, y = site, color = season, size = value   )) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme_bw()

temp_sd_plot <- ggplot(data = sdTemp, aes(x = value, y = site, color = season, size = value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme_bw()

temp_range_plot <- ggplot(data = rangeTemp, aes(x = value, y = site, colour = season, size =       value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme_bw()

ggarrange(temp_max_plot, temp_min_plot,temp_mean_plot, temp_sd_plot, temp_range_plot, ncol=2, nrow = 3, common.legend = TRUE, legend="bottom")


## Wave variables 

wave_meanHs_plot <- ggplot(data = meanHs, aes(x = value, y = site, color = value, size = value))   +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  facet_wrap(~season, scales  = "fixed") +
  theme_bw()

wave_sdHs_plot <- ggplot(data = sdHs, aes(x = value, y = site, color = value, size =   value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  facet_wrap(~season, scales  = "fixed") +
  theme_bw()

wave_meanSpw_plot <- ggplot(data = meanSpw, aes(x = value, y = site, color = value, size =         value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  facet_wrap(~season, scales  = "fixed") +
  theme_bw()

wave_sdSpw_plot <- ggplot(data = sdSpw, aes(x = value, y = site, color = value, size =             value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  facet_wrap(~season, scales  = "fixed") +
  theme_bw()

wave_meanTp_plot <- ggplot(data = meanTp, aes(x = value, y = site, color = value, size =          value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  facet_wrap(~season, scales  = "fixed") +
  theme_bw()

wave_sdTp_plot <- ggplot(data = sdTp, aes(x = value, y = site, color = value, size =              value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  facet_wrap(~season, scales  = "fixed") +
  theme_bw()

wave_medianDirw_plot <- ggplot(data = medianDirw, aes(x = value, y = site, color = value, size =   value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  facet_wrap(~season, scales  = "fixed") +
  theme_bw()

wave_medianDir_plot <- ggplot(data = medianDir, aes(x = value, y = site, color = value, size =     value)) +
  geom_point() +
  scale_y_discrete(limits = positions_abio) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  facet_wrap(~season, scales  = "fixed") +
  theme_bw()

