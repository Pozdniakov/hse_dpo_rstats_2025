
# Логические вектора ------------------------------------------------------


eyes <- c("green", "blue", "blue", "brown", "green", "blue")
eyes == "blue"
sum(eyes == "blue")
sum(eyes == "blue")/length(eyes == "blue")
mean(eyes == "blue")

all(eyes == "blue")
age <- c(20, 34, 35, 59)
all(age >= 18)

any(eyes == "blue")
all(!eyes == "blue")

which(eyes == "blue")
#seq_along(eyes == "blue")[eyes == "blue"]

eyes[eyes == "blue" | eyes == "green"]
eyes[eyes == c("green", "blue")]

eyes[eyes %in% c("green", "blue")]

respondents_city <- c("Москва", "Анапа", "Москва", "Санкт-Петербург",
                      "Кострома", "Балашиха", "Калуга", "Новосибирск",
                      "Омск", "Казань")
big_cities <- c("Москва", "Санкт-Петербург", "Новосибирск", "Казань", "Екатеринбург")
respondents_city[respondents_city %in% big_cities]
respondents_city[!respondents_city %in% big_cities]


# NA ----------------------------------------------------------------------

missed <- NA
missed == "NA"
missed == 0
missed == ""
missed == NA

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[5] <- NA
n
mean(n)
NA == NA
Joe <- NA
Mary <- NA
Joe == Mary
n
n == NA
is.na(n)
mean(n[!is.na(n)])
#Найти другой способ посчитать среднее вектора n без NA

mean(n, na.rm = TRUE)
typeof(NA)
typeof(n)
c("Yes", "No", NA)
as.character(n)
NA_character_
NA_integer_
NA_real_
NA_complex_

1/0
-1/0
0/0
is.nan(0/0)
is.na(0/0)
is.nan(NA)
mean(c(NA, NA, NA), na.rm = TRUE)


# Matrix ------------------------------------------------------------------

A <- matrix(1:12, nrow = 4)
A
A[3, 2]
A[1:2, 2:3]
A[-1, -2]
A > 10
A[A > 10]
A[, 1:2]
A[2:3, ]
A[ , ]
A[1:2, 1:2] <- 100
A
attributes(A)
attr(A, "dim") <- NULL
A
attr(A, "dim") <- c(2, 6)
A
c(A)
attr(A, "dim") <- c(2, 2, 3)
A
class(A)

rep(1:9, 9) 
rep(1:9, each = 9)
#rep(1:9, rep(9, 9))

matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)
#outer(1:9, 1:9, FUN = `+`)
1:9 %o% 1:9

# List --------------------------------------------------------------------

simple_list <- list(42, "Hi", TRUE)
simple_list

complex_list <- list(c("wow", "it's", "a", "vector"), 
     1:10,
     simple_list,
     A,
     `mean`)
complex_list
str(complex_list)

named_list <- list(name = "Veronika", age = 30, student = TRUE)
named_list$name
named_list[1]

class(named_list$name)
class(named_list[1])

named_list["name"]
named_list[[1]]
named_list[["name"]]

complex_list[[3]][[2]]

df <- data.frame(name = c("Anton", "Konstantin", "Mark", "Anna", "Diana"),
               age = c(25, 17, 22, 35, 21),
               student = c(TRUE, TRUE, TRUE, FALSE, TRUE))

df$name == "Anton"
df[1:2, 1:2]
df[df$age >= 18, c("name")]
df[df$age >= 18 & df$student, ]
df[df$age > mean(df$age), ]
df$name[df$age < 30]
