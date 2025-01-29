2 + 2
6 - 1
7 / 3
17 / 3
17 %/% 3
17 %% 3

log(x = 8, base = 2) #either fully define parameters with its names
log(8, 2) #or justuse them without names

sin(pi)
options(scipen = 999)
sin(pi)
options(scipen = 6)
2 ^ 900
options(scipen = 999)

a = 2 ^ 4
a <- 3 + 5
b <- a - 2
log(b, a)
a - 3 -> p #we don't do it like this!
rm(p)
p

a == b
a != b # =/=
#factorial(5)
#5!=120

a > b
a < b
a > a
b < b

a >= b
a <= b
a >= a
b <= b
?`+`
#`+`(5, 6)
#`>=`(a, b)
typeof(8+5i)

is.numeric(a)
is.integer(a)
aa <- as.integer(a)
aaa <- 8L

s <- "Hi, everyone"
ss <- 'Hey!'
s
ss

paste("I", "love", "R", sep = "__<3__")
paste("I", "love", "R", sep = "")
paste0("I", "love", "R")

t1 <- TRUE
f1 <- FALSE

comparison <- a > b
comparison

!t1
!!t1

t1 & t1 #TRUE
t1 & f1 #FALSE
f1 & t1 #FALSE
f1 & f1 #FALSE

age <- 20
age >= 18 & age < 30

#xor(t1, t1)
t1 | t1 #TRUE
t1 | f1 #TRUE
f1 | t1 #TRUE
f1 | f1 #FALSE
rt <- 500
rt < 100 | rt > 5000

c(4, 8, 15, 16, 23, 42)
c("Hey", "ho", "let's go")
paste("Hey", "ho", "let's go")
c(TRUE, FALSE)
c(TRUE, FALSE)
1:10
5:-3
seq(10, 100, by = 10)
seq(1, 13, length.out = 6)

rep(1:3, 3)
rep(1:3, c(10, 2, 30))
rep(1:3, each = 3)
rep(c("I", "love", "R"), 10)
1:10
sum(1:10)
mean(1:10)
1:20:1
a
b
a:b
c(1:10, 50:70, 2)
