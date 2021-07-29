## Load software need for entire script

load("map/south_africa_coast_hi_res.Rdata")
load("map/sa_bathy.RData")

library(ggplot2)
library(gridExtra)
library(ggpubr)
library(mapproj)
library(vegan)
library(dplyr)
library(ggpubr)
library(maps)
library(flextable)
library(officer)
library(hexbin)
library(lubridate)
library(tidyverse)
library(tidync)
library(ncdf4)

options(scipen = 999)

deVoss_filepath <- paste0("OceanParcels/coppin_extract_01.nc")
deVoss_output <- nc_open(deVoss_filepath)

coper_filepath <- paste0("OceanParcels/global-analysis-forecast-phy-001-024_1623936804092.nc")
coper_output <- nc_open(coper_filepath)

test <- tidync("OceanParcels/test.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, Salinity, age, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2020-01-01 00:00:00"))

test_2 <- tidync("OceanParcels/test.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, Salinity, age, SinkSpeed, KelpDepth, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2020-01-01 00:00:00"))

test <- test_kom %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:KelpDepth, mean, na.rm= TRUE))

test_3 <- tidync("OceanParcels/test.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, Salinity, age, SinkSpeed, KelpDepth, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2020-01-01 00:00:00"))

bathy_filepath <- paste0("OceanParcels/copernicus/GLO-MFC_001_024_mask_bathy.nc")
bathy_output <- nc_open(bathy_filepath)

wind_filepath <- paste0("OceanParcels/copernicus/CERSAT-GLO-BLENDED_WIND_L4-V6-OBS_FULL_TIME_SERIE_1624029428851.nc")
wind_output <- nc_open(wind_filepath)
