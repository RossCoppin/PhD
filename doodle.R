# Calculate the necessary stats
# Monthly clims
wave_feb_aug <- wave_model %>% 
  mutate(date = lubridate::month(date, label = TRUE)) %>% 
  filter(site != "FB025") %>% # FB_25 has issues with 'hs' and 'tp' 
  group_by(site, date) %>% 
  summarise_all(funs(mean = mean, sd = sd, min = min, max = max), na.rm = T) %>%
  select(-dir_mean, -dirw_mean, -dir_sd, dirw_sd, -spw_mean,-dirw_sd, -spw_sd, -dir_min, -dirw_min, - spw_min, -dir_max, -dirw_max, -spw_max ) %>% 
  filter(date %in% c("Feb", "Aug")) %>% 
  ungroup()

# Annual clims
wave_ann <- wave_model %>% 
  mutate(date = lubridate::month(date, label = TRUE)) %>% 
  filter(site != "FB025") %>% # FB_25 has issues with 'hs' and 'tp'
  group_by(site, date) %>% 
  summarise_all(funs(mean = mean, sd = sd, min = min, max = max), na.rm = T) %>%
  ungroup() %>% 
  select(-date) %>% 
  group_by(site) %>% 
  summarise_all(funs(mean), na.rm = T) %>% 
  mutate(date = "Ann") %>% 
  select(site, date, everything())  %>%
  select(-dir_mean, -dirw_mean, -dir_sd, dirw_sd, -spw_mean,-dirw_sd, -spw_sd, -dir_min, -dirw_min, - spw_min, -dir_max, -dirw_max, -spw_max )

# Subset directions out
dirs <- subset(wave_model, select = c(1, 2, 5, 6, 7))

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













