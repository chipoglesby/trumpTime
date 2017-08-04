trumpTime %>% 
  group_by(type, year) %>% 
  tally() %>% 
  ggplot(aes(year, n)) +
  geom_bar(stat = "identity") +
  scale_x_continuous(breaks = c(2009:2017)) +
  ggtitle("2009 - 2017: Tweets") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~type)