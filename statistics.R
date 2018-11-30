library(tidyverse)
statistics_text <- 'Please make sure that group names are in column named "Group"'

exclude.status <- function(df) { # Create function to exclude colnames with 'Status' in name
  cols_to_exclude <- colnames(df %>% select(contains('status', ignore.case = TRUE))) #Select columns to exclude
  df <- df[, !names(df) %in% cols_to_exclude] # Exclude selected columns
}

