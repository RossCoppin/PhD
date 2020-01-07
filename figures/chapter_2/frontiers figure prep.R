### Remember to run previous code in the rmd file
### Plots for temperature variables
positions_temp <- c("Betty's Bay", "Roman Rock","Kalk Bay", "A-Frame", "Miller's Point", "Baboon Rock", "Batsata Rock","Bordjies Deep","Buffelsbaai","Buffelsbaai South","Olifantsbos","Scarborough", "Soetwater", "Kommetjie","Hout Bay","Oudekraal","Sea Point","St Helena Bay")

# Annual temp
temp_plot <- ggplot(data = temp_ann, aes(x = site, y = mean_temp)) +
  geom_point(show.legend = FALSE) +
  scale_x_discrete(limits = positions_temp) +
  ylim(9, 21) +
  geom_errorbar(aes(x = site, ymin = mean_temp - sd_temp, ymax = mean_temp + sd_temp)) +
  geom_point(data = temp_ann, aes(x = site, y = max_temp), show.legend = FALSE, shape = 17, size =2) +
  geom_point(data = temp_ann, aes(x = site, y = min_temp), show.legend = FALSE, shape = 6, size =2) +
  xlab("") +
  ylab("") +
  theme(legend.position = "none") +
  coord_flip() +
  theme_bw() +
  theme(axis.text.y=element_text(vjust=0.3))

ggsave("fig_3A.jpeg", plot = temp_plot, dpi = 300, device = "jpeg" , path = "figures/")

temp_ann_meta <- merge(meta_all, temp_ann, by = "site")
temp_ann_meta$site <- as.character(temp_ann_meta$site)

temp_boxplot <- ggplot(data = temp_ann_meta, aes(x = region, y = mean_temp, fill  = region)) +
  geom_boxplot(show.legend = FALSE, width = 0.5) +
  stat_compare_means(label.x = 2.5, label.y = 12.5, label = "p.signif") +
  xlab("") +
  ylab("") +
  coord_flip() +
  theme_bw() +
  scale_fill_grey(start = 0.4, end = 0.8) +
  theme(axis.text.y=element_text(vjust=0.3))

ggsave("fig_3B", plot = temp_boxplot, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

### Plots for wave variables
#Annual wave plots
#combine with meta data for easier plotting
wave_ann_meta <- merge(meta_all, wave_ann, by = "site")
wave_ann_meta$site <- as.character(wave_ann_meta$site)#make character to ensure no issues arise for site and region names

positions_wave <- c("Betty's Bay", "Roman Rock","Kalk Bay", "A-Frame", "Millers Point", "Baboon Rock",  "Batsata Rock","Bordjies Deep","Buffelsbaai","Buffelsbaai South","Olifantsbos","Scarborough", "Soetwater", "Kommetjie","Hout Bay","Oudekraal","Sea Point","St Helena Bay")
#cols <- c("Betty's Bay" = "red", "Roman Rock"= "red","Kalk Bay"= "red", "A-Frame"= "red", "Miller's Point"= "red", "Baboon #Rock"= "red",  "Batsata Rock"= "red","Bordjies Deep"= "red","Buffelsbaai"= "red","Buffelsbaai South"= "red","Olifantsbos"= #"blue","Scarborough"= "blue", "Soetwater"= "blue", "Kommetjie"= "blue","Hout Bay"= "blue","Oudekraal"= "blue","Sea Point"= #"blue","St Helena Bay"= "blue") #  scale_colour_manual(values = cols) #script to assign colours to specific sites

wave_plot_1 <- ggplot(data = abio_clim, aes(x = site, y = hs_mean)) +
  geom_point(show.legend = FALSE, shape = 17, size = 2) +
  scale_x_discrete(limits = positions_wave) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = hs_mean - hs_sd, ymax = hs_mean + hs_sd)) +
  xlab("") +
  ylab("") +
  theme(legend.position = "none") +
  coord_flip() +
  theme_bw() +
  theme(axis.text.y=element_text(vjust=0.3))
ggsave("fig_4A", plot = wave_plot_1, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

wave_plot_2 <- ggplot(data = abio_clim, aes(x = site, y = tp_mean)) +
  geom_point(show.legend = FALSE, shape = 16, size = 2) +
  scale_x_discrete(limits = positions_wave) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5)) +
  geom_errorbar(aes(x = site, ymin = tp_mean - tp_sd, ymax = tp_mean + tp_sd)) +
  xlab("") +
  ylab("") +
  theme(legend.position = "none") +
  coord_flip() +
  theme_bw() +
  theme(axis.text.y=element_text(vjust=0.3))
ggsave("fig_4C.jpeg", plot = wave_plot_2, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

wave_boxplot_1 <- ggplot(data = wave_ann_meta, aes(x = region, y = hs_mean, fill  = region)) +
  geom_boxplot(show.legend = FALSE) +
  stat_compare_means(label.y =0.6 ,label.x = 2.5, label = "p.signif") +
  xlab("") +
  ylab("") +
  coord_flip() +
  theme_bw() +
  scale_fill_grey(start = 0.4, end = 0.8) +
  theme(axis.text.y=element_text(vjust=0.3))

ggsave("fig_4B.jpeg", plot = wave_boxplot_1, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

wave_boxplot_2 <- ggplot(data = wave_ann_meta, aes(x = region, y = tp_mean, fill  = region)) +
  geom_boxplot(show.legend = FALSE) +
  stat_compare_means(label.y = 8.2, label.x = 2.5, label = "p.signif") +
  xlab("") +
  ylab("") +
  ylim(8,12) +
  coord_flip() +
  theme_bw() +
  scale_fill_grey(start = 0.4, end = 0.8) +
  theme(axis.text.y=element_text(vjust=0.3))

ggsave("fig_4D.jpeg", plot = wave_boxplot_2, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

### Morphology figures
## laminaria pallida

#custom temperature categories position on x-axis
pos_temp <- c("Cool temperate", "Warm temperate")

#temperature and lamanaria
LT1 <- ggplot(data = lam_data, aes(x = temp_regime, y = laminaWeight, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.62, label.y.npc = c('top')) +
  xlab("") +
  ylab("Lamina weight") +
  scale_fill_discrete(name="Temperature regime") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_8A.jpeg", plot = LT1, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LT2 <- ggplot(data = lam_data, aes(x = temp_regime, y = laminaLength, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  xlab("") +
  ylab("Lamina length") +
  scale_fill_discrete(name="Temperature regime") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_8B.jpeg", plot = LT2, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LT3 <- ggplot(data = lam_data, aes(x = temp_regime, y = laminaThickness, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  xlab("") +
  ylab("Lamina thickness") +
  scale_fill_discrete(name="Temperature regime") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_8C.jpeg", plot = LT3, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LT4 <- ggplot(data = lam_data, aes(x = temp_regime, y = stipeMass, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.65, label.y.npc = c('top')) +
  xlab("") +
  ylab("Stipe mass (g)") +
  scale_fill_discrete(name="Temperature regime") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_8D.jpeg", plot = LT4, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LT5 <- ggplot(data = lam_data, aes(x = temp_regime, y = stipeLength, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.65, label.y.npc = c('top')) +
  xlab("") +
  ylab("Stipe length (cm)") +
  scale_fill_discrete(name="Temperature regime") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_8E.jpeg", plot = LT5, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LT6 <- ggplot(data = lam_data, aes(x = temp_regime, y = stipeDiameter, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.65, label.y.npc = c('top')) +
  xlab("") +
  ylab("Stipe diameter (cm)") +
  scale_fill_discrete(name="Temperature regime") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey()

ggsave("fig_8F.jpeg", plot = LT6, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LT7 <- ggplot(data = lam_data, aes(x = temp_regime, y = digits, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  xlab("") +
  ylab("No. of digits") +
  scale_fill_discrete(name="Temperature regime") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_8G.jpeg", plot = LT7, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LT8 <- ggplot(data = lam_data, aes(x = temp_regime, y = thallusMass, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  xlab("") +
  ylab("Thallus mass (g)") +
  scale_fill_discrete(name="Temperature regime") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_8H.jpeg", plot = LT8, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LT9 <- ggplot(data = lam_data, aes(x = temp_regime, y = totalLength, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.65, label.y.npc = c('top')) +
  xlab("") +
  ylab("Total length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_8I.jpeg", plot = LT9, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

lam_data$wave_exposure <- factor(lam_data$wave_exposure, levels=c("Very sheltered", "Very exposed", "Moderately exposed","Fully sheltered","Extremely sheltered"), labels=c("Fully sheltered", "Extremely sheltered", "Very sheltered", "Moderately exposed", "Very exposed"))#wave exposure levels for lamanaria
pos_exposure_lam <- c("Fully sheltered", "Extremely sheltered", "Very sheltered", "Moderately exposed", "Very exposed")#custom positions

LW1 <- ggplot(data = lam_data, aes(x = wave_exposure, y = laminaWeight, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.85, label.y.npc = c('top')) +
  ylab("Lamina weight (g)") +
  scale_fill_brewer(palette="OrRd") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")
  #theme(legend.position = "none")

ggsave("fig_9A.jpeg", plot = LW1, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LW2 <- ggplot(data = lam_data, aes(x = wave_exposure, y = laminaLength, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.82, label.y.npc = c('top')) +
  ylab("Lamina length (cm)") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")

ggsave("fig_9B.jpeg", plot = LW2, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LW3 <- ggplot(data = lam_data, aes(x = wave_exposure, y = laminaThickness, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.82, label.y.npc = c('top')) +
  ylab("Lamina thickness") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")

ggsave("fig_9C.jpeg", plot = LW3, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LW4 <- ggplot(data = lam_data, aes(x = wave_exposure, y = stipeMass, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.9, label.y.npc = c('top')) +
  ylab("Stipe mass (g)") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")

ggsave("fig_9D.jpeg", plot = LW4, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LW5 <- ggplot(data = lam_data, aes(x = wave_exposure, y = stipeLength, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.9, label.y.npc = c('top')) +
  ylab("Stipe length (cm)") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")

ggsave("fig_9E.jpeg", plot = LW5, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LW6 <- ggplot(data = lam_data, aes(x = wave_exposure, y = stipeDiameter, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.9, label.y.npc = c('top')) +
  ylab("Stipe diameter (cm)") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")

ggsave("fig_9F.jpeg", plot = LW6, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LW7 <- ggplot(data = lam_data, aes(x = wave_exposure, y = digits, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam)  +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.82, label.y.npc = c('top')) +
  ylab("No. of digits") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")

ggsave("fig_9G.jpeg", plot = LW7, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LW8 <- ggplot(data = lam_data, aes(x = wave_exposure, y = thallusMass, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.9, label.y.npc = c('top')) +
  ylab("Thallus mass (kg)") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")

ggsave("fig_9H.jpeg", plot = LW8, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

LW9 <- ggplot(data = lam_data, aes(x = wave_exposure, y = totalLength, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_lam) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.x  = 0.9, label.y.npc = c('top')) +
  ylab("Total length (cm)") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("")

ggsave("fig_9I.jpeg", plot = LW9, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

## Ecklonia maxima (Deep)

# Ecklonia
# group_by(wave_exposure, frond_mass) %>%
# summarise(mean = mean(frond_mass:total_length, na.rm = TRUE)) %>%
# ungroup()
eck_deep <- eck_data %>%
  filter(population == "Deep")
eck_shall <- eck_data %>%
  filter(population == "Shallow") %>%
  mutate(site = replace(site, site == "Bakoven", "Sea Point"))

pos_temp <- c("Cool temperate", "Warm temperate") #custom temperature categories position on x-axis
#temperature plots made seperately for each morphological characteristic
ET1 <- ggplot(data = eck_deep, aes(x = temp_regime, y = frond_mass, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Frond mass (g)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10A.jpeg", plot = ET1, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET2 <- ggplot(data = eck_deep, aes(x = temp_regime, y = primary_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Primary length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10B.jpeg", plot = ET2, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET3 <- ggplot(data = eck_deep, aes(x = temp_regime, y = primary_width, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Primary width (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10C.jpeg", plot = ET3, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET4 <- ggplot(data = eck_deep, aes(x = temp_regime, y = frond_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Frond length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10D.jpeg", plot = ET4, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET5 <- ggplot(data = eck_deep, aes(x = temp_regime, y = stipe_mass, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Stipe mass (g)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10E.jpeg", plot = ET5, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET6 <- ggplot(data = eck_deep, aes(x = temp_regime, y = stipe_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Stipe length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10F.jpeg", plot = ET6, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET7 <- ggplot(data = eck_deep, aes(x = temp_regime, y = stipe_circ, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Stipe circ (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10G.jpeg", plot = ET7, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET8 <- ggplot(data = eck_deep, aes(x = temp_regime, y = tufts, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("No. of tufts") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10H.jpeg", plot = ET8, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET9 <- ggplot(data = eck_deep, aes(x = temp_regime, y = epi_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Epi length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10I.jpeg", plot = ET9, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ET10 <- ggplot(data = eck_deep, aes(x = temp_regime, y = total_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = TRUE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x  = 0.6, label.y.npc = c('top')) +
  ylab("Total length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_10J.jpeg", plot = ET10, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

eck_deep$wave_exposure <- factor(eck_deep$wave_exposure, levels=c("Fully sheltered", "Extremely sheltered", "Very sheltered","Moderately exposed", "Exposed", "Very exposed"), labels=c("Fully sheltered", "Extremely sheltered", "Very sheltered","Moderately exposed", "Exposed", "Very exposed"))

# custom positions for wave exposure categories and sites
pos_exposure <- c("Fully sheltered", "Extremely sheltered", "Very sheltered","Moderately exposed", "Exposed", "Very exposed")
#morphology and wave exposure
EW1 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = frond_mass, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("Frond mass (g)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11A.jpeg", plot = EW1, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW2 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = primary_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Primary length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11B.jpeg", plot = EW2, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW3 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = primary_width, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("Primary width (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11C.jpeg", plot = EW3, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW4 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = frond_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("Frond length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11D.jpeg", plot = EW4, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW5 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = stipe_mass, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("Stipe mass (g)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11E.jpeg", plot = EW5, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW6 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = stipe_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("Stipe length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11F.jpeg", plot = EW6, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW7 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = stipe_circ, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("Stipe circ (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11G.jpeg", plot = EW7, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW8 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = tufts, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("No of Tufts") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11H.jpeg", plot = EW8, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW9 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = epi_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("Epi length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11I.jpeg", plot = EW9, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EW10 <- ggplot(data = eck_deep, aes(x = wave_exposure, y = total_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  xlab("") +
  ylab("Total length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_11J.jpeg", plot = EW10, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

## Ecklonia maxima (Shallow)

EST1 <- ggplot(data = eck_shall, aes(x = temp_regime, y = frond_mass, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Frond mass (g)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12A.jpeg", plot = EST1, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST2 <- ggplot(data = eck_shall, aes(x = temp_regime, y = primary_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Primary length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12B.jpeg", plot = EST2, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST3 <- ggplot(data = eck_shall, aes(x = temp_regime, y = primary_width, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Primary width (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  ylim(0, 20) +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12C.jpeg", plot = EST3, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST4 <- ggplot(data = eck_shall, aes(x = temp_regime, y = frond_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Frond length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12D.jpeg", plot = EST4, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST5 <- ggplot(data = eck_shall, aes(x = temp_regime, y = stipe_mass, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Stipe mass (g)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12E.jpeg", plot = EST5, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST6 <- ggplot(data = eck_shall, aes(x = temp_regime, y = stipe_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Stipe length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12F.jpeg", plot = EST6, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST7 <- ggplot(data = eck_shall, aes(x = temp_regime, y = stipe_circ, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Stipe circ (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  ylim(0, 30) +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12G.jpeg", plot = EST7, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST8 <- ggplot(data = eck_shall, aes(x = temp_regime, y = tufts, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("No. of tufts") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12H.jpeg", plot = EST8, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST9 <- ggplot(data = eck_shall, aes(x = temp_regime, y = epi_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Epi length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12I.jpeg", plot = EST9, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

EST10 <- ggplot(data = eck_shall, aes(x = temp_regime, y = total_length, fill = temp_regime)) +
  scale_x_discrete(limits = pos_temp) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = FALSE, show.legend = FALSE) +
  stat_compare_means(method = "wilcox.test", label = "p.signif", label.x = 0.6, label.y.npc = c('top')) +
  ylab("Total length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_grey(start = 0.8, end = 0.4)

ggsave("fig_12J.jpeg", plot = EST10, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

# morphology grouped by wave exposure
eck_shall$wave_exposure <- factor(eck_shall$wave_exposure, levels=c("Fully sheltered", "Extremely sheltered", "Sheltered", "Exposed", "Very exposed"), labels=c("Fully sheltered", "Extremely sheltered", "Sheltered", "Exposed", "Very exposed"))
# custom positions for wave exposure categories and sites
pos_exposure_shall <- c("Fully sheltered", "Extremely sheltered", "Sheltered", "Exposed", "Very exposed")
#morphology and wave exposure
ESW1 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = frond_mass, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Frond mass (g)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13A.jpeg", plot = ESW1, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW2 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = primary_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Primary length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13B.jpeg", plot = ESW2, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW3 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = primary_width, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Primary width (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level")) +
  ylim(0,25)

ggsave("fig_13C.jpeg", plot = ESW3, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW4 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = frond_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Frond length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13D.jpeg", plot = ESW4, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW5 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = stipe_mass, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Stipe mass (g)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13E.jpeg", plot = ESW5, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW6 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = stipe_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Stipe length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13F.jpeg", plot = ESW6, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW7 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = stipe_circ, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylim(0,30) +
  ylab("Stipe circ (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13G.jpeg", plot = ESW7, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW8 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = tufts, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("No of Tufts") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13H.jpeg", plot = ESW8, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW9 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = epi_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE)  +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Epi length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13I.jpeg", plot = ESW9, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

ESW10 <- ggplot(data = eck_shall, aes(x = wave_exposure, y = total_length, fill = wave_exposure)) +
  scale_x_discrete(limits = pos_exposure_shall) +
  geom_boxplot(outlier.shape = NA, varwidth = TRUE, notch = TRUE) +
  stat_compare_means(method = "kruskal.test", label = "p.signif", label.y.npc = c('top')) +
  ylab("Total length (cm)") +
  theme_bw() +
  theme(axis.text.x = element_blank()) +
  xlab("") +
  scale_fill_brewer(palette="OrRd") +
  guides(fill=guide_legend(title="Wave exposure level"))

ggsave("fig_13J.jpeg", plot = ESW10, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

### Redundancy Analysis
### Remember to run script in the rmd file before
## RDA Laminaria pallida

lam_rda <- ggord(rda_lam, meta_lam_rda$region,ellipse = FALSE, hull = TRUE, grp_title = "Region", ptslab = TRUE, parse = TRUE, addsize = 3.5, repel = TRUE, ylims = c(-1.1,1.1), xlims = c(-1.1,1.1))

ggsave("fig_14A.jpeg", plot = lam_rda, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

## Ecklonia maxima (Deep)

rda_eck_deep <- ggord(rda_eck, eck_meta_rda$region ,ellipse = FALSE, hull = TRUE, ptslab = TRUE, parse = TRUE, addsize = 3.5, repel = TRUE, ylims = c(-1.1,1.1), xlims = c(-1.1,1.1))

ggsave("fig_14B.jpeg", plot = rda_eck_deep, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")

## Ecklonia maxima (Shallow)

rda_eck_shallow <- ggord(rda_eck_shallow,meta_shallow_rda$region,ellipse = FALSE, hull = TRUE, grp_title = "Sites", ptslab = TRUE, parse = TRUE, addsize = 3.5, coord_fix = TRUE, repel = TRUE, facet = FALSE, ylims = c(-1.1,1.1), xlims = c(-1.1,1.1))

ggsave("fig_14C.jpeg", plot = rda_eck_shallow, dpi = 300, device = "jpeg", path = "figures/frontiers_fig_prep/")




