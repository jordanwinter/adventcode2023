#12/1/2023

#libs

library(tidyverse)
# read in part 1
df <- read.csv("day1.csv", header = F)

#rip all numbers out into new column, the grab first and second digit.
df <- df %>%
  mutate(num1 = str_extract_all(V1, "\\d")) %>% 
  mutate(smoosh = map_chr(num1, ~paste0(head(.x, 1), tail(.x, 1)))) 

#char -> integer
df <- as.integer(df$smoosh)

#add em up 55712
sum(df)

#read in part 2 same data

df <- read.csv("day1.csv", header = FALSE)

replace <- tibble(
  written = c("one","two","three","four","five","six","seven","eight","nine"),
  numbah = c(1,2,3,4,5,6,7,8,9)
)

df <- df %>%
  mutate(replaced = str_replace_all(as.character(.), setNames(as.character(replace$numbah), replace$written))) 

test <- as.data.frame(df[1, 2]) %>% 
  rename(this = "df[1, 2]")

newtest <- test %>%
  separate_rows(this, sep = ", ") %>% 
  mutate(num1 = str_extract_all(this, "\\d"))  %>%  
  mutate(smoosh = map_chr(num1, ~ paste0(head(.x, 1), tail(.x, 1)))) 

testnums <- as.numeric(newtest$smoosh)

sum(testnums)

################ 55413



