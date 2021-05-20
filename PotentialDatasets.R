library(tidyverse)
library(fivethirtyeight)
library(haven)

sandy_311 <- as.data.frame(sandy_311)


quartets2 <- pivot_wider(group, 
            names_from = "group", )

#### api data #### 
apidata
api_wide <- pivot_wider(apidata,
                        id_cols = c(uid,community_type,school_type,county,api),
                        names_from = variable_name,
                        values_from = c (percentage))

# separate one column into two columns
apidata <-
  separate(data = apidata,
           col = community_schooltype,
           into = c("community_type", "school_type"),
           sep = "_")


#### 2020 ANES Survey Data ####
##  https://electionstudies.org/data-center/2020-time-series-study/
  
ANES2020 <- read_dta("C:/Users/aleaw/OneDrive/Desktop/LessonPlans/PPOL105_R/anes_timeseries_2020_stata_20210324.dta")
# Pre and post election surey. Includes new questions on COVID and other hot topics.

# Pre election variables are V201001 : V201652
# Post election variables are V202001 : V202635




#### Chicago Crash Data ####
crash <- read_csv("~/GitHub/PPOL105/Traffic_Crashes_Cleaned.csv")
# rm(crash) its big, rm removes it.

#### Eat Tweets ####
# wages and tax rates over time 
EatTweets <- read_csv("C:/Users/aleaw/OneDrive/Documents/GitHub/PPOL105/EatTweets.csv")
# Could be interesting to combine with Megan and Jane's data on wage and GDP growth.

data <- download_wid(
  indicators = "sptinc", # Shares of pre-tax national income
  areas = "US", # In the United States
  years = 2010:2015, # Time period: 2010-2015
  perc = "p99p100") # Top 1% only


#### COVID data #### 
# https://blog.rstudio.com/2020/12/23/exploring-us-covid-19-cases/
#  - Has tips and code for using the NY Times tracking data

# World Bank Open Data - https://covid19datahub.io/articles/api/r.html




#### Food Stamp Fraud #### 

