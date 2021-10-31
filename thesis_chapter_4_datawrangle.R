# script for initial data wrangle for chapter 4. this script will be used to create seperate datasets
#that will be used for the main script ("thesis_chapter_4.rmd"

houtbay_summer <- tidync("OceanParcels/chapter_4_output/hb_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_summer$season <- "Summer"
houtbay_summer$site <- "Hout Bay"
houtbay_summer_mean <- houtbay_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
houtbay_summer_mean$season <- "Summer"
houtbay_summer_mean$site <- "Hout Bay"

houtbay_autumn <- tidync("OceanParcels/chapter_4_output/hb_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_autumn$season <- "Autumn"
houtbay_autumn$site <- "Hout Bay"
houtbay_autumn_mean <- houtbay_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
houtbay_autumn_mean$season <- "Autumn"
houtbay_autumn_mean$site <- "Hout Bay"

houtbay_winter <- tidync("OceanParcels/chapter_4_output/hb_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,Phase,KelpDepth, SinkSpeed,KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_winter$season <- "Winter"
houtbay_winter$site <- "Hout Bay"
houtbay_winter_mean <- houtbay_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
houtbay_winter_mean$season <- "Winter"
houtbay_winter_mean$site <- "Hout Bay"

houtbay_spring <- tidync("OceanParcels/chapter_4_output/hb_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed,KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_spring$season <- "Spring"
houtbay_spring$site <- "Hout Bay"
houtbay_spring_mean <- houtbay_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
houtbay_spring_mean$season <- "Spring"
houtbay_spring_mean$site <- "Hout Bay"

kom_summer <- tidync("OceanParcels/chapter_4_output/kom_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_summer$season <- "Summer"
kom_summer$site <- "Kommetjie"
kom_summer_mean <- kom_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kom_summer_mean$season <- "Summer"
kom_summer_mean$site <- "Kommetjie"

kom_autumn <- tidync("OceanParcels/chapter_4_output/kom_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_autumn$season <- "Autumn"
kom_autumn$site <- "Kommetjie"
kom_autumn_mean <- kom_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kom_autumn_mean$season <- "Autumn"
kom_autumn_mean$site <- "Kommetjie"

kom_winter <- tidync("OceanParcels/chapter_4_output/kom_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_winter$season <- "Winter"
kom_winter$site <- "Kommetjie"
kom_winter_mean <- kom_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kom_winter_mean$season <- "Winter"
kom_winter_mean$site <- "Kommetjie"

kom_spring <- tidync("OceanParcels/chapter_4_output/kom_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_spring$season <- "Spring"
kom_spring$site <- "Kommetjie"
kom_spring_mean <- kom_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kom_spring_mean$season <- "Spring"
kom_spring_mean$site <- "Kommetjie"

scar_summer <- tidync("OceanParcels/chapter_4_output/scar_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_summer$season <- "Summer"
scar_summer$site <- "Scarborough"
scar_summer_mean <- scar_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
scar_summer_mean$season <- "Summer"
scar_summer_mean$site <- "Scarborough"

scar_autumn <- tidync("OceanParcels/chapter_4_output/scar_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_autumn$season <- "Autumn"
scar_autumn$site <- "Scarborough"
scar_autumn_mean <- scar_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
scar_autumn_mean$season <- "Autumn"
scar_autumn_mean$site <- "Scarborough"

scar_winter <- tidync("OceanParcels/chapter_4_output/scar_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_winter$season <- "Winter"
scar_winter$site <- "Scarborough"
scar_winter_mean <- scar_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
scar_winter_mean$season <- "Winter"
scar_winter_mean$site <- "Scarborough"

scar_spring <- tidync("OceanParcels/chapter_4_output/scar_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_spring$season <- "Spring"
scar_spring$site <- "Scarborough"
scar_spring_mean <- scar_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
scar_spring_mean$season <- "Spring"
scar_spring_mean$site <- "Scarborough"

oude_summer <- tidync("OceanParcels/chapter_4_output/oude_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oude_summer$season <- "Summer"
oude_summer$site <- "Oudekraal"
oude_summer_mean <- oude_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
oude_summer_mean$season <- "Summer"
oude_summer_mean$site <- "Oudekraal"

oude_autumn <- tidync("OceanParcels/chapter_4_output/oude_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oude_autumn$season <- "Autumn"
oude_autumn$site <- "Oudekraal"
oude_autumn_mean <- oude_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
oude_autumn_mean$season <- "Autumn"
oude_autumn_mean$site <- "Oudekraal"

oude_winter <- tidync("OceanParcels/chapter_4_output/oude_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oude_winter$season <- "Winter"
oude_winter$site <- "Oudekraal"
oude_winter_mean <- oude_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
oude_winter_mean$season <- "Winter"
oude_winter_mean$site <- "Oudekraal"

oude_spring <- tidync("OceanParcels/chapter_4_output/oude_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oude_spring$season <- "Spring"
oude_spring$site <- "Oudekraal"
oude_spring_mean <- oude_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
oude_spring_mean$season <- "Spring"
oude_spring_mean$site <- "Oudekraal"

betty_summer <- tidync("OceanParcels/chapter_4_output/betty_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_summer$season <- "Summer"
betty_summer$site <- "Betty's Bay"
betty_summer_mean <- betty_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
betty_summer_mean$season <- "Summer"
betty_summer_mean$site <- "Betty's Bay"

betty_autumn <- tidync("OceanParcels/chapter_4_output/betty_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_autumn$season <- "Autumn"
betty_autumn$site <- "Betty's Bay"
betty_autumn_mean <- betty_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
betty_autumn_mean$season <- "Autumn"
betty_autumn_mean$site <- "Betty's Bay"

betty_winter <- tidync("OceanParcels/chapter_4_output/betty_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_winter$season <- "Winter"
betty_winter$site <- "Betty's Bay"
betty_winter_mean <- betty_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
betty_winter_mean$season <- "Winter"
betty_winter_mean$site <- "Betty's Bay"

betty_spring <- tidync("OceanParcels/chapter_4_output/betty_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_spring$season <- "Spring"
betty_spring$site <- "Betty's Bay"
betty_spring_mean <- betty_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
betty_spring_mean$season <- "Spring"
betty_spring_mean$site <- "Betty's Bay"

kalk_summer <- tidync("OceanParcels/chapter_4_output/kalk_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_summer$season <- "Summer"
kalk_summer$site <- "Kalk Bay"
kalk_summer_mean <- kalk_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kalk_summer_mean$season <- "Summer"
kalk_summer_mean$site <- "Kalk Bay"

kalk_autumn <- tidync("OceanParcels/chapter_4_output/kalk_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_autumn$season <- "Autumn"
kalk_autumn$site <- "Kalk Bay"
kalk_autumn_mean <- kalk_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kalk_autumn_mean$season <- "Autumn"
kalk_autumn_mean$site <- "Kalk Bay"

kalk_winter <- tidync("OceanParcels/chapter_4_output/kalk_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_winter$season <- "Winter"
kalk_winter$site <- "Kalk Bay"
kalk_winter_mean <- kalk_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kalk_winter_mean$season <- "Winter"
kalk_winter_mean$site <- "Kalk Bay"

kalk_spring <- tidync("OceanParcels/chapter_4_output/kalk_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_spring$season <- "Spring"
kalk_spring$site <- "Kalk Bay"
kalk_spring_mean <- kalk_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kalk_spring_mean$season <- "Spring"
kalk_spring_mean$site <- "Kalk Bay"

aframe_summer <- tidync("OceanParcels/chapter_4_output/aframe_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_summer$season <- "Summer"
aframe_summer$site <- "A-Frame"
aframe_summer_mean <- aframe_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
aframe_summer_mean$season <- "Summer"
aframe_summer_mean$site <- "A-Frame"

aframe_autumn <- tidync("OceanParcels/chapter_4_output/aframe_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_autumn$season <- "Autumn"
aframe_autumn$site <- "A-Frame"
aframe_autumn_mean <- aframe_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
aframe_autumn_mean$season <- "Autumn"
aframe_autumn_mean$site <- "A-Frame"

aframe_winter <- tidync("OceanParcels/chapter_4_output/aframe_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_winter$season <- "Winter"
aframe_winter$site <- "A-Frame"
aframe_winter_mean <- aframe_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
aframe_winter_mean$season <- "Winter"
aframe_winter_mean$site <- "A-Frame"

aframe_spring <- tidync("OceanParcels/chapter_4_output/aframe_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_spring$season <- "Spring"
aframe_spring$site <- "A-Frame"
aframe_spring_mean <- aframe_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
aframe_spring_mean$season <- "Spring"
aframe_spring_mean$site <- "A-Frame"

sthelena_summer <- tidync("OceanParcels/chapter_4_output/helena_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_summer$season <- "Summer"
sthelena_summer$site <- "St. Helena Bay"
sthelena_summer_mean <- sthelena_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
sthelena_summer_mean$season <- "Summer"
sthelena_summer_mean$site <- "St. Helena Bay"

sthelena_autumn <- tidync("OceanParcels/chapter_4_output/helena_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_autumn$season <- "Autumn"
sthelena_autumn$site <- "St. Helena Bay"
sthelena_autumn_mean <- sthelena_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
sthelena_autumn_mean$season <- "Autumn"
sthelena_autumn_mean$site <- "St. Helena Bay"

sthelena_winter <- tidync("OceanParcels/chapter_4_output/helena_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_winter$season <- "Winter"
sthelena_winter$site <- "St. Helena Bay"
sthelena_winter_mean <- sthelena_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
sthelena_winter_mean$season <- "Winter"
sthelena_winter_mean$site <- "St. Helena Bay"

sthelena_spring <- tidync("OceanParcels/chapter_4_output/helena_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_spring$season <- "Spring"
sthelena_spring$site <- "St. Helena Bay"
sthelena_spring_mean <- sthelena_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
sthelena_spring_mean$season <- "Spring"
sthelena_spring_mean$site <- "St. Helena Bay"

millers_summer <- tidync("OceanParcels/chapter_4_output/millers_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_summer$season <- "Summer"
millers_summer$site <- "Miller's Point"
millers_summer_mean <- millers_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
millers_summer_mean$season <- "Summer"
millers_summer_mean$site <- "Miller's Point"

millers_autumn <- tidync("OceanParcels/chapter_4_output/millers_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_autumn$season <- "Autumn"
millers_autumn$site <- "Miller's Point"
millers_autumn_mean <- millers_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
millers_autumn_mean$season <- "Autumn"
millers_autumn_mean$site <- "Miller's Point"

millers_winter <- tidync("OceanParcels/chapter_4_output/millers_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_winter$season <- "Winter"
millers_winter$site <- "Miller's Point"
millers_winter_mean <- millers_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
millers_winter_mean$season <- "Winter"
millers_winter_mean$site <- "Miller's Point"

millers_spring <- tidync("OceanParcels/chapter_4_output/millers_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_spring$season <- "Spring"
millers_spring$site <- "Miller's Point"
millers_spring_mean <- millers_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
millers_spring_mean$season <- "Spring"
millers_spring_mean$site <- "Miller's Point"

baboon_summer <- tidync("OceanParcels/chapter_4_output/baboon_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_summer$season <- "Summer"
baboon_summer$site <- "Baboon Rock"
baboon_summer_mean <- baboon_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
baboon_summer_mean$season <- "Summer"
baboon_summer_mean$site <- "Baboon Rock"

baboon_autumn <- tidync("OceanParcels/chapter_4_output/baboon_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_autumn$season <- "Autumn"
baboon_autumn$site <- "Baboon Rock"
baboon_autumn_mean <- baboon_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
baboon_autumn_mean$season <- "Autumn"
baboon_autumn_mean$site <- "Baboon Rock"

baboon_winter <- tidync("OceanParcels/chapter_4_output/baboon_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_winter$season <- "Winter"
baboon_winter$site <- "Baboon Rock"
baboon_winter_mean <- baboon_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
baboon_winter_mean$season <- "Winter"
baboon_winter_mean$site <- "Baboon Rock"

baboon_spring <- tidync("OceanParcels/chapter_4_output/baboon_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_spring$season <- "Spring"
baboon_spring$site <- "Baboon Rock"
baboon_spring_mean <- baboon_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
baboon_spring_mean$season <- "Spring"
baboon_spring_mean$site <- "Baboon Rock"

basata_summer <- tidync("OceanParcels/chapter_4_output/batsata_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
basata_summer$season <- "Summer"
basata_summer$site <- "Basata Rock"
basata_summer_mean <- basata_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
basata_summer_mean$season <- "Summer"
basata_summer_mean$site <- "Basata Rock"

basata_autumn <- tidync("OceanParcels/chapter_4_output/batsata_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
basata_autumn$season <- "Autumn"
basata_autumn$site <- "Basata Rock"
basata_autumn_mean <- basata_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
basata_autumn_mean$season <- "Autumn"
basata_autumn_mean$site <- "Basata Rock"

basata_winter <- tidync("OceanParcels/chapter_4_output/batsata_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
basata_winter$season <- "Winter"
basata_winter$site <- "Basata Rock"
basata_winter_mean <- basata_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
basata_winter_mean$season <- "Winter"
basata_winter_mean$site <- "Basata Rock"

basata_spring <- tidync("OceanParcels/chapter_4_output/batsata_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
basata_spring$season <- "Spring"
basata_spring$site <- "Basata Rock"
basata_spring_mean <- basata_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
basata_spring_mean$season <- "Spring"
basata_spring_mean$site <- "Basata Rock"

buffels_summer <- tidync("OceanParcels/chapter_4_output/buffels_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_summer$season <- "Summer"
buffels_summer$site <- "Buffelsbaai"
buffels_summer_mean <- buffels_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
buffels_summer_mean$season <- "Summer"
buffels_summer_mean$site <- "Buffelsbaai"

buffels_autumn <- tidync("OceanParcels/chapter_4_output/buffels_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_autumn$season <- "Autumn"
buffels_autumn$site <- "Buffelsbaai"
buffels_autumn_mean <- buffels_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
buffels_autumn_mean$season <- "Autumn"
buffels_autumn_mean$site <- "Buffelsbaai"

buffels_winter <- tidync("OceanParcels/chapter_4_output/buffels_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_winter$season <- "Winter"
buffels_winter$site <- "Buffelsbaai"
buffels_winter_mean <- buffels_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
buffels_winter_mean$season <- "Winter"
buffels_winter_mean$site <- "Buffelsbaai"

buffels_spring <- tidync("OceanParcels/chapter_4_output/buffels_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_spring$season <- "Spring"
buffels_spring$site <- "Buffelsbaai"
buffels_spring_mean <- buffels_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
buffels_spring_mean$season <- "Spring"
buffels_spring_mean$site <- "Buffelsbaai"

soetwater_summer <- tidync("OceanParcels/chapter_4_output/soetwater_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_summer$season <- "Summer"
soetwater_summer$site <- "Soetwater"
soetwater_summer_mean <- soetwater_summer %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_summer_mean$season <- "Summer"
soetwater_summer_mean$site <- "Soetwater"

soetwater_autumn <- tidync("OceanParcels/chapter_4_output/soetwater_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_autumn$season <- "Autumn"
soetwater_autumn$site <- "Soetwater"
soetwater_autumn_mean <- soetwater_autumn %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_autumn_mean$season <- "Autumn"
soetwater_autumn_mean$site <- "Soetwater"

soetwater_winter <- tidync("OceanParcels/chapter_4_output/soetwater_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_winter$season <- "Winter"
soetwater_winter$site <- "Soetwater"
soetwater_winter_mean <- soetwater_winter %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_winter_mean$season <- "Winter"
soetwater_winter_mean$site <- "Soetwater"

soetwater_spring <- tidync("OceanParcels/chapter_4_output/soetwater_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase,KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_spring$season <- "Spring"
soetwater_spring$site <- "Soetwater"
soetwater_spring_mean <- soetwater_spring %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_spring_mean$season <- "Spring"
soetwater_spring_mean$site <- "Soetwater"

# Summer1
total_summer <- rbind(kom_summer, houtbay_summer, scar_summer, oude_summer, betty_summer, kalk_summer, aframe_summer, millers_summer, sthelena_summer, baboon_summer, basata_summer, buffels_summer, soetwater_summer)
total_summer$age <- with(total_summer, age/3600)

total_summer_mean <- rbind(kom_summer_mean, houtbay_summer_mean, scar_summer_mean, oude_summer_mean, betty_summer_mean, kalk_summer_mean, aframe_summer_mean, sthelena_summer_mean, millers_summer_mean, baboon_summer_mean, basata_summer_mean, buffels_summer_mean, soetwater_summer_mean)
write.csv(total_summer, "OceanParcels/df_total_summer.csv", row.names = TRUE)
write.csv(total_summer_mean, "OceanParcels/df_total_summer_mean.csv", row.names = TRUE)

# Autumn1

total_autumn <- rbind(kom_autumn, houtbay_autumn, scar_autumn, oude_autumn, betty_autumn, kalk_autumn, aframe_autumn, millers_autumn, sthelena_autumn, baboon_autumn, basata_autumn, buffels_autumn, soetwater_autumn)
total_autumn$age <- with(total_autumn, age/3600)

total_autumn_mean <- rbind(kom_autumn_mean, houtbay_autumn_mean, scar_autumn_mean, oude_autumn_mean, betty_autumn_mean, kalk_autumn_mean, aframe_autumn_mean, sthelena_autumn_mean, millers_autumn_mean, baboon_autumn_mean, basata_autumn_mean, buffels_autumn_mean, soetwater_autumn_mean)
write.csv(total_autumn, "OceanParcels/df_total_autumn.csv", row.names = TRUE)
write.csv(total_autumn_mean, "OceanParcels/df_total_autumn_mean.csv", row.names = TRUE)

# Winter1

total_winter <- rbind(kom_winter, houtbay_winter, scar_winter, oude_winter, betty_winter, kalk_winter, aframe_winter, millers_winter, sthelena_winter, baboon_winter, basata_winter, buffels_winter, soetwater_winter)
total_winter$age <- with(total_winter, age/3600)

total_winter_mean <- rbind(kom_winter_mean, houtbay_winter_mean, scar_winter_mean, oude_winter_mean, betty_winter_mean, kalk_winter_mean, aframe_winter_mean, sthelena_winter_mean, millers_winter_mean, baboon_winter_mean, basata_winter_mean, buffels_winter_mean, soetwater_winter_mean)
write.csv(total_winter, "OceanParcels/df_total_winter.csv", row.names = TRUE)
write.csv(total_winter_mean, "OceanParcels/df_total_winter_mean.csv", row.names = TRUE)

# Spring1

total_spring <- rbind(kom_spring, houtbay_spring, scar_spring, oude_spring, betty_spring, kalk_spring, aframe_spring, millers_spring, sthelena_spring, baboon_spring, basata_spring, buffels_spring, soetwater_spring)
total_spring$age <- with(total_spring, age/3600)

total_spring_mean <- rbind(kom_spring_mean, houtbay_spring_mean, scar_spring_mean, oude_spring_mean, betty_spring_mean, kalk_spring_mean, aframe_spring_mean, sthelena_spring_mean, millers_spring_mean, baboon_spring_mean, basata_spring_mean, buffels_spring_mean, soetwater_spring_mean)
write.csv(total_spring, "OceanParcels/df_total_spring.csv", row.names = TRUE)
write.csv(total_spring_mean, "OceanParcels/df_total_spring_mean.csv", row.names = TRUE)

## year 2
houtbay_summer2 <- tidync("OceanParcels/chapter_4_output/hb_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_summer2$season <- "Summer"
houtbay_summer2$site <- "Hout Bay"
houtbay_summer2_mean <- houtbay_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
houtbay_summer2_mean$season <- "Summer"
houtbay_summer2_mean$site <- "Hout Bay"

houtbay_autumn2 <- tidync("OceanParcels/chapter_4_output/hb_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_autumn2$season <- "Autumn"
houtbay_autumn2$site <- "Hout Bay"
houtbay_autumn2_mean <- houtbay_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
houtbay_autumn2_mean$season <- "Autumn"
houtbay_autumn2_mean$site <- "Hout Bay"

houtbay_winter2 <- tidync("OceanParcels/chapter_4_output/hb_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_winter2$season <- "Winter"
houtbay_winter2$site <- "Hout Bay"
houtbay_winter2_mean <- houtbay_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
houtbay_winter2_mean$season <- "Winter"
houtbay_winter2_mean$site <- "Hout Bay"

houtbay_spring2 <- tidync("OceanParcels/chapter_4_output/hb_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_spring2$season <- "Spring"
houtbay_spring2$site <- "Hout Bay"
houtbay_spring2_mean <- houtbay_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
houtbay_spring2_mean$season <- "Spring"
houtbay_spring2_mean$site <- "Hout Bay"

kom_summer2 <- tidync("OceanParcels/chapter_4_output/kom_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_summer2$season <- "Summer"
kom_summer2$site <- "Kommetjie"
kom_summer2_mean <- kom_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kom_summer2_mean$season <- "Summer"
kom_summer2_mean$site <- "Kommetjie"

kom_autumn2 <- tidync("OceanParcels/chapter_4_output/kom_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_autumn2$season <- "Autumn"
kom_autumn2$site <- "Kommetjie"
kom_autumn2_mean <- kom_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kom_autumn2_mean$season <- "Autumn"
kom_autumn2_mean$site <- "Kommetjie"

kom_winter2 <- tidync("OceanParcels/chapter_4_output/kom_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_winter2$season <- "Winter"
kom_winter2$site <- "Kommetjie"
kom_winter2_mean <- kom_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kom_winter2_mean$season <- "Winter"
kom_winter2_mean$site <- "Kommetjie"

kom_spring2 <- tidync("OceanParcels/chapter_4_output/kom_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_spring2$season <- "Spring"
kom_spring2$site <- "Kommetjie"
kom_spring2_mean <- kom_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kom_spring2_mean$season <- "Spring"
kom_spring2_mean$site <- "Kommetjie"

scar_summer2 <- tidync("OceanParcels/chapter_4_output/scar_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_summer2$season <- "Summer"
scar_summer2$site <- "Scarborough"
scar_summer2_mean <- scar_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
scar_summer2_mean$season <- "Summer"
scar_summer2_mean$site <- "Scarborough"

scar_autumn2 <- tidync("OceanParcels/chapter_4_output/scar_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_autumn2$season <- "Autumn"
scar_autumn2$site <- "Scarborough"
scar_autumn2_mean <- scar_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
scar_autumn2_mean$season <- "Autumn"
scar_autumn2_mean$site <- "Scarborough"

scar_winter2 <- tidync("OceanParcels/chapter_4_output/scar_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_winter2$season <- "Winter"
scar_winter2$site <- "Scarborough"
scar_winter2_mean <- scar_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
scar_winter2_mean$season <- "Winter"
scar_winter2_mean$site <- "Scarborough"

scar_spring2 <- tidync("OceanParcels/chapter_4_output/scar_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_spring2$season <- "Spring"
scar_spring2$site <- "Scarborough"
scar_spring2_mean <- scar_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
scar_spring2_mean$season <- "Spring"
scar_spring2_mean$site <- "Scarborough"

oude_summer2 <- tidync("OceanParcels/chapter_4_output/oude_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oude_summer2$season <- "Summer"
oude_summer2$site <- "Oudekraal"
oude_summer2_mean <- oude_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
oude_summer2_mean$season <- "Summer"
oude_summer2_mean$site <- "Oudekraal"

oude_autumn2 <- tidync("OceanParcels/chapter_4_output/oude_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oude_autumn2$season <- "Autumn"
oude_autumn2$site <- "Oudekraal"
oude_autumn2_mean <- oude_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
oude_autumn2_mean$season <- "Autumn"
oude_autumn2_mean$site <- "Oudekraal"

oude_winter2 <- tidync("OceanParcels/chapter_4_output/oude_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oude_winter2$season <- "Winter"
oude_winter2$site <- "Oudekraal"
oude_winter2_mean <- oude_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
oude_winter2_mean$season <- "Winter"
oude_winter2_mean$site <- "Oudekraal"

oude_spring2 <- tidync("OceanParcels/chapter_4_output/oude_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oude_spring2$season <- "Spring"
oude_spring2$site <- "Oudekraal"
oude_spring2_mean <- oude_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
oude_spring2_mean$season <- "Spring"
oude_spring2_mean$site <- "Oudekraal"

betty_summer2 <- tidync("OceanParcels/chapter_4_output/betty_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_summer2$season <- "Summer"
betty_summer2$site <- "Betty's Bay"
betty_summer2_mean <- betty_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
betty_summer2_mean$season <- "Summer"
betty_summer2_mean$site <- "Betty's Bay"

betty_autumn2 <- tidync("OceanParcels/chapter_4_output/betty_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_autumn2$season <- "Autumn"
betty_autumn2$site <- "Betty's Bay"
betty_autumn2_mean <- betty_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
betty_autumn2_mean$season <- "Autumn"
betty_autumn2_mean$site <- "Betty's Bay"

betty_winter2 <- tidync("OceanParcels/chapter_4_output/betty_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_winter2$season <- "Winter"
betty_winter2$site <- "Betty's Bay"
betty_winter2_mean <- betty_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
betty_winter2_mean$season <- "Winter"
betty_winter2_mean$site <- "Betty's Bay"

betty_spring2 <- tidync("OceanParcels/chapter_4_output/betty_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_spring2$season <- "Spring"
betty_spring2$site <- "Betty's Bay"
betty_spring2_mean <- betty_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
betty_spring2_mean$season <- "Spring"
betty_spring2_mean$site <- "Betty's Bay"

kalk_summer2 <- tidync("OceanParcels/chapter_4_output/kalk_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_summer2$season <- "Summer"
kalk_summer2$site <- "Kalk Bay"
kalk_summer2_mean <- kalk_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kalk_summer2_mean$season <- "Summer"
kalk_summer2_mean$site <- "Kalk Bay"

kalk_autumn2 <- tidync("OceanParcels/chapter_4_output/kalk_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_autumn2$season <- "Autumn"
kalk_autumn2$site <- "Kalk Bay"
kalk_autumn2_mean <- kalk_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kalk_autumn2_mean$season <- "Autumn"
kalk_autumn2_mean$site <- "Kalk Bay"

kalk_winter2 <- tidync("OceanParcels/chapter_4_output/kalk_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_winter2$season <- "Winter"
kalk_winter2$site <- "Kalk Bay"
kalk_winter2_mean <- kalk_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kalk_winter2_mean$season <- "Winter"
kalk_winter2_mean$site <- "Kalk Bay"

kalk_spring2 <- tidync("OceanParcels/chapter_4_output/kalk_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_spring2$season <- "Spring"
kalk_spring2$site <- "Kalk Bay"
kalk_spring2_mean <- kalk_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
kalk_spring2_mean$season <- "Spring"
kalk_spring2_mean$site <- "Kalk Bay"

aframe_summer2 <- tidync("OceanParcels/chapter_4_output/aframe_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_summer2$season <- "Summer"
aframe_summer2$site <- "A-Frame"
aframe_summer2_mean <- aframe_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
aframe_summer2_mean$season <- "Summer"
aframe_summer2_mean$site <- "A-Frame"

aframe_autumn2 <- tidync("OceanParcels/chapter_4_output/aframe_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_autumn2$season <- "Autumn"
aframe_autumn2$site <- "A-Frame"
aframe_autumn2_mean <- aframe_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
aframe_autumn2_mean$season <- "Autumn"
aframe_autumn2_mean$site <- "A-Frame"

aframe_winter2 <- tidync("OceanParcels/chapter_4_output/aframe_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_winter2$season <- "Winter"
aframe_winter2$site <- "A-Frame"
aframe_winter2_mean <- aframe_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
aframe_winter2_mean$season <- "Winter"
aframe_winter2_mean$site <- "A-Frame"

aframe_spring2 <- tidync("OceanParcels/chapter_4_output/aframe_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_spring2$season <- "Spring"
aframe_spring2$site <- "A-Frame"
aframe_spring2_mean <- aframe_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
aframe_spring2_mean$season <- "Spring"
aframe_spring2_mean$site <- "A-Frame"

sthelena_summer2 <- tidync("OceanParcels/chapter_4_output/helena_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_summer2$season <- "Summer"
sthelena_summer2$site <- "St. Helena Bay"
sthelena_summer2_mean <- sthelena_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
sthelena_summer2_mean$season <- "Summer"
sthelena_summer2_mean$site <- "St. Helena Bay"

sthelena_autumn2 <- tidync("OceanParcels/chapter_4_output/helena_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_autumn2$season <- "Autumn"
sthelena_autumn2$site <- "St. Helena Bay"
sthelena_autumn2_mean <- sthelena_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
sthelena_autumn2_mean$season <- "Autumn"
sthelena_autumn2_mean$site <- "St. Helena Bay"

sthelena_winter2 <- tidync("OceanParcels/chapter_4_output/helena_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_winter2$season <- "Winter"
sthelena_winter2$site <- "St. Helena Bay"
sthelena_winter2_mean <- sthelena_winter2%>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
sthelena_winter2_mean$season <- "Winter"
sthelena_winter2_mean$site <- "St. Helena Bay"

sthelena_spring2 <- tidync("OceanParcels/chapter_4_output/helena_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_spring2$season <- "Spring"
sthelena_spring2$site <- "St. Helena Bay"
sthelena_spring2_mean <- sthelena_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
sthelena_spring2_mean$season <- "Spring"
sthelena_spring2_mean$site <- "St. Helena Bay"

millers_summer2 <- tidync("OceanParcels/chapter_4_output/millers_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_summer2$season <- "Summer"
millers_summer2$site <- "Miller's Point"
millers_summer2_mean <- millers_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
millers_summer2_mean$season <- "Summer"
millers_summer2_mean$site <- "Miller's Point"

millers_autumn2 <- tidync("OceanParcels/chapter_4_output/millers_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_autumn2$season <- "Autumn"
millers_autumn2$site <- "Miller's Point"
millers_autumn2_mean <- millers_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
millers_autumn2_mean$season <- "Autumn"
millers_autumn2_mean$site <- "Miller's Point"

millers_winter2 <- tidync("OceanParcels/chapter_4_output/millers_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_winter2$season <- "Winter"
millers_winter2$site <- "Miller's Point"
millers_winter2_mean <- millers_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
millers_winter2_mean$season <- "Winter"
millers_winter2_mean$site <- "Miller's Point"

millers_spring2 <- tidync("OceanParcels/chapter_4_output/millers_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_spring2$season <- "Spring"
millers_spring2$site <- "Miller's Point"
millers_spring2_mean <- millers_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
millers_spring2_mean$season <- "Spring"
millers_spring2_mean$site <- "Miller's Point"

baboon_summer2 <- tidync("OceanParcels/chapter_4_output/baboon_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_summer2$season <- "Summer"
baboon_summer2$site <- "Baboon Rock"
baboon_summer2_mean <- baboon_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
baboon_summer2_mean$season <- "Summer"
baboon_summer2_mean$site <- "Baboon Rock"

baboon_autumn2 <- tidync("OceanParcels/chapter_4_output/baboon_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_autumn2$season <- "Autumn"
baboon_autumn2$site <- "Baboon Rock"
baboon_autumn2_mean <- baboon_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
baboon_autumn2_mean$season <- "Autumn"
baboon_autumn2_mean$site <- "Baboon Rock"

baboon_winter2 <- tidync("OceanParcels/chapter_4_output/baboon_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_winter2$season <- "Winter"
baboon_winter2$site <- "Baboon Rock"
baboon_winter2_mean <- baboon_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
baboon_winter2_mean$season <- "Winter"
baboon_winter2_mean$site <- "Baboon Rock"

baboon_spring2 <- tidync("OceanParcels/chapter_4_output/baboon_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_spring2$season <- "Spring"
baboon_spring2$site <- "Baboon Rock"
baboon_spring2_mean <- baboon_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
baboon_spring2_mean$season <- "Spring"
baboon_spring2_mean$site <- "Baboon Rock"

basata_summer2 <- tidync("OceanParcels/chapter_4_output/batsata_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
basata_summer2$season <- "Summer"
basata_summer2$site <- "Basata Rock"
basata_summer2_mean <- basata_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
basata_summer2_mean$season <- "Summer"
basata_summer2_mean$site <- "Basata Rock"

basata_autumn2 <- tidync("OceanParcels/chapter_4_output/batsata_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
basata_autumn2$season <- "Autumn"
basata_autumn2$site <- "Basata Rock"
basata_autumn2_mean <- basata_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
basata_autumn2_mean$season <- "Autumn"
basata_autumn2_mean$site <- "Basata Rock"

basata_winter2 <- tidync("OceanParcels/chapter_4_output/batsata_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
basata_winter2$season <- "Winter"
basata_winter2$site <- "Basata Rock"
basata_winter2_mean <- basata_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
basata_winter2_mean$season <- "Winter"
basata_winter2_mean$site <- "Basata Rock"

basata_spring2 <- tidync("OceanParcels/chapter_4_output/batsata_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
basata_spring2$season <- "Spring"
basata_spring2$site <- "Basata Rock"
basata_spring2_mean <- basata_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
basata_spring2_mean$season <- "Spring"
basata_spring2_mean$site <- "Basata Rock"

buffels_summer2 <- tidync("OceanParcels/chapter_4_output/buffels_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_summer2$season <- "Summer"
buffels_summer2$site <- "Buffelsbaai"
buffels_summer2_mean <- buffels_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
buffels_summer2_mean$season <- "Summer"
buffels_summer2_mean$site <- "Buffelsbaai"

buffels_autumn2 <- tidync("OceanParcels/chapter_4_output/buffels_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_autumn2$season <- "Autumn"
buffels_autumn2$site <- "Buffelsbaai"
buffels_autumn2_mean <- buffels_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
buffels_autumn2_mean$season <- "Autumn"
buffels_autumn2_mean$site <- "Buffelsbaai"

buffels_winter2 <- tidync("OceanParcels/chapter_4_output/buffelsbaai_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age,  Phase,KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_winter2$season <- "Winter"
buffels_winter2$site <- "Buffelsbaai"
buffels_winter2_mean <- buffels_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
buffels_winter2_mean$season <- "Winter"
buffels_winter2_mean$site <- "Buffelsbaai"

buffels_spring2 <- tidync("OceanParcels/chapter_4_output/buffelsbaai_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_spring2$season <- "Spring"
buffels_spring2$site <- "Buffelsbaai"
buffels_spring2_mean <- buffels_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
buffels_spring2_mean$season <- "Spring"
buffels_spring2_mean$site <- "Buffelsbaai"

soetwater_summer2 <- tidync("OceanParcels/chapter_4_output/soetwater_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_summer2$season <- "Summer"
soetwater_summer2$site <- "Soetwater"
soetwater_summer2_mean <- soetwater_summer2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_summer2_mean$season <- "Summer"
soetwater_summer2_mean$site <- "Soetwater"

soetwater_autumn2 <- tidync("OceanParcels/chapter_4_output/soetwater_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_autumn2$season <- "Autumn"
soetwater_autumn2$site <- "Soetwater"
soetwater_autumn2_mean <- soetwater_autumn2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_autumn2_mean$season <- "Autumn"
soetwater_autumn2_mean$site <- "Soetwater"

soetwater_winter2 <- tidync("OceanParcels/chapter_4_output/soetwater_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_winter2$season <- "Winter"
soetwater_winter2$site <- "Soetwater"
soetwater_winter2_mean <- soetwater_winter2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_winter2_mean$season <- "Winter"
soetwater_winter2_mean$site <- "Soetwater"

soetwater_spring2 <- tidync("OceanParcels/chapter_4_output/soetwater_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed,       KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_spring2$season <- "Spring"
soetwater_spring2$site <- "Soetwater"
soetwater_spring2_mean <- soetwater_spring2 %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:bathy, mean, na.rm= TRUE))
soetwater_spring2_mean$season <- "Spring"
soetwater_spring2_mean$site <- "Soetwater"

# Summer2

total_summer2 <- rbind(kom_summer2, houtbay_summer2, scar_summer2, oude_summer2, betty_summer2, kalk_summer2, aframe_summer2, millers_summer2, sthelena_summer2, baboon_summer2, basata_summer2, buffels_summer2, soetwater_summer2)
total_summer2$age <- with(total_summer2, age/3600)
total_summer2_mean <- rbind(kom_summer2_mean, houtbay_summer2_mean, scar_summer2_mean, oude_summer2_mean, betty_summer2_mean, kalk_summer2_mean, aframe_summer2_mean, sthelena_summer2_mean, millers_summer2_mean, baboon_summer2_mean, basata_summer2_mean, buffels_summer2_mean, soetwater_summer2_mean)

write.csv(total_summer2, "OceanParcels/df_total_summer2.csv", row.names = TRUE)
write.csv(total_summer2_mean, "OceanParcels/df_total_summer2_mean.csv", row.names = TRUE)

# Autumn2

total_autumn2 <- rbind(kom_autumn2, houtbay_autumn2, scar_autumn2, oude_autumn2, betty_autumn2, kalk_autumn2, aframe_autumn2, millers_autumn2, sthelena_autumn2, baboon_autumn2, basata_autumn2, buffels_autumn2, soetwater_autumn2)
total_autumn2$age <- with(total_autumn2, age/3600)
total_autumn2_mean <- rbind(kom_autumn2_mean, houtbay_autumn2_mean, scar_autumn2_mean, oude_autumn2_mean, betty_autumn2_mean, kalk_autumn2_mean, aframe_autumn2_mean, sthelena_autumn2_mean, millers_autumn2_mean, baboon_autumn2_mean, basata_autumn2_mean, buffels_autumn2_mean, soetwater_autumn2_mean)

write.csv(total_autumn2, "OceanParcels/df_total_autumn2.csv", row.names = TRUE)
write.csv(total_autumn2_mean, "OceanParcels/df_total_autumn2_mean.csv", row.names = TRUE)

# Winter2

total_winter2 <- rbind(kom_winter2, houtbay_winter2, scar_winter2, oude_winter2, betty_winter2, kalk_winter2, aframe_winter2, millers_winter2, sthelena_winter2, baboon_winter2, basata_winter2, buffels_winter2, soetwater_winter2)
total_winter2$age <- with(total_winter2, age/3600)
total_winter2_mean <- rbind(kom_winter2_mean, houtbay_winter2_mean, scar_winter2_mean, oude_winter2_mean, betty_winter2_mean, kalk_winter2_mean, aframe_winter2_mean, sthelena_winter2_mean, millers_winter2_mean, baboon_winter2_mean, basata_winter2_mean, buffels_winter2_mean, soetwater_winter2_mean)

write.csv(total_winter2, "OceanParcels/df_total_winter2.csv", row.names = TRUE)
write.csv(total_winter2_mean, "OceanParcels/df_total_winter2_mean.csv", row.names = TRUE)

# Spring2

total_spring2 <- rbind(kom_spring2, houtbay_spring2, scar_spring2, oude_spring2, betty_spring2, kalk_spring2, aframe_spring2, millers_spring2, sthelena_spring2, baboon_spring2, basata_spring2, buffels_spring2, soetwater_spring2)
total_spring2$age <- with(total_spring2, age/3600)
total_spring2_mean <- rbind(kom_spring2_mean, houtbay_spring2_mean, scar_spring2_mean, oude_spring2_mean, betty_spring2_mean, kalk_spring2_mean, aframe_spring2_mean, sthelena_spring2_mean, millers_spring2_mean, baboon_spring2_mean, basata_spring2_mean, buffels_spring2_mean, soetwater_spring2_mean)

write.csv(total_spring2, "OceanParcels/df_total_spring2.csv", row.names = TRUE)
write.csv(total_spring2_mean, "OceanParcels/df_total_spring2_mean.csv", row.names = TRUE)

#--- eddy experiments data wrangle

aframe_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_aframe.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
aframe_eddy$site <- "A-Frame"

batsata_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_batsata.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
batsata_eddy$site <- "Batsata Rock"

baboon_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_baboon.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
baboon_eddy$site <- "Baboon Rock"

betty_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_betty.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
betty_eddy$site <- "Betty's Bay"

buffels_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_buffelsbaai.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
buffels_eddy$site <- "Buffelsbaai"

houtbay_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_houtbay.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
houtbay_eddy$site <- "Hout Bay"

kalk_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_kalk.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kalk_eddy$site <- "Kalk Bay"

kom_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_kom.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
kom_eddy$site <- "Kommetjie"

millers_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_millers.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
millers_eddy$site <- "Miller's Point"

oudekraal_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_oudekraal.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
oudekraal_eddy$site <- "Oudekraal"

scar_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_scar.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
scar_eddy$site <- "Scarborough"

soetwater_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_soetwater.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
soetwater_eddy$site <- "Soetwater"

sthelena_eddy <- tidync("OceanParcels/chapter_4_output/eddy_experiment_sthelena.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
sthelena_eddy$site <- "St. Helena Bay"


total_kelp_eddy <- rbind(aframe_eddy, batsata_eddy, baboon_eddy, betty_eddy, buffels_eddy, houtbay_eddy, kalk_eddy, millers_eddy, oudekraal_eddy, kom_eddy, scar_eddy, soetwater_eddy, sthelena_eddy)
total_kelp_eddy$age <- with(total_kelp_eddy, age/3600)

write.csv(total_kelp_eddy, "OceanParcels/df_total_kelp_eddy.csv", row.names = TRUE)

#--- passive experiments

passive_summer <- tidync("OceanParcels/chapter_4_output/passive_summer1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_summer$Season <- "Summer"
passive_summer$Year <- "1"

passive_summer2 <- tidync("OceanParcels/chapter_4_output/passive_summer2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_summer2$Season <- "Summer"
passive_summer2$Year <- "2"

passive_autumn <- tidync("OceanParcels/chapter_4_output/passive_autumn1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_autumn$Season <- "Autumn"
passive_autumn$Year <- "1"

passive_autumn2 <- tidync("OceanParcels/chapter_4_output/passive_autumn2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_autumn2$Season <- "Autumn"
passive_autumn2$Year <- "2"

passive_winter <- tidync("OceanParcels/chapter_4_output/passive_winter1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_winter$Season <- "Winter"
passive_winter$Year <- "1"

passive_winter2 <- tidync("OceanParcels/chapter_4_output/passive_winter2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_winter2$Season <- "Winter"
passive_winter2$Year <- "2"

passive_spring <- tidync("OceanParcels/chapter_4_output/passive_spring1.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_spring$Season <- "Spring"
passive_spring$Year <- "1"

passive_spring2 <- tidync("OceanParcels/chapter_4_output/passive_spring2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, Salinity, age, Phase, KelpDepth, SinkSpeed, VelU, VelV, WindU, WindV, bathy) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_spring2$Season <- "Spring"
passive_spring2$Year <- "2"

total_passive_year1 <- rbind(passive_summer, passive_autumn, passive_winter, passive_spring)
total_passive_year1$age <- with(total_passive_year1, age/3600)

total_passive_year2 <- rbind(passive_summer2, passive_autumn2, passive_winter2, passive_spring2)
total_passive_year2$age <- with(total_passive_year2, age/3600)

write.csv(total_passive_year1, "OceanParcels/df_total_passive_year1.csv", row.names = TRUE)
write.csv(total_passive_year2, "OceanParcels/df_total_passive_year2.csv", row.names = TRUE)
