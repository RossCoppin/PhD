source("pipe/SACTN_products_v4.2.R")

# Central meeting point for product creation.
# The rest of the pipe is back end to this
# Source the scripts used for the SACTN pipe


################################################################################
# List sources with new data added
sources <- c("DAFF", "DEA", "EKZNW", "KZNSB", "SAEON", "SAWS", "UWC")

# Proto
## NB: Compile and save the proto data with the following line of code
  ## Then create whichever other products below you would like
  ## You must include at least one source or this won't run
  ## Note that these data are not clean or QAd
system.time(SACTN_proto_v4.2 <- proto_data(sources)) # 43 seconds
## Or just load the pre-existing proto data without updating them
SACTN_proto_v4.2 <- load_proto()
##

# Site list (meta-data)
system.time(site_data()) # 26 seconds

# Hourly
  # This is slow because it is averaging millions of rows
system.time(hourly_data()) # 132 seconds

# Daily
system.time(daily_data()) # 30 seconds

# Monthly
system.time(monthly_data()) # 27 seconds

# Yearly
system.time(yearly_data()) # 27 seconds

# Climatology
system.time(clim_data()) # 7 seconds


################################################################################
## Run "shiny/SACTN/app.R" to push the new data to the web
## One may also use the code within the shiny app to load and save the files correctly


################################################################################
## Then run the following line to regenerate all of the meta-data and figures for the 
## data from the chosen contributors.
## It is good practice to e-mail any of the sources with the updated reports for which
## data they have with us as soon as possible after they submit it.
source("request_data/contributor_meta_data.R")
system.time(contributor_meta(sources)) # 37 seconds


################################################################################
## Open the SACTN project and run 'startup.R' to populate the new data in the public access directory
## Remember to push that project to GitHub to update the public access data


################################################################################
## Extract specific time series as desired
## Still needs work...
