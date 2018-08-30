############################################################################
### "func/load.model.R"
## This script calculates R2 values between all in situ and modelled sites
# 1. Load all libraries and functions used in this script
# 2. Create csv definition for model data
# 3. Create a load function
############################################################################


# 1. Load all libraries and functions used in this script  ----------------

# library(doMC); doMC::registerDoMC(4)
library(tidyverse)
library(lubridate)


# 2. Create csv definition for model data ---------------------------------

read.model <-function(file_dir){

  # Determine site names
  site_type <- sapply(strsplit(as.character(file_dir), "/"), "[[", 3)
  site_num <- sapply(strsplit(as.character(file_dir), "/"), "[[", 4)
  site_num <- sapply(strsplit(site_num, ".txt"), "[[", 1)
  site_name <- paste(site_type, site_num, sep = "")

  # Load and process site data
  df <- read.csv(file_dir, col.names = c("date", "hs", "tp", "dir", "dirw", "spw"), sep = "", header = F) %>%
    mutate(date = as.POSIXct(as.character(date), "%Y%m%d%H%M", tz = "Africa/Johannesburg")) %>%
    mutate(site = site_name) %>%
    select(site, everything())

  # Finish
  return(df)
}


# 3. Create a load function -----------------------------------------------

load.model <- function(directory){
  files_list <- dir(directory, full.names = TRUE)
  dat <- plyr::ldply(files_list, read.model, .progress = "text")
  return(dat)
}

