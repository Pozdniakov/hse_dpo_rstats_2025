set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
z_emp <- (mean(samp) - 100)/ (15/sqrt(length(samp)))
z_emp
(1 - pnorm(z_emp)) * 2

t_emp <- (mean(samp) - 100)/ (sd(samp)/sqrt(length(samp)))
(1 - pt(t_emp, df = length(samp) - 1)) * 2

t.test(samp, mu = 100)

library(tidyverse)
diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet1 <- diet %>%
  filter(Diet == 1) %>%
  mutate(weight_diff = pre.weight - weight6weeks)

options(scipen = 999)
t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

diet2 <- diet %>%
  filter(Diet == 2) %>%
  mutate(weight_diff = pre.weight - weight6weeks)

t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)
diet12 <- diet %>%
  filter(Diet %in% 1:2)

diet %>%
  count(Diet)

t.test(diet12$weight6weeks ~ diet12$Diet,
       paired = FALSE,
       var.equal = TRUE)
t.test(diet12$weight6weeks ~ diet12$Diet,
       paired = FALSE)

diet %>%
  group_by(Diet) %>%
  summarise(sd(weight6weeks))

diet13 <- diet %>%
  filter(Diet %in% c(1, 3))
t.test(diet13$weight6weeks ~ diet13$Diet, paired = FALSE)

shapiro.test(samp)
hist(samp)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("NA", "-", "-99", ""))

hist(heroes$Weight)
hist(rnorm(length(heroes$Weight)))
hist(diet1$weight6weeks)
length(diet1$weight6weeks)
hist(rnorm(length(diet1$weight6weeks)))
qqnorm(samp)
qqnorm(heroes$Weight)
qqnorm(rnorm(length(heroes$Weight)))

t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)
wilcox.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

wilcox.test(diet12$weight6weeks ~ diet12$Diet,
       paired = FALSE)

heroes_gender_align <- heroes %>%
  select(Gender, Alignment) %>%
  filter(Alignment != "neutral") %>%
  drop_na()

table(heroes_gender_align) %>%
  mosaicplot(shade = TRUE, color = TRUE)

heroes_gender_align %>%
  count(Gender) %>%
  summarise(first(n)/(first(n) + last(n)))

table(heroes_gender_align) %>%
  summary()

table(heroes_gender_align) %>%
  chisq.test()

fisher.test(table(heroes_gender_align))

#install.packages("Stat2Data")
library(Stat2Data)
data("Backpack")
skimr::skim(Backpack)

back <- Backpack %>%
  mutate(backpack_kg = 0.453592 * BackpackWeight,
         body_kg = 0.453592 * BodyWeight)

back %>%
  select(body_kg, backpack_kg) %>%
  cov()

back %>%
  select(body_kg, backpack_kg) %>%
  var()

back %>%
  select(body_kg, backpack_kg) %>%
  cor()

cor.test(back$backpack_kg, back$body_kg)

back %>%
  select(BodyWeight, BackpackWeight) %>%
  cov()

back %>%
  select(BodyWeight, BackpackWeight) %>%
  cor()

cor.test(back$backpack_kg, back$body_kg, method = "spearman")
cor.test(back$backpack_kg, back$body_kg, method = "kendall")

cor.test(heroes$Height, heroes$Weight)
cor.test(heroes$Height, heroes$Weight, method = "spearman")

plot(heroes$Height, heroes$Weight)

cor.test(back$body_kg, back$BackProblems)
t.test(back$body_kg ~ back$BackProblems, paired = FALSE, var.equal = TRUE)

plot(iris)
iris_kmeans <- kmeans(iris[, -5], centers = 3)
str(iris_kmeans)
iris$cluster <- iris_kmeans$cluster
iris
table(iris$Species, iris$cluster)

mtcars %>% 
  scale() %>%
  dist() %>%
  hclust() %>% plot()
