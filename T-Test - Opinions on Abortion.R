# **** EXAMPLE 3: Opinions on Abortion by Gender  ***** #

library(tidyverse)
library(haven)

setwd("C:/Users/aleaw/OneDrive/Desktop/LessonPlans/PPOL105_R")
ANES <- read_dta("anes_timeseries_2020_stata_20210324.dta") %>%
  select(V201001 : V201652)

# Pre election variables are V201001 : V201652
# Post election variables are V202001 : V202635

# V161342: Gender coded as 1=Male, 2=Female, 3=Other
table(ANES$V201600) 
ANES$rsex <- ANES %>%
  rename(V201600, 
         1="Male", 
         2 ="Female")  #else=NA gets rid of the 3 and -9
table(ANES$rsex)
attributes(ANES$rsex)

attributes(ANES$V161232)
table(ANES$V161232)
ANES$choice <- ifelse(ANES$V161232 <1, NA, ANES$V161232)
ANES$choice <- ifelse(ANES$choice == 5, NA, ANES$choice)
table(ANES$choice)
ANES$choice01 <- (ANES$choice-1)/3
table(ANES$choice01)
ANES$choice01 <- round(ANES$choice01, digits=3)
table(ANES$choice01)

hist(ANES$choice, breaks =5)
# Opinions on  not normally distributed


#make a dummy variable where 0="Never allow abortion", and 1=options 2,3,4 which allow abortion to some extent
ANES$choicedummy <- recode(ANES$V161232, "1=1; 2=0;3=0;4=0; else=NA")
table(ANES$choicedummy)

# Compare opinions by gender
table(ANES$choice01, ANES$gender) 
table(ANES$choicedummy, ANES$gender) 
describeBy(ANES$choice01, ANES$gender)
describeBy(ANES$choicedummy, ANES$gender)

LeveneTest(ANES$choice, ANES$gender) 
# What can we assume about the variances? 
t.test(ANES$choice01~ANES$gender)

LeveneTest(ANES$choicedummy, ANES$gender)
t.test(ANES$choicedummy~ANES$gender)
#Overall interpretation? 
