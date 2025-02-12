install.packages("haven")
library(haven)
wb <- read_sav("data/well_being.sav")
wb
class(wb)
attributes(wb)
methods(print)
print
wb
wb_fct <- as_factor(wb)
class(wb_fct$Gender)
str(wb_fct$Gender)
unclass(wb_fct$Gender)
as.integer(wb_fct$Gender)
as.character(wb_fct$Gender)

tt <- t.test(rnorm(30), rnorm(30))
class(tt)
str(tt)
tt$p.value

library(dplyr)
mutate(wb_fct, across(where(is.factor), as.character))
mutate(wb_fct, across(where(is.factor), as.integer))

install.packages("data.table")
library(data.table)
heroes_dt <- fread("data/heroes_information.csv", na = c("-", "-99", "NA", ""))
class(heroes_dt)
heroes_dt
heroes_dt[Alignment == "good",
          .(mean_height = mean(Height, na.rm = TRUE)),
          by = Gender][order(-mean_height),]

install.packages("tidyverse")
library(tidyverse)
heroes_tbl <- read_csv("data/heroes_information.csv", na = c("-", "-99", "NA", ""))
heroes_tbl

heroes_tbl %>%
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(height_mean = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(height_mean))

sum(log(sqrt(abs(sin(1:22)))))
1:22 %>% 
  sin() %>% 
  abs() %>% 
  sqrt() %>% 
  log(x = 3, base = .) %>% 
  sum()

1:22 |>
  sin() |> 
  abs() |> 
  sqrt() |>
  log(x = 3, base = _) |> 
  sum()

B <- matrix(10:39, nrow = 5)
apply(B, 1, mean)
10:39 %>%
  matrix(nrow = 5) %>%
  apply(1, mean)
