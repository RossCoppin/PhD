##-- New passive simulations
# Passive with Ocean currents only

passive_summer_curr <- tidync("OceanParcels/chapter_3_output/passive_summer_curr.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_summer_curr_mean <- passive_summer_curr %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_summer_curr$type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_summer_curr$velocity <- with(passive_summer_curr, sqrt(velU^2 + velV^2))
passive_summer_curr_mean$type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_autumn_curr <- tidync("OceanParcels/chapter_3_output/passive_autumn_curr.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_autumn_curr_mean <- passive_autumn_curr %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_autumn_curr$type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_autumn_curr$velocity <- with(passive_autumn_curr, sqrt(velU^2 + velV^2))
passive_autumn_curr_mean$type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_winter_curr <- tidync("OceanParcels/chapter_3_output/passive_winter_curr.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_winter_curr_mean <- passive_winter_curr %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_winter_curr$type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_winter_curr$velocity <- with(passive_winter_curr, sqrt(velU^2 + velV^2))
passive_winter_curr_mean$type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_spring_curr <- tidync("OceanParcels/chapter_3_output/passive_spring_curr.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_spring_curr_mean <- passive_spring_curr %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_spring_curr$type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_spring_curr$velocity <- with(passive_spring_curr, sqrt(velU^2 + velV^2))
passive_spring_curr_mean$type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label

# Passive with Ocean currents and Stokes

passive_summer_currstks <- tidync("OceanParcels/chapter_3_output/passive_summer_currstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_summer_currstks_mean <- passive_summer_currstks %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_summer_currstks$type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_summer_currstks$velocity <- with(passive_summer_currstks, sqrt(velU^2 + velV^2))
passive_summer_currstks_mean$type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_autumn_currstks <- tidync("OceanParcels/chapter_3_output/passive_autumn_currstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_autumn_currstks_mean <- passive_autumn_currstks %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_autumn_currstks$type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_autumn_currstks$velocity <- with(passive_autumn_currstks, sqrt(velU^2 + velV^2))
passive_autumn_currstks_mean$type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_winter_currstks <- tidync("OceanParcels/chapter_3_output/passive_winter_currstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_winter_currstks_mean <- passive_winter_currstks %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_winter_currstks$type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_winter_currstks$velocity <- with(passive_winter_currstks, sqrt(velU^2 + velV^2))
passive_winter_currstks_mean$type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_spring_currstks <- tidync("OceanParcels/chapter_3_output/passive_spring_currstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_spring_currstks_mean <- passive_spring_currstks %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_spring_currstks$type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_spring_currstks$velocity <- with(passive_spring_currstks, sqrt(velU^2 + velV^2))
passive_spring_currstks_mean$type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

# Passive with Ocean currents and wind

passive_summer_currwind <- tidync("OceanParcels/chapter_3_output/passive_summer_currwind.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_summer_currwind_mean <- passive_summer_currwind %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_summer_currwind$type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_summer_currwind$velocity <- with(passive_summer_currwind, sqrt(velU^2 + velV^2))
passive_summer_currwind_mean$type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_autumn_currwind <- tidync("OceanParcels/chapter_3_output/passive_autumn_currwind.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_autumn_currwind_mean <- passive_autumn_currwind %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_autumn_currwind$type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_autumn_currwind$velocity <- with(passive_autumn_currwind, sqrt(velU^2 + velV^2))
passive_autumn_currwind_mean$type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_winter_currwind <- tidync("OceanParcels/chapter_3_output/passive_winter_currwind.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_winter_currwind_mean <- passive_winter_currwind %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_winter_currwind$type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_winter_currwind$velocity <- with(passive_winter_currwind, sqrt(velU^2 + velV^2))
passive_winter_currwind_mean$type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_spring_currwind <- tidync("OceanParcels/chapter_3_output/passive_spring_currwind.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_spring_currwind_mean <- passive_spring_currwind %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_spring_currwind$type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_spring_currwind$velocity <- with(passive_spring_currwind, sqrt(velU^2 + velV^2))
passive_spring_currwind_mean$type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label

# Passive with Ocean currents, Stokes, and wind

passive_summer_currentswindstks <- tidync("OceanParcels/chapter_3_output/passive_summer_currwindstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_summer_currentswindstks_mean <- passive_summer_currentswindstks %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_summer_currentswindstks$type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_summer_currentswindstks$velocity <- with(passive_summer_currentswindstks, sqrt(velU^2 + velV^2))
passive_summer_currentswindstks_mean$type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_autumn_currentswindstks <- tidync("OceanParcels/chapter_3_output/passive_autumn_currwindstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_autumn_currentswindstks_mean <- passive_autumn_currentswindstks %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_autumn_currentswindstks$type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_autumn_currentswindstks$velocity <- with(passive_autumn_currentswindstks, sqrt(velU^2 + velV^2))
passive_autumn_currentswindstks_mean$type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_winter_currentswindstks <- tidync("OceanParcels/chapter_3_output/passive_winter_currwindstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_winter_currentswindstks_mean <- passive_winter_currentswindstks %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_winter_currentswindstks$type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_winter_currentswindstks$velocity <- with(passive_winter_currentswindstks, sqrt(velU^2 + velV^2))
passive_winter_currentswindstks_mean$type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

passive_spring_currentswindstks <- tidync("OceanParcels/chapter_3_output/passive_spring_currwindstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(trajectory, lon, lat, time, distance, age) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2017-12-01 00:00:00"))
passive_spring_currentswindstks_mean <- passive_spring_currentswindstks %>% # calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

passive_spring_currentswindstks$type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
#passive_spring_currentswindstks$velocity <- with(passive_spring_currentswindstks, sqrt(velU^2 + velV^2))
passive_spring_currentswindstks_mean$type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

total_passive_summer <- rbind(passive_summer_curr, passive_summer_currstks, passive_summer_currwind, passive_summer_currentswindstks)
write.csv(total_passive_summer, "data/chapter_3/total_passive_summer.csv", row.names = TRUE)

total_passive_autumn <- rbind(passive_autumn_curr, passive_autumn_currstks, passive_autumn_currwind, passive_autumn_currentswindstks)
write.csv(total_passive_autumn, "data/chapter_3/total_passive_autumn.csv", row.names = TRUE)

total_passive_winter <- rbind(passive_winter_curr, passive_winter_currstks, passive_winter_currwind, passive_winter_currentswindstks)
write.csv(total_passive_winter, "data/chapter_3/total_passive_winter.csv", row.names = TRUE)

total_passive_spring <- rbind(passive_spring_curr, passive_spring_currstks, passive_spring_currwind, passive_spring_currentswindstks)
write.csv(total_passive_spring, "data/chapter_3/total_passive_spring.csv", row.names = TRUE)

# Kelp simulations

kelp_hydro_summer <- tidync("OceanParcels/chapter_3_output/kelp_hydro_summer.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydro_summer_mean <- kelp_hydro_summer %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydro_summer$type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydro_summer$velocity <- with(kelp_hydro_summer, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydro_summer_mean$type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrostks_summer<- tidync("OceanParcels/chapter_3_output/kelp_hydrostksdrag_summer.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrostks_summer_mean <- kelp_hydrostks_summer %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrostks_summer$type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrostks_summer$velocity <- with(kelp_hydrostks_summer, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrostks_summer_mean$type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrowind_summer<- tidync("OceanParcels/chapter_3_output/kelp_hydrowinddrag_summerV2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrowind_summer_mean <- kelp_hydrowind_summer %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrowind_summer$type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrowind_summer$velocity <- with(kelp_hydrowind_summer, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrowind_summer_mean$type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrowindstks_summer <- tidync("OceanParcels/chapter_3_output/kelp_hydrowindstksdrag_summerV2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrowindstks_summer_mean <- kelp_hydrowindstks_summer %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrowindstks_summer$type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrowindstks_summer$velocity <- with(kelp_hydrowindstks_summer, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrowindstks_summer_mean$type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

total_summer <- rbind(kelp_hydro_summer, kelp_hydrostks_summer, kelp_hydrowind_summer, kelp_hydrowindstks_summer)
write.csv(total_summer, "data/chapter_3/total_summerV2.csv", row.names = TRUE)

total_summer_mean <- rbind(kelp_hydro_summer_mean, kelp_hydrostks_summer_mean, kelp_hydrowind_summer_mean, kelp_hydrowindstks_summer_mean)
write.csv(total_summer_mean, "data/chapter_3/total_summer_meanV2.csv", row.names = TRUE)

## Autumn

kelp_hydro_autumn <- tidync("OceanParcels/chapter_3_output/kelp_hydro_autumn.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydro_autumn_mean <- kelp_hydro_autumn %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydro_autumn$type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydro_autumn$velocity <- with(kelp_hydro_autumn, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydro_autumn_mean$type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrostks_autumn<- tidync("OceanParcels/chapter_3_output/kelp_hydrostksdrag_autumn.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrostks_autumn_mean <- kelp_hydrostks_autumn %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrostks_autumn$type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrostks_autumn$velocity <- with(kelp_hydrostks_autumn, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrostks_autumn_mean$type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrowind_autumn<- tidync("OceanParcels/chapter_3_output/kelp_hydrowinddrag_autumnV2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrowind_autumn_mean <- kelp_hydrowind_autumn %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrowind_autumn$type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrowind_autumn$velocity <- with(kelp_hydrowind_autumn, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrowind_autumn_mean$type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrowindstks_autumn <- tidync("OceanParcels/chapter_3_output/kelp_hydrowindstksdrag_autumnV2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrowindstks_autumn_mean <- kelp_hydrowindstks_autumn %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrowindstks_autumn$type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrowindstks_autumn$velocity <- with(kelp_hydrowindstks_autumn, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrowindstks_autumn_mean$type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

total_autumn <- rbind(kelp_hydro_autumn, kelp_hydrostks_autumn, kelp_hydrowind_autumn, kelp_hydrowindstks_autumn)
write.csv(total_autumn, "data/chapter_3/total_autumnV2.csv", row.names = TRUE)

total_autumn_mean <- rbind(kelp_hydro_autumn_mean, kelp_hydrostks_autumn_mean, kelp_hydrowind_autumn_mean, kelp_hydrowindstks_autumn_mean)
write.csv(total_autumn_mean, "data/chapter_3/total_autumn_meanV2.csv", row.names = TRUE)

## Winter

kelp_hydro_winter <- tidync("OceanParcels/chapter_3_output/kelp_hydro_winter.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydro_winter_mean <- kelp_hydro_winter %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydro_winter$type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydro_winter$velocity <- with(kelp_hydro_winter, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydro_winter_mean$type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrostks_winter<- tidync("OceanParcels/chapter_3_output/kelp_hydrostksdrag_winter.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrostks_winter_mean <- kelp_hydrostks_winter %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrostks_winter$type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrostks_winter$velocity <- with(kelp_hydrostks_winter, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrostks_winter_mean$type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrowind_winter<- tidync("OceanParcels/chapter_3_output/kelp_hydrowinddrag_winterV2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrowind_winter_mean <- kelp_hydrowind_winter %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrowind_winter$type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrowind_winter$velocity <- with(kelp_hydrowind_winter, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrowind_winter_mean$type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrowindstks_winter <- tidync("OceanParcels/chapter_3_output/kelp_hydrowindstksdrag_winterV2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrowindstks_winter_mean <- kelp_hydrowindstks_winter %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrowindstks_winter$type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrowindstks_winter$velocity <- with(kelp_hydrowindstks_winter, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrowindstks_winter_mean$type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

total_winter <- rbind(kelp_hydro_winter, kelp_hydrostks_winter, kelp_hydrowind_winter, kelp_hydrowindstks_winter)
write.csv(total_winter, "data/chapter_3/total_winterV2.csv", row.names = TRUE)

total_winter_mean <- rbind(kelp_hydro_winter_mean, kelp_hydrostks_winter_mean, kelp_hydrowind_winter_mean, kelp_hydrowindstks_winter_mean)
write.csv(total_winter_mean, "data/chapter_3/total_winter_meanV2.csv", row.names = TRUE)

## Spring

kelp_hydro_spring <- tidync("OceanParcels/chapter_3_output/kelp_hydro_spring.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydro_spring_mean <- kelp_hydro_spring %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydro_spring$type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydro_spring$velocity <- with(kelp_hydro_spring, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydro_spring_mean$type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrostks_spring<- tidync("OceanParcels/chapter_3_output/kelp_hydrostksdrag_spring.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrostks_spring_mean <- kelp_hydrostks_spring %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrostks_spring$type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrostks_spring$velocity <- with(kelp_hydrostks_spring, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrostks_spring_mean$type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrowind_spring<- tidync("OceanParcels/chapter_3_output/kelp_hydrowinddrag_springV2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrowind_spring_mean <- kelp_hydrowind_spring %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrowind_spring$type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrowind_spring$velocity <- with(kelp_hydrowind_spring, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrowind_spring_mean$type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label

kelp_hydrowindstks_spring<- tidync("OceanParcels/chapter_3_output/kelp_hydrowindstksdrag_springV2.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
kelp_hydrowindstks_spring_mean <- kelp_hydrowindstks_spring %>% #calculate mean trajectory
  group_by(t) %>%
  summarise(across(lon:lat, mean, na.rm= TRUE))

kelp_hydrowindstks_spring$type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
kelp_hydrowindstks_spring$velocity <- with(kelp_hydrowindstks_spring, sqrt(KelpVelU^2 + KelpVelV^2))
kelp_hydrowindstks_spring_mean$type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label

total_spring <- rbind(kelp_hydro_spring, kelp_hydrostks_spring, kelp_hydrowind_spring, kelp_hydrowindstks_spring)
write.csv(total_spring, "data/chapter_3/total_springV2.csv", row.names = TRUE)

total_spring_mean <- rbind(kelp_hydro_spring_mean, kelp_hydrostks_spring_mean, kelp_hydrowind_spring_mean, kelp_hydrowindstks_spring_mean)
write.csv(total_spring_mean, "data/chapter_3/total_spring_meanV2.csv", row.names = TRUE)

##--- Total for passive particles
#
#total_passive <- rbind(passive_summer, passive_autumn, passive_winter, passive_spring)
#write.csv(total_passive, "data/chapter_3/total_passive.csv", row.names = TRUE)
#total_passive_mean <- rbind(passive_summer_mean, passive_autumn_mean, passive_winter_mean, passive_spring_mean)
#write.csv(total_passive_mean, "data/chapter_3/total_passive_mean.csv", row.names = TRUE)

##--- Experiment 2 ---##

## Hydrodynamic

eddy_kelp_hydro_summer <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydro_summer.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydro_summer$Type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydro_summer$Season <- "Summer" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydro_autumn <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydro_autumn.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydro_autumn$Type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydro_autumn$Season <- "Autumn" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydro_winter <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydro_winter.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydro_winter$Type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydro_winter$Season <- "Winter" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydro_spring <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydro_spring.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydro_spring$Type <- "Hydro" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydro_spring$Season <- "Spring" # add extra column 'season' to dataframe and assigned 'kelp' label

total_eddy_hydro <- rbind(eddy_kelp_hydro_summer, eddy_kelp_hydro_autumn, eddy_kelp_hydro_winter, eddy_kelp_hydro_spring)
write.csv(total_eddy_hydro, "data/chapter_3/total_eddy_hydro.csv", row.names = TRUE)


## Hydro and Stokes

eddy_kelp_hydrostksdrag_summer <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrostksdrag_summer.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrostksdrag_summer$Type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrostksdrag_summer$Season <- "Summer" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrostksdrag_autumn <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrostksdrag_autumn.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrostksdrag_autumn$Type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrostksdrag_autumn$Season <- "Autumn" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrostksdrag_winter <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrostksdrag_winter.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrostksdrag_winter$Type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrostksdrag_winter$Season <- "Winter" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrostksdrag_spring <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrostksdrag_spring.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrostksdrag_spring$Type <- "Hydro and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrostksdrag_spring$Season <- "Spring" # add extra column 'season' to dataframe and assigned 'kelp' label

total_eddy_kelp_hydrostksdrag <- rbind(eddy_kelp_hydrostksdrag_summer, eddy_kelp_hydrostksdrag_autumn, eddy_kelp_hydrostksdrag_winter, eddy_kelp_hydrostksdrag_spring)
write.csv(total_eddy_kelp_hydrostksdrag, "data/chapter_3/total_eddy_kelp_hydrostksdrag.csv", row.names = TRUE)

## Hydro and Wind

eddy_kelp_hydrowinddrag_summer <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrowinddrag_summer.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrowinddrag_summer$Type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrowinddrag_summer$Season <- "Summer" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrowinddrag_autumn <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrowinddrag_autumn.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrowinddrag_autumn$Type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrowinddrag_autumn$Season <- "Autumn" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrowinddrag_winter <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrowinddrag_winter.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrowinddrag_winter$Type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrowinddrag_winter$Season <- "Winter" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrowinddrag_spring <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrowinddrag_spring.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrowinddrag_spring$Type <- "Hydro and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrowinddrag_spring$Season <- "Spring" # add extra column 'season' to dataframe and assigned 'kelp' label

total_eddy_hydrowinddrag <- rbind(eddy_kelp_hydrowinddrag_summer, eddy_kelp_hydrowinddrag_autumn, eddy_kelp_hydrowinddrag_winter, eddy_kelp_hydrowinddrag_spring)
write.csv(total_eddy_hydrowinddrag, "data/chapter_3/total_eddy_hydrowinddrag.csv", row.names = TRUE)

## Hydro, Wind, and Stokes

eddy_kelp_hydrowindstksdrag_summer <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrowindstksdrag_summer.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrowindstksdrag_summer$Type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrowindstksdrag_summer$Season <- "Summer" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrowindstksdrag_autumn <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrowindstksdrag_autumn.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrowindstksdrag_autumn$Type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrowindstksdrag_autumn$Season <- "Autumn" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrowindstksdrag_winter <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrowindstksdrag_winter.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrowindstksdrag_winter$Type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrowindstksdrag_winter$Season <- "Winter" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_kelp_hydrowindstksdrag_spring <- tidync("OceanParcels/chapter_3_output/exp2_kelp_hydrowindstksdrag_spring.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_kelp_hydrowindstksdrag_spring$Type <- "Hydro, Wind, and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_kelp_hydrowindstksdrag_spring$Season <- "Spring" # add extra column 'season' to dataframe and assigned 'kelp' label

total_eddy_hydrowindstksdrag <- rbind(eddy_kelp_hydrowindstksdrag_summer, eddy_kelp_hydrowindstksdrag_autumn, eddy_kelp_hydrowindstksdrag_winter, eddy_kelp_hydrowindstksdrag_spring)
write.csv(total_eddy_hydrowindstksdrag, "data/chapter_3/total_eddy_hydrowindstksdrag.csv", row.names = TRUE)

## Passive
# Currents

eddy_passive_summer_curr <- tidync("OceanParcels/chapter_3_output/exp2_passive_summer_curr.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_summer_curr$Type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_summer_curr$Season <- "Summer" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_autumn_curr <- tidync("OceanParcels/chapter_3_output/exp2_passive_autumn_curr.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_autumn_curr$Type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_autumn_curr$Season <- "Autumn" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_winter_curr <- tidync("OceanParcels/chapter_3_output/exp2_passive_winter_curr.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_winter_curr$Type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_winter_curr$Season <- "Winter" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_spring_curr <- tidync("OceanParcels/chapter_3_output/exp2_passive_spring_curr.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_spring_curr$Type <- "Currents" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_spring_curr$Season <- "Spring" # add extra column 'season' to dataframe and assigned 'kelp' label

total_eddy_passive_curr <- rbind(eddy_passive_summer_curr, eddy_passive_autumn_curr, eddy_passive_winter_curr, eddy_passive_spring_curr)
write.csv(total_eddy_passive_curr, "data/chapter_3/total_eddy_passive_curr.csv", row.names = TRUE)


# Currents and Wind

eddy_passive_summer_currwind <- tidync("OceanParcels/chapter_3_output/exp2_passive_summer_currwind.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_summer_currwind$Type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_summer_currwind$Season <- "Summer" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_autumn_currwind <- tidync("OceanParcels/chapter_3_output/exp2_passive_autumn_currwind.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_autumn_currwind$Type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_autumn_currwind$Season <- "Autumn" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_winter_currwind <- tidync("OceanParcels/chapter_3_output/exp2_passive_winter_currwind.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_winter_currwind$Type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_winter_currwind$Season <- "Winter" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_spring_currwind <- tidync("OceanParcels/chapter_3_output/exp2_passive_spring_currwind.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_spring_currwind$Type <- "Currents and Wind" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_spring_currwind$Season <- "Spring" # add extra column 'season' to dataframe and assigned 'kelp' label

total_eddy_passive_currwind <- rbind(eddy_passive_summer_currwind, eddy_passive_autumn_currwind, eddy_passive_winter_currwind, eddy_passive_spring_currwind)
write.csv(total_eddy_passive_currwind, "data/chapter_3/total_eddy_passive_currwind.csv", row.names = TRUE)

# Currents and Stokes

eddy_passive_summer_currstks <- tidync("OceanParcels/chapter_3_output/exp2_passive_summer_currstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_summer_currstks$Type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_summer_currstks$Season <- "Summer" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_autumn_currstks <- tidync("OceanParcels/chapter_3_output/exp2_passive_autumn_currstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_autumn_currstks$Type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_autumn_currstks$Season <- "Autumn" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_winter_currstks <- tidync("OceanParcels/chapter_3_output/exp2_passive_winter_currstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_winter_currstks$Type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_winter_currstks$Season <- "Winter" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_spring_currstks <- tidync("OceanParcels/chapter_3_output/exp2_passive_spring_currstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_spring_currstks$Type <- "Currents and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_spring_currstks$Season <- "Spring" # add extra column 'season' to dataframe and assigned 'kelp' label

total_eddy_passive_currstks <- rbind(eddy_passive_summer_currstks, eddy_passive_autumn_currstks, eddy_passive_winter_currstks, eddy_passive_spring_currstks)
write.csv(total_eddy_passive_currstks, "data/chapter_3/total_eddy_passive_currstks.csv", row.names = TRUE)

## Currents, Stokes, and Wind

eddy_passive_summer_currwindstks <- tidync("OceanParcels/chapter_3_output/exp2_passive_summer_currwindstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_summer_currwindstks$Type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_summer_currwindstks$Season <- "Summer" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_autumn_currwindstks <- tidync("OceanParcels/chapter_3_output/exp2_passive_autumn_currwindstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_autumn_currwindstks$Type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_autumn_currwindstks$Season <- "Autumn" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_winter_currwindstks <- tidync("OceanParcels/chapter_3_output/exp2_passive_winter_currwindstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_winter_currwindstks$Type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_winter_currwindstks$Season <- "Winter" # add extra column 'season' to dataframe and assigned 'kelp' label

eddy_passive_spring_currwindstks <- tidync("OceanParcels/chapter_3_output/exp2_passive_spring_currwindstks.nc") %>%
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))
eddy_passive_spring_currwindstks$Type <- "Currents, Wind and Stokes" # add extra column 'type' to dataframe and assigned 'kelp' label
eddy_passive_spring_currwindstks$Season <- "Spring" # add extra column 'season' to dataframe and assigned 'kelp' label

total_eddy_passive_currwindstks <- rbind(eddy_passive_summer_currwindstks, eddy_passive_autumn_currwindstks, eddy_passive_winter_currwindstks, eddy_passive_spring_currwindstks)
write.csv(total_eddy_passive_currwindstks, "data/chapter_3/total_eddy_passive_currwindstks.csv", row.names = TRUE)

###--- Senseitivity Tests

kelp_hydro_A <- tidync("OceanParcels/chapter_3_output/kelp_hydro_testA.nc") %>% #1hr
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))

kelp_hydro_B <- tidync("OceanParcels/chapter_3_output/kelp_hydro_testB.nc") %>% #3hr
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))

kelp_hydro_C <- tidync("OceanParcels/chapter_3_output/kelp_hydro_testC.nc") %>% #6hr
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))

kelp_hydro_D <- tidync("OceanParcels/chapter_3_output/kelp_hydro_testD.nc") %>% #12hr
  hyper_tibble() %>%
  dplyr::select(time, trajectory, lon, lat, distance, age, Phase, KelpVelU, KelpVelV, VelU, VelV, WindU, WindV, waterdragU, waterdragV) %>%
  dplyr::rename(t = time) %>%
  mutate(t = as.POSIXct(t, origin = "2018-01-01 00:00:00"))

heatmap_1hr <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  geom_hex(data = kelp_hydro_A, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  scale_fill_continuous(type = "viridis")  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("1 Hr release") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

heatmap_3hr <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  geom_hex(data = kelp_hydro_B, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  scale_fill_continuous(type = "viridis")  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("3 Hr release") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

heatmap_6hr <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  geom_hex(data = kelp_hydro_C, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  scale_fill_continuous(type = "viridis")  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("6 Hr release") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

heatmap_12hr <- ggplot() +
  #geom_bin2d(data = p_EE, bins = 80, aes(x = lon, y = lat)) +
  geom_contour(data = sa_bathy, aes(x = lon, y = lat, z = depth), colour = "grey", size = 0.2) +
  geom_hex(data = kelp_hydro_D, bins = 80, aes(x = lon, y = lat), legend = TRUE) +
  scale_fill_continuous(type = "viridis")  +
  geom_polygon(data = south_africa_coast_hi_res, aes(x = lon, y = lat, group = PID),
               size = 0.4, colour = "black", fill = "gray") +
  #geom_path(data = Min_Kfloat_H100_W00_mean,aes(x = lon, y = lat, color = 'red'), show.legend = FALSE) +
  coord_cartesian(xlim = c(14, 20), ylim = c(-35, -30)) +
  labs(x = expression(Longitude*degree*S)) +
  labs(y = expression(Latitude*degree*E)) +
  ggtitle("12 Hr release") +
  guides(fill=guide_legend(title="Number of particles")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12))

