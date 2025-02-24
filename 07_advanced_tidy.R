library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("NA", "-", "-99", ""))
band_members
band_instruments
bind_cols(band_members, band_instruments)

left_join(band_members, band_instruments)

band_members %>%
  left_join(band_instruments)

band_members %>%
  right_join(band_instruments)

band_instruments %>%
  left_join(band_members)

band_instruments %>%
  full_join(band_members)

band_instruments %>%
  inner_join(band_members)

band_members %>%
  left_join(band_instruments)

band_members %>%
  left_join(band_instruments, by = "name")

band_instruments2
band_members %>%
  left_join(band_instruments2, by = c("name" = "artist"))

band_members %>%
  filter(name %in% band_instruments$name)
band_members %>%
  semi_join(band_instruments)

band_members %>%
  filter(!name %in% band_instruments$name)
band_members %>%
  anti_join(band_instruments)
band_instruments %>%
  anti_join(band_members)

# pivot_* -----------------------------------------------------------------


new_diet <- tibble(
  student = c("Маша", "Рома", "Антонина"),
  before_r_course = c(70, 80, 86),
  after_r_course = c(63, 74, 71)
)
new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course,
               names_to = "time",
               values_to = "weight") %>%
  pivot_wider(names_from = time,
              values_from = weight)


# across() ----------------------------------------------------------------

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(height = mean(Height),
            weight = mean(Weight))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), 
                   mean))

heroes %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), 
                   mean, na.rm = TRUE))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric), 
                   mean))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is.character), 
                   function(x) mean(nchar(x), na.rm = TRUE)))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(ends_with("eight"), 
                   list(minimum = min,
                        average = mean,
                        maximum = max)))

heroes %>%
  mutate(across(where(is.character), as.factor))
iris %>%
  mutate(across(where(is.numeric), function(x) (x - mean(x))/sd(x) ))

heroes %>%
  nest(!Gender)

heroes %>%
  group_by(Gender) %>%
  nest()

heroes %>%
  nest(!Gender) %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest()

heroes %>%
  nest(!Gender) %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest_wider(dim, names_sep = "_")

films <- tribble(
  ~film, ~genres,
  "Аватар", "fantasy, drama",
  "Субстанция", "triller",
  "Девушка с татуировкой дракона", "triller, drama",
  "Властелин колец", "fantasy"
)
films %>%
  filter(genres == "triller")

films %>%
  filter(str_detect(genres, "triller"))

films
str_split(films$genres, pattern = ", ")

films %>%
  mutate(genres = str_split(genres, ", ")) %>%
  unnest() %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres, values_from = value, values_fill = FALSE)

films %>%
  separate_rows(genres, sep = ", ") %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres, values_from = value, values_fill = FALSE)


# descriptive stats -------------------------------------------------------

weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

mean(weight)
median(weight)
mean(c(weight, 100000))
median(c(weight, 100000))
sort(weight)
heroes %>%
  count(`Eye color`, sort = TRUE)

?mean
mean(weight, trim = .1)
mean(weight, trim = .5)
