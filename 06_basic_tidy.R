library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
         na = c("NA", "-", "-99", ""))

# Работа с колонками ------------------------------------------------------


heroes %>%
  select(1, 5)

heroes %>%
  select(name, Race, Publisher, `Eye color`)

read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv")

select(heroes, name, Race)
heroes_selected_columns <- heroes %>%
  select(name, Race)

heroes_selected_columns
heroes %>%
  select(name:Publisher)
heroes %>%
  select(name:`Eye color`, Publisher:Weight)
heroes %>%
  select(!...1)
heroes %>%
  select(!(Gender:Height))

heroes %>%
  select(name:last_col())

heroes %>%
  select(everything())

heroes %>%
  select(name, Publisher, everything())

heroes %>%
  select(ends_with("color"))

heroes %>%
  select(starts_with("H"))
heroes %>%
  select(starts_with("H") & ends_with("color"))

heroes %>%
  select(contains("eigh"))

heroes %>%
  select(where(is.numeric))

heroes %>%
  select(where(is.character))

heroes %>%
  select(where(function(x) mean(is.na(x)) < .1 ))

heroes %>%
  select(id = ...1)

heroes %>%
  rename(id = ...1) %>%
  select(Gender:Race)

make.names(names(heroes))
tolower(names(heroes))
toupper(names(heroes))
heroes %>%
  rename_with(make.names)

heroes %>%
  rename_with(toupper)

heroes %>%
  relocate(Publisher)

heroes %>%
  relocate(where(is.numeric))

heroes %>%
  relocate(Publisher, .after = name)

heroes %>%
  relocate(Publisher, .before = name)

heroes %>%
  select(Weight)

iris[,1]
iris$Sepal.Length
iris[,1, drop = FALSE]
#`[`(iris, ,1, drop = FALSE)

heroes %>%
  select(Weight) %>%
  pull()

heroes %>%
  pull(Weight)

heroes %>%
  pull(Weight, name)


# Работа со строками ------------------------------------------------------

heroes %>%
  slice(c(1:3, 560:563))

heroes %>%
  filter(Publisher == "DC Comics")

heroes %>%
  filter(`Hair color` == "Blond")

heroes %>%
  filter(`Hair color` == "Blond", Height > 184)

heroes %>%
  filter(`Hair color` == "Blond" & Height > 184)

heroes %>%
  filter(`Hair color` == "Blond") %>%
  filter(Height > 184)

heroes %>%
  slice_max(Weight, n = 3)

heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE)

heroes %>%
  slice_min(Weight, n = 3)

heroes %>%
  slice_sample(n = 3)

heroes %>%
  slice_sample(prop = .01)

heroes %>%
  slice_sample(prop = 1)

heroes %>%
  tidyr::drop_na()

heroes %>%
  drop_na(Height, Weight)

heroes %>%
  drop_na(where(is.character))

heroes %>%
  arrange(desc(Weight))

heroes %>%
  arrange(Race)

heroes %>%
  arrange(Race, Weight)
# iris$Sepal.Length * 2
# iris$new <- iris$Sepal.Length * 2

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name)
n <- -2:2
# if (n > 0) {
#   "positive number"
# } else if (n < 0) {
#   "negative number"
# } else {
#   "zero"
# }
n
if_else(n > 0, "positive number", "negative number or zero")
if_else(n > 0,
        "positive number",
        if_else(n < 0, 
                "negative number",
                "zero"))

case_when(n > 0 ~ "positive number", #if
          n < 0 ~ "negative number", #if else
          .default = "zero") #else


heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name) %>%
  mutate(imt_group = if_else(imt > 30, "overweight", "normal or underweight"), .after = imt)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name) %>%
  mutate(imt_group = case_when(is.na(imt) ~ NA_character_,
                               imt > 30   ~ "overweight",
                               imt < 18.5 ~ "underweight",
                               .default = "normal weight"),
         .after = imt)

heroes %>%
  transmute(imt = Weight/(Height/100)^2, name, Publisher)

heroes %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE),
            first_weight = first(Weight),
            tenth_weight = nth(Weight, 10),
            last_weight = last(Weight))

heroes %>%
  group_by(Gender) %>%
  reframe(range(Weight, na.rm = TRUE))

heroes %>%
  group_by(Alignment, Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE),
            first_weight = first(Weight),
            tenth_weight = nth(Weight, 10),
            last_weight = last(Weight),
            n = n())

heroes %>%
  group_by(Alignment) %>%
  summarise(n = n())

heroes %>%
  count(Alignment)

heroes %>%
  count(Gender)

heroes %>%
  count(Race, sort = TRUE) %>% View()

heroes %>%
  group_by(Race) %>%
  filter(n() == 1) %>% View()

heroes %>%
  group_by(Race) %>%
  filter(n() > 10) %>%
  ungroup()

heroes %>%
  group_by(Gender) %>%
  mutate(m_height_by_g = mean(Height, na.rm = TRUE)) %>%
  ungroup() %>%
  mutate(height_div = Height - m_height_by_g) %>%
  select(name, Gender, Height, m_height_by_g, height_div) 

heroes %>%
  summarise(mean_height = mean(Height, na.rm = TRUE), .by = Gender)
