library(tidyverse)
library(vegan)
library(RColorBrewer)
library(gridExtra)
library(lubridate)
library(GGally)
library(ggpubr)
library(ggrepel)

## Map of study sites
# Load map data

load("maps/south_africa_coast.Rdata")
load("maps/sa_provinces.Rdata")
load("maps/site_list.Rdata")

# remove De Hoop
kelp_sites <- read_csv("metadata/sites_complete.csv")
kelp_sites_map <- subset(kelp_sites, !site == "De Hoop")

# Subset into 4 regions
west__up_site <- subset(kelp_sites, site == "St Helena Bay" | site == "Sea Point" 
                        | site == "Oudekraal" | site == "Hout Bay")

west__down_site <- subset(kelp_sites, site == "Soetwater" | site == "Olifantsbos" | site == "Scarborough" | site == "Kommetjie")

east_up_site <- subset(kelp_sites, site == "Roman Rock" | site == "A-Frame" | site == "Miller's Point" | site == "Baboon Rock" | site == "Kalk Bay")

east_down_site <- subset(kelp_sites, site == "Batsata Rock" | site == "Bordjies Deep" | site == "Buffelsbaai South" 
                         | site == "Buffelsbaai" | site == "Betty's Bay")

# plot map
ggplot(data = kelp_sites_map, aes(x = lon, y = lat)) +
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = kelp_sites_map)  +
  coord_fixed(xlim = c(17.65, 19.5), ylim = c(-32.75, -34.6)) +
  geom_label_repel(data = west__up_site, aes(x = lon, y = lat, label = site), 
                   size = 3, box.padding = 0.5, nudge_x = -0.5, nudge_y = 0.2, segment.alpha = 0.4) +
  geom_label_repel(data = west__down_site, aes(x = lon, y = lat, label = site), 
                   size = 3, box.padding = 0.5, nudge_x = -0.5, nudge_y = -0.2, segment.alpha = 0.4) +
  geom_label_repel(data = east_up_site, aes(x = lon, y = lat, label = site), 
                   size = 3, box.padding = 0.5, nudge_x = 0.5, nudge_y = 0.3, segment.alpha = 0.4) +
  geom_label_repel(data = east_down_site, aes(x = lon, y = lat, label = site), 
                   size = 3, box.padding = 0.5, nudge_x = 0.35, nudge_y = -0.15, segment.alpha = 0.4) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

## Create morphology table

library(knitr)
morph <- read.csv("tables/Morphology table.csv")

colnames(morph) <- c("Morphometric", "Unit measurement")

morph_eck <- morph[(1:10), ]
morph_lam <- morph[(11:19), ]

t1 <- kable(morph_eck, row.names = FALSE, caption = "A list of morphology measurements that were collected to investigate how environmental drivers may influence the morphology of _Ecklonia maxima _. Units for each morphometric are included.")

t2 <- kable(morph_lam, row.names = FALSE, caption = "A list of morphology measurements that were collected to investigate how environmental drivers may influence the morphology of _Laminaria pallida_. Units for each morphometric are included.")

## Preparing data
# Complete lon/lats
kelp_sites <- read_csv("metadata/sites_complete.csv")

# Ecklonia
eck_data <- read_csv("data/Ecklonia_morphometrics.csv") %>%
  mutate(site = replace(site, site == "Buffels Bay", "Buffelsbaai")) %>%
  mutate(site = replace(site, site == "St. Helena Bay", "St Helena Bay")) %>%
  # Not using Rocky Bank in this study
  filter(site != "Rocky Bank")

# Laminaria
lam_data <- read_csv("data/Laminaria_morphometrics.csv") %>%
  mutate(site = replace(site, site == "Buffels Bay", "Buffelsbaai")) %>%
  # NB: Even though I am changing the name, there will still be no lon/lat values for this site
  # We need to decide how we want to handle this. Give it the same lon/lat as Buffelsbaai?
  mutate(site = replace(site, site == "Buffels Bay South", "Buffelsbaai South")) %>%
  # NB: This may also not be an appropriate change
  mutate(site = replace(site, site == "Bordjies reef North", "Bordjies Deep")) %>%
  # Not using Rocky Bank in this study
  filter(site != "Rocky Bank")

# NB: (RWS) I have removed Roman Rock as this has less than a year of temperature data

# The SACTN monthly data
load("data/SACTNmonthly_v4.1.Rdata")

# The missing site temperatures
load("data/interp_sites.Rdata")

# The patched Roman Rock temperatures
load("data/rr_patch.Rdata")

## Subset temperatures for collection sites
temps <- SACTNmonthly_v4.1 %>% 
  filter(site %in% eck_data$site | site %in% lam_data$site) %>% 
  select(site, date, temp) %>% 
  rbind(., interp_sites) %>% 
  filter(site!= "Roman Rock") %>% 
  rbind(., rr_patch)

## Temperature analyses
# Up next we need to calculate the relevant temperature statistics for each site. These are: #mean, range, and sd, for Annual, February, and August climatologies.
# Monthly clims
temp_feb_aug <- temps %>% 
  mutate(date = lubridate::month(date, label = TRUE)) %>% 
  group_by(site, date) %>% 
  summarise(mean_temp = mean(temp, na.rm = T),
            min_temp = min(temp, na.rm = T),
            max_temp = max(temp, na.rm = T),
            range_temp = range(temp, na.rm = T)[2]-range(temp, na.rm = T)[1],
            sd_temp = sd(temp, na.rm = T)) %>%
  filter(date %in% c("Feb", "Aug")) %>% 
  ungroup()

# Annual clims
temp_ann <- temps %>% 
  mutate(date = lubridate::month(date, label = TRUE)) %>% 
  group_by(site, date) %>% 
  summarise(mean_temp = mean(temp, na.rm = T),
            min_temp = min(temp, na.rm = T),
            max_temp = max(temp, na.rm = T),
            range_temp = range(temp, na.rm = T)[2]-range(temp, na.rm = T)[1],
            sd_temp = sd(temp, na.rm = T)) %>% 
  ungroup() %>% 
  select(-date) %>% 
  group_by(site) %>% 
  summarise_all(funs(mean(., na.rm = T))) %>% 
  mutate(date = "Ann") %>% 
  select(site, date, everything())

# Combine
temp_clim <- rbind(temp_feb_aug, temp_ann) %>% 
  group_by(site) %>% 
  gather(key = statistic, value = value, 
         mean_temp:sd_temp) %>% 
  mutate(clim_stat = paste(date, statistic, sep = "_")) %>% 
  select(-date, -statistic) %>% 
  spread(key = clim_stat, value = value)



# Here we need to convert the thermal metrics to Euclidian distances.

env3 <- temp_clim %>% 
  dplyr::ungroup(site) %>% 
  dplyr::select(-site) %>% 
  vegdist(method = 'euclidian')
env3.mat <- as.matrix(env3)
env3.diag <- diag(env3.mat[-1, -nrow(env3.mat)])
env3.diag <- append(0, env3.diag, after = 1)


# Wave data 

# Load the loading functions
source("func/load.wave.R")

# Then load the data
fb_model <- load.model("data/wave_data/FB")
tb_model <- load.model("data/wave_data/TB")
he_model <- load.model("data/wave_data/HE")
sh_model <- load.model("data/wave_data/SH")

# Combine
wave_model <- rbind(fb_model, tb_model, he_model, sh_model)
rm(fb_model, tb_model)

# The site list key
wave_sites <- read_csv("metadata/sites_complete.csv") %>% 
  select(site, wave_7, wave_15)

# Calculate the necessary stats
# Monthly clims
wave_feb_aug <- wave_model %>% 
  mutate(date = lubridate::month(date, label = TRUE)) %>% 
  filter(site != "FB25") %>% # FB_25 has issues with 'hs' and 'tp'
  group_by(site, date) %>% 
  summarise_all(funs(mean = mean, sd = sd), na.rm = T) %>%
  filter(date %in% c("Feb", "Aug")) %>% 
  ungroup()

# Annual clims
wave_ann <- wave_model %>% 
  mutate(date = lubridate::month(date, label = TRUE)) %>% 
  filter(site != "FB25") %>% # FB_25 has issues with 'hs' and 'tp'
  group_by(site, date) %>% 
  summarise_all(funs(mean = mean, sd = sd), na.rm = T) %>%
  ungroup() %>% 
  select(-date) %>% 
  group_by(site) %>% 
  summarise_all(funs(mean), na.rm = T) %>% 
  mutate(date = "Ann") %>% 
  select(site, date, everything())

# Subset directions out
dirs <- subset(wave_model, select = c(1, 2, 5, 6))

# Seasons
dirs_feb_aug <- dirs %>% 
  mutate(date = lubridate::month(date, label = TRUE)) %>% 
  group_by(site, date) %>% 
  summarise(dir_min = min(dir, na.rm = T),
            dir_max = max(dir, na.rm = T),
            dir_range = range(dir, na.rm = T)[2]-range(dir, na.rm = T)[1],
            dir_median = median(dir, na.rm = T), 
            dirw_min = min(dirw, na.rm = T),
            dirw_max = max(dirw, na.rm = T),
            dirw_range = range(dirw, na.rm = T)[2]-range(dirw, na.rm = T)[1],
            dirw_median = median(dirw, na.rm = T)) %>%
  filter(date %in% c("Feb", "Aug")) %>% 
  ungroup()



# Annual
dirs_ann <- dirs %>% 
  mutate(date = lubridate::month(date, label = TRUE)) %>% 
  group_by(site, date) %>% 
  summarise(dir_min = min(dir, na.rm = T),
            dir_max = max(dir, na.rm = T),
            dir_range = range(dir, na.rm = T)[2]-range(dir, na.rm = T)[1],
            dir_median = median(dir, na.rm = T), 
            dirw_min = min(dirw, na.rm = T),
            dirw_max = max(dirw, na.rm = T),
            dirw_range = range(dirw, na.rm = T)[2]-range(dirw, na.rm = T)[1],
            dirw_median = median(dirw, na.rm = T)) %>% 
  ungroup() %>% 
  select(-date) %>% 
  group_by(site) %>% 
  summarise_all(funs(mean(., na.rm = T))) %>% 
  mutate(date = "Ann") %>% 
  select(site, date, everything())

# subset useless columns
dirs_feb_aug <- subset(dirs_feb_aug, select = c(1, 2, 6, 10))
dirs_ann <- subset(dirs_ann, select = c(1, 2, 6, 10))


# combine all direction metrics
dirs_clim <- rbind(dirs_feb_aug, dirs_ann) %>% 
  group_by(site) %>% 
  gather(key = statistic, value = value, 
         3:4) %>% 
  mutate(clim_stat = paste(date, statistic, sep = "_")) %>% 
  select(-date, -statistic) %>% 
  spread(key = clim_stat, value = value) %>% 
  left_join(wave_sites, by = c("site" = "wave_7")) %>% 
  ungroup() %>% 
  select(-site, wave_15) %>%
  rename(site = site.y) %>% 
  select(site, everything()) %>% 
  na.omit()

# Combine
# NB: This only uses the wave data from the 7 metre contour
wave_clim <- rbind(wave_feb_aug, wave_ann) %>% 
  group_by(site) %>% 
  gather(key = statistic, value = value, 
         hs_mean:spw_sd) %>% 
  mutate(clim_stat = paste(date, statistic, sep = "_")) %>% 
  select(-date, -statistic) %>% 
  spread(key = clim_stat, value = value) %>% 
  left_join(wave_sites, by = c("site" = "wave_7")) %>% 
  ungroup() %>% 
  select(-site, wave_15) %>%
  rename(site = site.y) %>% 
  select(site, everything()) %>% 
  na.omit()

# combine all wave metrics
wave_clim <- cbind(wave_clim, dirs_clim)

# remove all useless direction metrics from original wave_clim
wave_clim <- subset(wave_clim, select = -c(2,3,4,5,12,13,14,15,22,23,24,25,32,33,40))

## First create mean vlaues from each site for each species
# Ecklonia
eck_mean <- eck_data %>% 
  select(site, frondMass:totalLength) %>% 
  group_by(site) %>% 
  summarise_all(funs(mean(., na.rm = T)))

# Laminaria
lam_mean <- lam_data %>% 
  select(site, laminaWeight:totalLength) %>% 
  group_by(site) %>% 
  summarise_all(funs(mean(., na.rm = T)))

# Correct errors
# No weight measurements for Laminaria at Sea Point for some reason...
lam_mean$laminaWeight[lam_mean$site == "Sea Point"] <- NA

## Merge the biotic and abiotic variables
# Ecklonia
eck_all <- eck_mean %>% 
  left_join(temp_clim, by = "site") %>%
  left_join(wave_clim, by = "site") %>% # With wave data
  na.omit()
eck_bio <- eck_all %>% 
  select(frondMass:totalLength) %>% 
  decostand(method = "standardize")
eck_abio <- eck_all %>% 
  # select(Ann_mean_temp:Feb_sd_temp) %>% # Without wave data
  select(Ann_mean_temp:Feb_tp_sd) %>% # With wave data
  decostand(method = "standardize")

# Laminaria
lam_all <- lam_mean %>% 
  left_join(temp_clim, by = "site") %>%
  left_join(wave_clim, by = "site") %>% # With wave data
  na.omit()
lam_bio <- lam_all %>% 
  select(laminaWeight:totalLength) %>% 
  decostand(method = "standardize")
lam_abio <- lam_all %>% 
  # select(Ann_mean_temp:Feb_sd_temp) %>% # Without wave data
  select(Ann_mean_temp:Feb_tp_sd) %>% # With wave data
  decostand(method = "standardize")

# Merge site list with temp_clim
site_temp <- merge(temp_clim, kelp_sites, by = "site")

# Remove unnec columns
site_temp <- subset(site_temp, select = -c(19:21))

# gather data into less columns
site_temp <- gather(data = site_temp, "stat", "value", 2:16)

# Split columns
site_temp <- site_temp %>% 
  separate(stat, c("season", "statistic", "abioPara"))

# change season key
season <- c("Ann" = "Annual", "Feb" = "February", "Aug" = "August")
statistic <- c("mean" = "Mean", "sd" = "SD", "range" = "Range", "max" = "Max", "min" = "Min")


maxTemp <- subset(site_temp, statistic == "max")
minTemp <- subset(site_temp, statistic == "min")
meanTemp <- subset(site_temp, statistic == "mean")
sdTemp <- subset(site_temp, statistic == "sd")
rangeTemp <- subset(site_temp, statistic == "range")

max <- ggplot(data = maxTemp, aes(x = lon, y = lat)) +
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = maxTemp, aes(col = value), size = 2) +
  scale_color_gradient("Max temp (°)", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(season), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

min <- ggplot(data = minTemp, aes(x = lon, y = lat)) +
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = minTemp, aes(col = value), size = 2) +
  scale_color_gradient("Min temp (°)", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(season), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

mean <- ggplot(data = meanTemp, aes(x = lon, y = lat)) +
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = meanTemp, aes(col = value), size = 2) +
  scale_color_gradient("Mean temp (°)", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(season), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

sd <- ggplot(data = sdTemp, aes(x = lon, y = lat)) +
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = sdTemp, aes(col = value), size = 2) +
  scale_color_gradient("SD temp (°)", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(season), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

range <- ggplot(data = rangeTemp, aes(x = lon, y = lat)) +
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = rangeTemp, aes(col = value), size = 2) +
  scale_color_gradient("Range temp (°)", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(season), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())


grid.arrange(max,min,mean,range, sd, ncol = 2)

### Wave and wind parameters

# Wave parameters

# merge sites with wave_clim
site_wave <- merge(wave_clim, kelp_sites, by = "site")

# remove unecc columns
site_wave <- subset(site_wave, select = -c(28:30))
# gather data into less columns

site_wave <- gather(data = site_wave, "stat", "value", 2:25)
# split columns
site_wave <- site_wave %>% 
  separate(stat, c("season", "abioPara", "statistic"))

# change season key
season <- c("Ann" = "Annual", "Feb" = "February", "Aug" = "August")
statistic <- c("mean" = "Mean", "sd" = "SD", "range" = "Range", "max" = "Max", "min" = "Min", "median" = "Median")
abioPar <- c("dir" = "Direction", "dirw" = "Wind direction", "hs" = "Sig. wave height", "tp" = "Wave period", "spw" = "Spw")

##  (shows individual legends, still squashed)

medianDir <- subset(site_wave, statistic == "median" & abioPara == "dir")
medianDirw <- subset(site_wave, statistic == "median" & abioPara == "dirw")
meanHs <- subset(site_wave, statistic == "mean" & abioPara == "hs")
sdHs <- subset(site_wave, statistic == "sd" & abioPara == "hs")
meanSpw <- subset(site_wave, statistic == "mean" & abioPara == "spw")
sdSpw <- subset(site_wave, statistic == "sd" & abioPara == "spw")
meanTp <- subset(site_wave, statistic == "mean" & abioPara == "tp")
sdTp <- subset(site_wave, statistic == "sd" & abioPara == "tp")

# meanDir
medianDir1 <- ggplot(data = medianDir, aes(x = lon, y = lat)) +
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = medianDir, aes(col = value), size = 2) +
  scale_color_gradient("medianDir", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(c(season)), ncol = 3) + 
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

# meanDirw 
medianDirw1 <- ggplot(data = medianDirw , aes(x = lon, y = lat)) + 
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = medianDirw , aes(col = value), size = 2) +
  scale_color_gradient("medianDirw ", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(c(season)), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

# meanHs

meanHs1 <- ggplot(data = meanHs, aes(x = lon, y = lat)) + 
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = meanHs, aes(col = value), size = 2) +
  scale_color_gradient("meanHs", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(c(season)), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

# sdHs
sdHs1 <- ggplot(data = sdHs, aes(x = lon, y = lat)) + 
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = sdHs, aes(col = value), size = 2) +
  scale_color_gradient("sdHs", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(c(season)), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

# meanSpw
meanSpw1 <- ggplot(data = meanSpw, aes(x = lon, y = lat)) + 
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = meanSpw, aes(col = value), size = 2) +
  scale_color_gradient("meanSpw", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(c(season)), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

# sdSpw
sdSpw1 <- ggplot(data = sdSpw, aes(x = lon, y = lat)) + 
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = sdSpw, aes(col = value), size = 2) +
  scale_color_gradient("sdSpw", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(c(season)), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

# meanTp
meanTp1 <- ggplot(data = meanTp, aes(x = lon, y = lat)) + 
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = meanTp, aes(col = value), size = 2) +
  scale_color_gradient("meanTp", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(c(season)), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

# sdTp
sdTp1 <- ggplot(data = sdTp, aes(x = lon, y = lat)) + 
  geom_polygon(data = south_africa_coast, aes(group = group), fill = "grey70") +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = sdTp, aes(col = value), size = 2) +
  scale_color_gradient("sdTp", low = "blue", high = "red") +
  coord_fixed(xlim = c(17.85, 19), ylim = c(-32.75, -34.4)) +
  facet_wrap(~ season, labeller = as_labeller(c(season)), ncol = 3) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

grid.arrange(medianDir1, meanHs1, sdHs1, meanTp1, sdTp1, ncol = 2)

grid.arrange(medianDirw1, meanSpw1, sdSpw1, ncol = 2)

### Morphologies
# Laminaria morphologies

# load data
lam <- read.csv("data/Laminaria_morphometrics.csv", sep = ",")

# remove unnecessary columns
lam <- subset(lam, select = -c(1,2,4))

# alter dataframe for more friendly plotting
lam_gather <- gather(lam, "Morphology", "Measurement", 2:10, na.rm = TRUE)

# Replace morphology names
lam_gather <- lam_gather %>%
  mutate(Morphology = replace(Morphology, 
                              Morphology == "digits", "Number of digits")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "laminaLength", "Lamina length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "laminaThickness", "Lamina thickness (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "laminaWeight", "Lamina weight (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeDiameter", "Stipe diameter (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeLength", "Stipe Length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeMass", "Stipe mass (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "thallusMass", "Thallus mass (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "totalLength", "Total length (mm)"))

# Mean morphology per site

lam_gather_mean <- lam_gather %>%
  group_by(site, Morphology) %>%
  summarise(mean = mean(Measurement, na.rm = TRUE)) %>%
  ungroup()

# Remove Rocky Bank
lam_gather_mean <- subset(lam_gather_mean, !site == "Rocky Bank")

# Order site names by location west to east
positionsLam <- c("Betty's Bay", "Roman Rock","A-Frame", "Miller's Point", "Baboon Rock", 
                  "Batsata Rock", "Buffels Bay", "Olifantsbos", "Kommetjie", "Sea Point")


# Plot morphologies
ggplot(data = lam_gather, aes(x = site, y = Measurement)) +
  geom_boxplot() +
  facet_wrap(~Morphology, scales = "free_x", strip.position = "bottom") +
  coord_flip() + 
  scale_x_discrete(limits = positionsLam) + 
  theme(strip.background = element_blank(), strip.placement = "outside", text = element_text(size = 4.5)) +
  theme_bw() +
  xlab("Site") +
  ylab("Morphology measurement")

# Ecklonia morphologies

# load data
eck <- read.csv("data/Ecklonia_morphometrics.csv", sep = ",")

# remove unnecessary columns
eck <- subset(eck, select = -c(1,2,3,5,7,8))

# alter dataframe for more friendly plotting
eck_gather <- gather(eck, "Morphology", "Measurement", 2:12, na.rm = TRUE)

# Replace morphology names
eck_gather <- eck_gather %>%
  mutate(Morphology = replace(Morphology, 
                              Morphology == "depth", "Depth (m)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "epiLength", "Epiphyte length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "frondLength", "Frond length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "frondMass", "Frond mass (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "primaryLength", "Primary length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "primaryWidth", "Primary width (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeCirc", "Stipe circumference (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeLength", "Stipe length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeMass", "Stipe mass (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "totalLength", "Total length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "tufts", "Number of tufts"))

# Mean morphology per site

eck_gather_mean <- eck_gather %>%
  group_by(site, Morphology) %>%
  summarise(mean = mean(Measurement, na.rm = TRUE)) %>%
  ungroup()


# Order site names by location west to east

positionsEck <- c("Betty's Bay", "Kalk Bay", "A-Frame", 
                  "Miller's Point", "Baboon Rock", "Batsata Rock", 
                  "Buffels Bay", "Scarborough", 
                  "Soetwater","Kommetjie","Hout Bay", 
                  "Oudekraal", "St. Helena Bay")

# Remove Depth and Rocky Bank site
eck_gather <- subset(eck_gather, !Morphology == "Depth (m)")
eck_gather <- subset(eck_gather, !site == "Rocky Bank" | !site == "De Hoop")

# Plot morphologies
ggplot(data = eck_gather, aes(x = site, y = Measurement)) +
  geom_boxplot() +
  facet_wrap(~Morphology, scales = "free_x", strip.position = "bottom", ncol = 5) +
  coord_flip() + 
  scale_x_discrete(limits = positionsEck) +
  theme(strip.background = element_blank(), strip.placement = "outside", text = element_text(size = 4.5)) +
  theme_bw() +
  xlab("Site") +
  ylab("Morphology measurement")

# Deep and shallow morphology comparisons

# load data
comp_df <- read.csv("data/morph_comp.csv", sep = ";")

# remove unnecessary columns
comp_df <- subset(comp_df, select = -c(3))

# alter dataframe for more friendly plotting
comp_gather <- gather(comp_df, "Morphology", "Measurement", 3:12, na.rm = TRUE)

# Replace morphology names
comp_gather <- comp_gather %>%
  mutate(Morphology = replace(Morphology, 
                              Morphology == "fond_mass", "Frond mass (kg)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "primary_length", "Primary length (cm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "primary_width", "Primary width (cm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "frond_length", "Frond length (cm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipe_mass", "Stipe mass (kg)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipe_length", "Stipe length (cm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipe_circ", "Stipe circumference (cm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "tufts", "Number of tufts")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "epi_length", "Epiphyte length (cm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "total_length", "Total length (cm)"))

# Mean morphology per site

comp_gather_mean <- comp_gather %>%
  group_by(site, Morphology) %>%
  summarise(mean = mean(Measurement, na.rm = TRUE)) %>%
  ungroup()


# Order site names by location west to east

positionsComp <- c("Betty's Bay","Kalk Bay", 
                   "Miller's Point","A-Frame", "Buffels Bay","Hout Bay", "Soetwater", "Kommetjie")

# Plot morphologies

ggplot(data = comp_gather, aes(x = site, y = Measurement, fill = depth)) +
  geom_boxplot() +
  facet_wrap(~Morphology, scales = "free_x", strip.position = "bottom", ncol = 5) +
  coord_flip() + 
  scale_x_discrete(limits = positionsComp) +
  theme(strip.background = element_blank(), strip.placement = "outside", text = element_text(size   = 4.5)) +
  xlab("Site") +
  ylab("Morphology measurement") + 
  theme_bw()

### Abiotic correlations
# merge all abiotic data
combine <- merge(temp_clim, wave_clim, by = "site")

# Gather data
abio_cor <- gather(combine, "parameter", "measurement", 2:40)

# Order by season/ parameter
abio_cor <- plyr::arrange(abio_cor, parameter)

# Subset by season
ann_abio_cor <- abio_cor[c(1:221), ]
aug_abio_cor <- abio_cor[c(222:442), ]
feb_abio_cor <- abio_cor[c(443:663), ]

# Change describing terms in rows
# Annual
ann_abio_cor <-  ann_abio_cor %>%
  mutate(parameter = replace(parameter, parameter == "Ann_dir_median", "Median dir")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_dirw_median", "Median wind dir")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_hs_mean", "Mean Hs")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_hs_sd", "SD Hs")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_tp_mean", "Mean Tp")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_tp_sd", "SD Tp")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_spw_mean", "Mean sPw")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_spw_sd", "SD sPw")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_mean_temp", "Mean temp")) %>%
  mutate(parameter = replace(parameter, parameter == "Ann_sd_temp", "SD temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Ann_range_temp", "Range temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Ann_max_temp", "Max temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Ann_min_temp", "Min temp"))



# August
aug_abio_cor <- aug_abio_cor %>%
  mutate(parameter = replace(parameter, parameter == "Aug_dir_median", "Median dir")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_dirw_median", "Median wind dir")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_hs_mean", "Mean Hs")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_hs_sd", "SD Hs")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_tp_mean", "Mean Tp")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_tp_sd", "SD Tp")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_spw_mean", "Mean sPw")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_spw_sd", "SD sPw")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_mean_temp", "Mean temp")) %>%
  mutate(parameter = replace(parameter, parameter == "Aug_sd_temp", "SD temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Aug_range_temp", "Range temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Aug_max_temp", "Max temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Aug_min_temp", "Min temp"))

# February
feb_abio_cor <- feb_abio_cor %>%
  mutate(parameter = replace(parameter, parameter == "Feb_dir_median", "Median dir")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_dirw_median", "Median wind dir")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_hs_mean", "Mean Hs")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_hs_sd", "SD Hs")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_tp_mean", "Mean Tp")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_tp_sd", "SD Tp")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_spw_mean", "Mean sPw")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_spw_sd", "SD sPw")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_mean_temp", "Mean temp")) %>%
  mutate(parameter = replace(parameter, parameter == "Feb_sd_temp", "SD temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Feb_range_temp", "Range temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Feb_max_temp", "Max temp")) %>% 
  mutate(parameter = replace(parameter, parameter == "Feb_min_temp", "Min temp"))

# Spread sideways for each season
ann_abio_cor <- spread(ann_abio_cor, "parameter", "measurement")
aug_abio_cor <- spread(aug_abio_cor, "parameter", "measurement")
feb_abio_cor <- spread(feb_abio_cor, "parameter", "measurement")

## ggpairs to plot correlation coefficients
## Annual
ggpairs(data = ann_abio_cor, columns = 2:14, 
        upper = list(continuous = wrap("cor", size = 3)), 
        lower = list(continuous = "smooth"), 
        diag = list(continuous = "densityDiag")) + 
  theme(text = element_text(size = 9)) + 
  ggtitle("Annual")

## August
ggpairs(data = aug_abio_cor, columns = 2:14, 
        upper = list(continuous = wrap("cor", size = 3)), 
        lower = list(continuous = "smooth"), 
        diag = list(continuous = "densityDiag")) + 
  theme(text = element_text(size = 9)) + 
  ggtitle("August")

## February
ggpairs(data = feb_abio_cor, columns = 2:14, 
        upper = list(continuous = wrap("cor", size = 3)), 
        lower = list(continuous = "smooth"),
        diag = list(continuous = "densityDiag")) + 
  theme(text = element_text(size = 9)) + 
  ggtitle("February")

#### Redundancy analyses 
#### USing RDA's to see how wave parameters and temperature parameters
#### influence the morphology of kelp species

# rename eck_all to eck-site0

eck_site0 <- eck_all

# Subset site names
eck_site <- subset(eck_site0, select = c(1))

# Subset wave for ecklonia sites (Annual only)
eck_wave <- subset(eck_site0, select = c(27:32, 45, 46))

# standardise wave measurements
eck_wave <- eck_wave %>%
  decostand(method = "standardize")

# subset ecklonia morpho's
eck_wave_bio <- subset(eck_site0, select = c(2:11))

# standardise measurements
eck_wave_bio <- eck_wave_bio %>%
  decostand(method = "standardize")

# Force site names as column 0
eck_wave <- cbind(eck_site, eck_wave)

eck_wave <- eck_wave %>%
  remove_rownames %>%
  column_to_rownames(var = "site")

eck_wave_bio <- cbind(eck_site, eck_wave_bio)

eck_wave_bio <- eck_wave_bio%>%
  remove_rownames %>%
  column_to_rownames(var = "site")

# run RDA
eck_wave_RDA <- rda(eck_wave_bio ~ ., data = eck_wave)

# Plot scaling = 2
plot(eck_wave_RDA, scaling  = 2)

# Summary
summary(eck_wave_RDA)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_eck_wave <- round(cor(eck_wave, use = "pair"), 2)
cor_eck_wave

# Calculate "Variance Inflation Factor" using vegan

vif.cca(eck_wave_RDA)

# Global adjusted R^2
(R2a.all <- RsquareAdj(eck_wave_RDA)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(eck_wave_bio ~ 1, data = eck_wave),
                         scope=formula(eck_wave_RDA), direction = "forward", pstep = 1000)

# Parsimonious RDA

eck_wave_pars <- rda(eck_wave_bio ~ Ann_tp_sd + Ann_tp_mean + Ann_dirw_median, data = eck_wave)
eck_wave_pars
anova.cca(eck_wave_pars, step = 1000)
anova.cca(eck_wave_pars, step = 1000, by = "axis")
vif.cca(eck_wave_pars)
(R2a.pars <- RsquareAdj(eck_wave_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(eck_wave_pars, scaling  = 2)

## Temp: seasonal

# Subset temps for ecklonia sites (for seasons)
eck_temp_season <- subset(eck_site0, select = c(17:26))


# standardise wave measurements
eck_temp_season <- eck_temp_season %>%
  decostand(method = "standardize")

# Force site names as column 0
eck_temp_season <- cbind(eck_site, eck_temp_season)

eck_temp_season <- eck_temp_season %>%
  remove_rownames %>%
  column_to_rownames(var = "site")

# run RDA
eck_temp_season_RDA <- rda(eck_wave_bio ~ ., data = eck_temp_season)

# Plot RDA
plot(eck_temp_season_RDA, scaling  = 2)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_eck_temp_season <- round(cor(eck_temp_season, use = "pair"), 2)
cor_eck_temp_season

# Calculate VIF using vegan

vif.cca(eck_temp_season_RDA)

# Global adjusted R^2
(R2a.all <- RsquareAdj(eck_temp_season_RDA)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(eck_wave_bio ~ 1, data = eck_temp_season),
                         scope=formula(eck_temp_season_RDA), direction = "forward", pstep = 1000)

# Parsimonious RDA

eck_temp_season_pars <- rda(eck_wave_bio ~ Aug_mean_temp + Feb_mean_temp, data = eck_temp_season)
eck_temp_season_pars
anova.cca(eck_temp_season_pars, step = 1000)
anova.cca(eck_temp_season_pars, step = 1000, by = "axis")
vif.cca(eck_temp_season_pars)
(R2a.pars <- RsquareAdj(eck_temp_season_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(eck_temp_season_pars, scaling  = 2)

# Summary
summary(eck_temp_season_pars)

## Temp: Annual

# Subset temps for ecklonia sites (for seasons)
eck_temp_annual <- subset(eck_site0, select = c(12:16))

# standardise wave measurements
eck_temp_annual <- eck_temp_annual %>%
  decostand(method = "standardize")

# Force site names as column 0
eck_temp_annual <- cbind(eck_site, eck_temp_annual)

eck_temp_annual <- eck_temp_annual %>%
  remove_rownames %>%
  column_to_rownames(var = "site")

# run RDA
eck_temp_annual_RDA <- rda(eck_wave_bio ~ ., data = eck_temp_annual)

# Plot RDA
plot(eck_temp_annual_RDA, scaling  = 2)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_eck_temp_annual <- round(cor(eck_temp_annual, use = "pair"), 2)
cor_eck_temp_annual

# Calculate VIF using vegan

vif.cca(eck_temp_annual_RDA)

# Global adjusted R^2
(R2a.all <- RsquareAdj(eck_temp_annual_RDA)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(eck_wave_bio ~ 1, data = eck_temp_annual),
                         scope=formula(eck_temp_annual_RDA), direction = "forward", pstep = 1000)

# Parsimonious RDA

eck_temp_annual_pars <- rda(eck_wave_bio ~ Ann_sd_temp + Ann_min_temp + Ann_max_temp, data = eck_temp_annual)
eck_temp_annual_pars
anova.cca(eck_temp_annual_pars, step = 1000)
anova.cca(eck_temp_annual_pars, step = 1000, by = "axis")
vif.cca(eck_temp_annual_pars)
(R2a.pars <- RsquareAdj(eck_temp_annual_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(eck_temp_annual_pars, scaling  = 2)

# Summary
summary(eck_temp_annual_pars)

### RDA including both wave and temp variables for E.maxima

abio_all_eck <- cbind(eck_wave, eck_temp_annual)

# run RDA
RDA_all_eck <- rda(eck_wave_bio ~ ., data = abio_all_eck)

# Plot RDA
plot(RDA_all_eck, scaling  = 2)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_eck_all <- round(cor(abio_all_eck, use = "pair"), 2)
cor_eck_all

# Calculate "Variance Inflation Factor" using vegan

vif.cca(RDA_all_eck)

# Global adjusted R^2
(R2a.all <- RsquareAdj(RDA_all_eck)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(eck_wave_bio ~ 1, data = abio_all_eck),
                         scope=formula(RDA_all_eck), direction = "forward", pstep = 1000)

# Parsimonious RDA

eck_all_pars <- rda(eck_wave_bio ~ Ann_spw_mean + Ann_tp_mean + Ann_tp_sd + Ann_min_temp + Ann_sd_temp, data = abio_all_eck)
eck_all_pars
anova.cca(eck_all_pars, step = 1000)
anova.cca(eck_all_pars, step = 1000, by = "axis")
vif.cca(eck_all_pars)
(R2a.pars <- RsquareAdj(eck_all_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(eck_all_pars, scaling  = 2)

###### Laminaria

# rename lam_all to lam_site

lam_site0 <- lam_all

# Subset site names
lam_site <- subset(lam_site0, select = c(1))

# Subset wave for Lam sites (Annual only)
lam_wave <- subset(lam_site0, select = c(26:31, 44, 45))

# standardise wave measurements
lam_wave <- lam_wave %>%
  decostand(method = "standardize")

# subset Lam morpho's
lam_wave_bio <- subset(lam_site0, select = c(2:10))

# standardise measurements
lam_wave_bio <- lam_wave_bio %>%
  decostand(method = "standardize")

# Force site names as column 0
lam_wave <- cbind(lam_site, lam_wave)

lam_wave <- lam_wave %>%
  remove_rownames %>%
  column_to_rownames(var = "site")

lam_wave_bio <- cbind(lam_site, lam_wave_bio)

lam_wave_bio <- lam_wave_bio%>%
  remove_rownames %>%
  column_to_rownames(var = "site")

# run RDA
lam_wave_RDA <- rda(lam_wave_bio ~ ., data = lam_wave)

# Plot RDA
plot(lam_wave_RDA, scaling  = 2)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_lam_wave <- round(cor(lam_wave, use = "pair"), 2)
cor_lam_wave

# Calculate VIF using vegan

vif.cca(lam_wave_RDA)

# Global adjusted R^2
(R2a.all <- RsquareAdj(lam_wave_RDA)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(lam_wave_bio ~ 1, data = lam_wave),
                         scope=formula(lam_wave_RDA), direction = "forward", pstep = 1000)


# Parsimonious RDA

lam_wave_pars <- rda(lam_wave_bio ~ Ann_hs_mean + Ann_spw_mean + Ann_tp_mean, data = lam_wave)
lam_wave_pars
anova.cca(lam_wave_pars, step = 1000)
anova.cca(lam_wave_pars, step = 1000, by = "axis")
vif.cca(lam_wave_pars)
(R2a.pars <- RsquareAdj(lam_wave_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(lam_wave_pars, scaling  = 2)

# Summary
summary(lam_wave_RDA)

## Temp

# Subset temps for Lam sites (seasons)
lam_temp_season <- subset(lam_site0, select = c(16:25))

# standardise wave measurements
lam_temp_season <- lam_temp_season %>%
  decostand(method = "standardize")

# Force site names as column 0
lam_temp_season <- cbind(lam_site, lam_temp_season)

lam_temp_season <- lam_temp_season %>%
  remove_rownames %>%
  column_to_rownames(var = "site")

# run RDA
lam_temp_season_RDA <- rda(lam_wave_bio ~ ., data = lam_temp_season)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_lam_temp_season <- round(cor(lam_temp_season, use = "pair"), 2)
cor_lam_temp_season

# Calculate VIF using vegan

vif.cca(lam_temp_season_RDA)

# Global adjusted R^2
(R2a.all <- RsquareAdj(lam_temp_season_RDA)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(lam_wave_bio ~ 1, data = lam_temp_season),
                         scope=formula(lam_temp_season_RDA), direction = "forward", pstep = 1000)

# Plot scaling = 2
plot(lam_temp_season_RDA, scaling = 2)

# Summary
summary(lam_temp_season_RDA)

## Temp: Annual

# Subset temps for ecklonia sites (for seasons)
lam_temp_annual <- subset(lam_site0, select = c(11:15))

# standardise temp measurements
lam_temp_annual <- lam_temp_annual %>%
  decostand(method = "standardize")

# Force site names as column 0
lam_temp_annual <- cbind(lam_site, lam_temp_annual)

lam_temp_annual <- lam_temp_annual %>%
  remove_rownames %>%
  column_to_rownames(var = "site")

# run RDA
lam_temp_annual_RDA <- rda(lam_wave_bio ~ ., data = lam_temp_annual)

# Plot RDA
plot(lam_temp_annual_RDA, scaling  = 2)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_lam_temp_annual <- round(cor(lam_temp_annual, use = "pair"), 2)
cor_lam_temp_annual

# Calculate VIF using vegan

vif.cca(lam_temp_annual_RDA)

# Global adjusted R^2
(R2a.all <- RsquareAdj(lam_temp_annual_RDA)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(lam_wave_bio ~ 1, data = lam_temp_annual),
                         scope=formula(lam_temp_annual_RDA), direction = "forward", pstep = 1000)

# Parsimonious RDA

lam_temp_annual_pars <- rda(lam_wave_bio ~ Ann_mean_temp + Ann_sd_temp, data = lam_temp_annual)
lam_temp_annual_pars
anova.cca(lam_temp_annual_pars, step = 1000)
anova.cca(lam_temp_annual_pars, step = 1000, by = "axis")
vif.cca(lam_temp_annual_pars)
(R2a.pars <- RsquareAdj(lam_temp_annual_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(lam_temp_annual_pars, scaling  = 2)

# Summary
summary(lam_temp_annual_pars)

### RDA for both wave and temp variables for L.pallida

abio_all_lam <- cbind(lam_wave, lam_temp_annual)

# run RDA
RDA_all_lam <- rda(lam_wave_bio ~ ., data = abio_all_lam)

# Plot RDA
plot(RDA_all_lam, scaling  = 2)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_lam_all <- round(cor(abio_all_lam, use = "pair"), 2)
cor_lam_all

# Calculate VIF using vegan

vif.cca(RDA_all_lam)

# Global adjusted R^2
(R2a.all <- RsquareAdj(RDA_all_lam)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(lam_wave_bio ~ 1, data = abio_all_lam),
                         scope=formula(RDA_all_lam), direction = "forward", pstep = 1000)

# Parsimonious RDA

lam_all_pars <- rda(lam_wave_bio ~ Ann_max_temp + Ann_tp_mean + Ann_tp_sd + Ann_dir_median, data = abio_all_lam)
lam_all_pars
anova.cca(lam_all_pars, step = 1000)
anova.cca(lam_all_pars, step = 1000, by = "axis")
vif.cca(lam_all_pars)
(R2a.pars <- RsquareAdj(lam_all_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(lam_all_pars, scaling  = 2)

## Shallow kelp RDA

## Shallow kelp RDA (Temperature:Annual only)
# Select out shallow kelp

eck_all_shallow <- comp_df %>% 
  filter(depth == "shallow")

# remove unnecessary columns

eck_shallow <- subset(eck_all_shallow, select = -c(2))

## First create mean vlaues from each site for shallow ecklonia

eck_shallow_mean <- eck_shallow %>% 
  select(site, frond_mass:total_length) %>% 
  group_by(site) %>% 
  summarise_all(funs(mean(., na.rm = F)))

## Merge the biotic and abiotic variables
# Ecklonia
eck_all_shallow <- eck_shallow_mean %>% 
  left_join(temp_clim, by = "site") %>%
  left_join(wave_clim, by = "site") %>% # With wave data
  na.omit()
eck_shallow_bio <- eck_all_shallow %>% 
  select(frond_mass:total_length) %>% 
  decostand(method = "standardize")
eck_shallow_abio <- eck_all_shallow %>% 
  # select(Ann_mean_temp:Feb_sd_temp) %>% # Without wave data
  select(Ann_mean_temp:Feb_tp_sd) %>% # With wave data
  decostand(method = "standardize")

# rename eck_shallow to shallow_site0

shallow_site0 <- eck_all_shallow

# Subset site names
eck_shallow_site <- subset(shallow_site0, select = c(1))

# subset annual temp data
shallow_temp <- subset(shallow_site0, select = c(12:15))

# standardise temp measurements
shallow_temp <- shallow_temp %>%
  decostand(method = "standardize")

# subset ecklonia morpho's

shallow_bio <- subset(shallow_site0, select = c(2:11))

# standardise measurements
shallow_bio <- shallow_bio %>%
  decostand(method = "standardize")

# Force site names as column 0
shallow_temp <- cbind(eck_shallow_site, shallow_temp)

shallow_temp <- shallow_temp %>%
  remove_rownames %>%
  column_to_rownames(var = "site")

shallow_bio <- cbind(eck_shallow_site, shallow_bio)

shallow_bio <- shallow_bio%>%
  remove_rownames %>%
  column_to_rownames(var = "site")

# run RDA
shallow_temp_RDA <- rda(shallow_bio ~ ., data = shallow_abio)
summary(shallow_temp_RDA)
# Plot intial RDA
plot(shallow_temp_RDA, scaling  = 2)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_shallow_temp_annual <- round(cor(shallow_temp, use = "pair"), 2)
cor_shallow_temp_annual

# Calculate VIF using vegan

vif.cca(shallow_temp_RDA)

# Global adjusted R^2
(R2a.all <- RsquareAdj(shallow_temp_RDA)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(shallow_bio ~ 1, data = shallow_temp),
                         scope=formula(shallow_temp_RDA), direction = "forward", pstep = 1000)

# Parsimonious RDA

shallow_temp_pars <- rda(shallow_bio ~ Ann_range_temp + Ann_mean_temp, data = shallow_temp)
shallow_temp_pars
anova.cca(shallow_temp_pars, step = 1000)
anova.cca(shallow_temp_pars, step = 1000, by = "axis")
vif.cca(shallow_temp_pars)
(R2a.pars <- RsquareAdj(shallow_temp_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(shallow_temp_pars, scaling  = 2)

# Summary
summary(shallow_temp_pars)

## Shallow RDA (Waves)

# subset waves data
shallow_wave <- subset(shallow_site0, select = c(27:32, 45, 46))

# Force site names as column 0
shallow_wave <- cbind(eck_shallow_site, shallow_wave)

shallow_wave <- shallow_wave %>%
  remove_rownames %>%
  column_to_rownames(var = "site")

# run RDA
shallow_wave_RDA <- rda(shallow_bio ~ ., data = shallow_wave)

# Plot RDA
plot(shallow_wave_RDA, scaling  = 2)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_shallow_wave <- round(cor(shallow_wave, use = "pair"), 2)
cor_shallow_wave

vif.cca(shallow_wave_RDA)

# Global adjusted R^2
(R2a.all <- RsquareAdj(lam_temp_annual_RDA)$adj.r.squared) 

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(shallow_bio ~ 1, data = eck_shallow_abio),
                         scope=formula(shallow_wave_RDA), direction = "forward", pstep = 1000)

# Parsimonious RDA

shallow_wave_pars <- rda(shallow_bio ~ Ann_hs_mean  + Ann_hs_sd, data = shallow_wave)
shallow_wave_pars
anova.cca(shallow_wave_pars, step = 1000)
anova.cca(shallow_wave_pars, step = 1000, by = "axis")
vif.cca(shallow_wave_pars)
(R2a.pars <- RsquareAdj(shallow_wave_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(shallow_wave_pars, scaling  = 2)

# Summary
summary(lam_temp_annual_pars)

### RDA for wave and temperature for shallow E. maxima

shallow_wave_RDA <- rda(shallow_bio ~ ., data = eck_shallow_abio)

# Use the "cor" function to calculate Pearson correlation between predictors.

cor_shallow_all <- round(cor(eck_shallow_abio, use = "pair"), 2)
cor_shallow_all

# Forward selection using vegan's ordistep
# Note that is function does not use R^2adjusted-based stopping criterion

step.forward <- ordistep(rda(shallow_bio ~ 1, data = eck_shallow_abio),
                         scope=formula(shallow_wave_RDA), direction = "forward", pstep = 1000)

# Parsimonious RDA

shallow_all_pars <- rda(shallow_bio ~ Ann_mean_temp + Ann_sd_temp + Ann_tp_mean + Ann_hs_mean, data = eck_shallow_abio)
shallow_all_pars
anova.cca(shallow_all_pars, step = 1000)
anova.cca(shallow_all_pars, step = 1000, by = "axis")
vif.cca(shallow_all_pars)
(R2a.pars <- RsquareAdj(shallow_all_pars)$adj.r.squared)

# Plot parsimonious RDA
plot(shallow_all_pars, scaling  = 1)

# Summary
summary(shallow_all_pars)




