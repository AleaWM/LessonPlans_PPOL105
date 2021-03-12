---
title: "EatTweets"
author: "Alea Wilbur"
date: "1/7/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(wid)
library(knitr)
library(tidyverse)
```

```{r cars}
devtools::install_github("WIDworld/wid-r-tool")

```

```{r}
data <- download_wid(
    indicators = "sptinc", # Shares of pre-tax national income
    areas = "US", # In the United States
    years = 2010:2015, # Time period: 2010-2015
    perc = "p99p100" # Top 1% only
```

