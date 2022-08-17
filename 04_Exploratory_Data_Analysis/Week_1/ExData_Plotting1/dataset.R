# libraries
library(tidyverse)
library(data.table)
library(lubridate)

# data download
if(!dir.exists('dataset.zip')){
    url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(url = url, destfile = 'dataset.zip')
}

# unzip data set
if(file.exists('dataset.zip')){
    unzip(zipfile = 'dataset.zip', exdir = getwd())
}

# data reading
consumption_df <- fread(file = 'household_power_consumption.txt')[Date %in% c('1/2/2007','2/2/2007')]

# data cleaning
consumption_df <- consumption_df %>% 
    unite(data = ., col = date, Date, Time, sep = ' ', na.rm = T) %>% 
    mutate(date = dmy_hms(date),
           across(Global_active_power:Sub_metering_3, .fns = as.numeric)
    )
