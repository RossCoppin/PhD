library(gganimate)
library(tidync)
library(tidyverse)
library(ncdf4)


climate_filepath <- paste0("OceanParcels/trajectory_data/Mean_KFloat_H100_W00.nc")
climate_output <- nc_open(climate_filepath)


p_eddy <- tidync("OceanParcels/trajectory_data/PassiveEddy.nc") %>%
  hyper_tibble() %>%
  dplyr::select(lon, lat, time) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
p_eddy_mean <- p_eddy %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

p_eddy$type <- "Passive Eddy" # add extra column 'type' to dataframe









