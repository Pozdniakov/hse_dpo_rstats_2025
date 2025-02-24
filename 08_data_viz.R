library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("NA", "-", "-99", ""))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

diff(range(weight))
options(scipen = 999)
mean((weight - mean(weight)) ^ 2)
var(weight)

sum((weight - mean(weight)) ^ 2)/ (length(weight) - 1)
sqrt(sum((weight - mean(weight)) ^ 2)/ (length(weight) - 1))
sd(weight)

c(scale(weight))
z <- (weight - mean(weight))/sd(weight)
mean(z)
sd(z)
sd(weight)
sd(c(weight, 100000))

mad(weight)
IQR(weight)

install.packages("psych")
psych::skew(weight)
weight

psych::kurtosi(weight)
summary(weight)
summary(heroes$name)
summary(heroes)
summary(weight)

psych::describe(weight)
heroes %>%
  group_by(Gender) %>%
  summarise(psych::describe(Weight))

install.packages("skimr")
skimr::skim(weight)

skimr::skim(heroes)

heroes %>%
  skimr::skim(ends_with("color"))

heroes %>%
  group_by(Gender) %>%
  skimr::skim(ends_with("color"))

xxx <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/d.csv")
xxx
summary(xxx)
psych::describe(xxx)
skimr::skim(xxx)
cor(xxx$x, xxx$y)
plot(xxx)

plot(xxx$x, xxx$y)
plot(weight)
plot(iris[, -5])
hist(weight, breaks = 100)

boxplot(weight)
boxplot(Weight ~ Gender, heroes)

gg <- ggplot()
gg

ggplot() +
  geom_point(data = heroes, aes(x = Height, 
                                y = Weight,
                                colour = Gender))

ggplot() +
  geom_point(data = heroes, aes(x = Height, 
                                y = Weight),
             colour = "#20B950", shape = 16,
             size = 5, alpha = 0.1)

heroes %>%
  count(Gender)
ggplot() +
  geom_bar(data = heroes, aes(x = Gender))

ggplot() +
  geom_point(data = heroes, aes(x = Gender,
                                y = Weight),
             position = position_jitter(width = .25,
                                        height = 0),
             alpha = 0.5)

ggplot() +
  geom_bar(data = heroes, aes(x = Gender,
                              fill = Alignment),
           position = "stack") +
  coord_flip()

ggplot(data = heroes, aes(x = Gender,
                          y = Weight)) +
  geom_point(position = position_jitter(width = .25,
                                        height = 0),
             alpha = 0.5) +
  geom_boxplot(outlier.shape = NA, width = .4, alpha = .92)

ggplot(data = heroes, aes(x = Gender,
                          y = Weight)) +
  geom_violin(aes(fill = Gender)) +
  geom_boxplot(outlier.shape = NA, width = .2, alpha = .92) +
  theme_minimal()

ggplot() +
  geom_bar(data = heroes, aes(x = "",
                              fill = Alignment)) +
  coord_polar(theta = "y") +
  theme_void()

ggplot() +
  geom_bar(data = heroes, aes(x = Gender,
                              fill = Alignment),
           position = "stack") +
  coord_flip() +
  scale_fill_brewer(palette = "Set1") +
  labs(title = "Какой-то барплот",
       subtitle = "Здесь что-то происходит") +
  hrbrthemes::theme_ipsum()

ggplot(data = heroes, aes(x = Gender,
                          y = Weight)) +
  geom_point(position = position_jitter(width = .25,
                                        height = 0),
             alpha = 0.5) +
  geom_boxplot(outlier.shape = NA, width = .4, alpha = .92) +
  facet_wrap(~Alignment) +
  theme_linedraw()
