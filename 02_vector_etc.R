
# Приведение типов --------------------------------------------------------


c("hey", "ho")

c(FALSE, 2L)
2 + TRUE
c(TRUE, 2, "hi")
c(c(TRUE, 2), "hi")

as.integer(c(TRUE, FALSE, FALSE))
as.character(c(TRUE, FALSE, FALSE))

as.numeric(c("1", "2", "три"))
1:100


# Векторизация ------------------------------------------------------------


n <- 1:4
m <- c(0, 5, 10, 20)
n
m
n + m
n * m
n - m
m - n
n / m
max(n / m)
min(n / m)
options(scipen = 999)
n ^ m
n - m * n / (n + m)
sqrt(1:10)
log(1:10)
log(1:10, base = 2)
log(2, base = 1:10)
log(x = 1:10, base = 10:1)


# Ресайклинг --------------------------------------------------------------


k <- c(10, 100)
n * k
n * 10
n * c(10, 100, 1000)

(1:10) ^ 2
2 ^ (1:10)

sum(seq(1, 28, by = 3) / 3 ^ (0:9))
sum(seq(1, 28, by = 3) / 3 ^ (0:9) > 0.5)

0:9

# Индексирование векторов -------------------------------------------------

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
n[10]
n[length(n)]
head(n)
head(n, 1)
tail(n)
tail(n, 2)
n[3] <- 20
n[4:7]
n[length(n):1]
rev(n)
n
reversed_n <- rev(n)
reversed_n
n[4:6] <- 0
n
n[100]
n[-1]
n[c(-3, -5, -7)]
n[c(TRUE, FALSE, TRUE, FALSE, TRUE,
    FALSE, TRUE, FALSE, TRUE, FALSE)]

n[c(TRUE, FALSE)]

mean(n)
n > mean(n)
n[n > mean(n)]
named_vector <- c(first = 1, second = 2, third = 3)
names(named_vector)
named_vector["second"]
named_vector[c("third", "first")]
names(named_vector)
letters
LETTERS
pi
#exp(1)
month.name
month.abb
names(named_vector) <- letters[1:3]
named_vector

troiki <- seq(3, 27, by = 3)
troiki[2, 5]
troiki[c(2, 5, 7)]
troiki[3:7]

1:10*2
seq(2, 20, by = 2)
rev(10:1*2)
1:10 + 1:10
(1:20)[c(FALSE, TRUE)]
seq(0, 18, by = 2) + 2
(1:20)[1:20 %% 2 == 0] 
c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)
