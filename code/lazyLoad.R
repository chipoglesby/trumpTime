library(jsonlite)
library(tidyverse)
library(lubridate)
options(scipen=999)

trumpTime2009 <- fromJSON('data/master/json/2009.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))

trumpTime2010 <- fromJSON('data/master/json/2010.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))

trumpTime2011 <- fromJSON('data/master/json/2011.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))

trumpTime2012 <- fromJSON('data/master/json/2012.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))

trumpTime2013 <- fromJSON('data/master/json/2013.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))

trumpTime2014 <- fromJSON('data/master/json/2014.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))

trumpTime2015 <- fromJSON('data/master/json/2015.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))

trumpTime2016 <- fromJSON('data/master/json/2016.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))
 
trumpTime2017 <- fromJSON('data/master/json/2017.json') %>% 
  mutate(created_at = ymd_hms(strptime(gsub('\\+\\d{4}|\\s', '', created_at), "%a%b%d%T%Y")),
         id = as.double(id))

trumpTime <- rbind(trumpTime2009, 
                   trumpTime2010, 
                   trumpTime2011, 
                   trumpTime2012, 
                   trumpTime2013, 
                   trumpTime2014, 
                   trumpTime2015, 
                   trumpTime2016,
                   trumpTime2017) %>% 
  mutate(type = as.factor(ifelse(grepl('^\\"|^\\-', text), "quoteTweet", 
                                 ifelse(grepl('^\\@', text), "mention", "regularTweet"))),
         hour = hour(created_at),
         month = month(created_at),
         year = year(created_at))

rm(list = c("trumpTime2009", "trumpTime2010", "trumpTime2011", "trumpTime2012", "trumpTime2013", "trumpTime2014", "trumpTime2015", "trumpTime2016", "trumpTime2017"))