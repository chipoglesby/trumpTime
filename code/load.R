for (i in 2009:2017) {
  print(trumpTime %>% 
          filter(year == i) %>% 
          group_by(hour) %>% 
          tally() %>% 
          ggplot(aes(hour, n)) +
          geom_bar(stat = "identity") +
          scale_x_continuous(breaks = c(0:23)) +
          ggtitle(paste0("Year & Hour: ", i)))
}

trumpTime %>%
  # filter(grepl("2012|2017", year)) %>% 
  group_by(year, hour) %>% 
  tally() %>% 
  ggplot(aes(hour, n)) +
  geom_bar(stat = "identity") +
  scale_x_continuous(breaks = c(0:23)) +
  ggtitle("2009 - 2017: realDonaldTrump's Tweets By Hour") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~year)

eightPM <- trumpTime %>% 
  filter(hour == 20)

for (i in 2009:2017) {
  print(eightPM %>% 
          filter(year == i) %>% 
          group_by(month) %>% 
          tally() %>% 
          ggplot(aes(month, n)) +
          geom_bar(stat = "identity") +
          scale_x_continuous(breaks = c(0:12)) +
          ggtitle(paste0("8 pm & Year: ", i)))
}


obamaMentions <- 
  
  trumpTime %>% 
  filter(grepl('obama', tolower(text))) %>% 
  group_by(year, hour) %>% 
  tally() %>% 
  ggplot(aes(hour, n)) +
  geom_bar(stat = "identity") +
  scale_x_continuous(breaks = c(0:23)) +
  ggtitle("2009 - 2017: Obama Metions") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~year)