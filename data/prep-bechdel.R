## prep-bechdel.R
## 
## Script to prepare and clean Bechdel dataset for visualization exercises

# load required package
library(tidyverse)

# import original bechdel file
bechdel <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

# clean the data file
bechdel %>%
  # only keep rated of common ratings
  filter(rated %in% c("G", "PG", "PG-13", "R") | is.na(rated)) %>%
  # keep relevant variables
  select(year, imdb, title, clean_test, binary, budget_2013, rated, metascore, imdb_rating) %>%
  # write copy to disk
  write_csv(here::here("data", "bechdel.csv")) 
