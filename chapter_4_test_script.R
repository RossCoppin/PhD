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

coper_filepath <- paste0("OceanParcels/chapter_4_oceanmodel/copernicus_phy001_030/global-reanalysis-phy-001-030-daily_1625764682025.nc")
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


##################################################

soetwater_summer <- tidync("OceanParcels/chapter_4_output/soetwater_summer.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
soetwater_summer$season <- "Summer"
soetwater_summer$site <- "Soetwater"
soetwater_summer_mean <- soetwater_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_summer_mean$season <- "Summer"
soetwater_summer_mean$site <- "Soetwater"

soetwater_autumn <- tidync("OceanParcels/chapter_4_output/soetwater_autumn.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
soetwater_autumn$season <- "Autumn"
soetwater_autumn$site <- "Soetwater"
soetwater_autumn_mean <- soetwater_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_autumn_mean$season <- "Autumn"
soetwater_autumn_mean$site <- "Soetwater"

soetwater_winter <- tidync("OceanParcels/chapter_4_output/soetwater_winter.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
soetwater_winter$season <- "Winter"
soetwater_winter$site <- "Soetwater"
soetwater_winter_mean <- soetwater_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_winter_mean$season <- "Winter"
soetwater_winter_mean$site <- "Soetwater"

soetwater_spring <- tidync("OceanParcels/chapter_4_output/soetwater_spring.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
soetwater_spring$season <- "Spring"
soetwater_spring$site <- "Soetwater"
soetwater_spring_mean <- soetwater_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_spring_mean$season <- "Spring"
soetwater_spring_mean$site <- "Soetwater"

total_summer_end <- total_summer %>%
  filter(t =="2019-02-28 00:00:00")



