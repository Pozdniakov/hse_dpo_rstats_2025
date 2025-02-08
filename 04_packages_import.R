#install.packages("beepr") #pip install
library(beepr) #import beepr as bpr
beep(5)
beepr::beep()
stats::filter(1:20, rep(1, 3))

install.packages("rdracor")
library(rdracor)
span <- get_dracor("span")
span_df <- as.data.frame(span)
span_df[span_df$yearNormalized > 1900 & span_df$yearNormalized <= 2000, ]

install.packages("devtools")
devtools::install_github("brooke-watson/BRRR")
BRRR::skrrrahh(18)


# Data import -------------------------------------------------------------

read.csv("heroes_information.csv")
getwd()
read.csv("data/heroes_information.csv")

read.csv2("data/heroes_information.csv")
?read.csv
heroes <- read.csv("data/heroes_information.csv",
                   na.strings = c("NA", " ", "-", "-99"))

mean(heroes$Height, na.rm = TRUE)
