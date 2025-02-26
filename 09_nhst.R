dnorm(0)
dnorm(1)
dnorm(-1)
dnorm(3)
vec <- seq(-3, 3, .01)
vec
plot(vec, dnorm(vec))

iq <- 50:150
plot(iq, dnorm(iq, mean = 100, sd = 15))

pnorm(0)
pnorm(100, mean = 100, sd = 15)
1 - pnorm(150, mean = 100, sd = 15)
options(scipen = 999)
pnorm(0, mean = 100, sd = 15) * 10000000000
plot(iq, pnorm(iq, mean = 100, sd = 15))

probs <- seq(0, 1, by = .01)
plot(probs, qnorm(probs, mean = 100, sd = 15))

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
mean(samp)

sqrt(sum((samp - mean(samp))^2)/(length(samp) - 1))
sd(samp)
hist(samp)

many_means <- replicate(1000000, mean(rnorm(100, mean = 100, sd = 15)))
hist(many_means)
mean(many_means)
many_means
sd(many_means)
15 / sqrt(100)
sd(samp)/sqrt(length(samp)) * 1.96

hist(log(rlnorm(100)))
hist(rlnorm(100))
many_l_means <- replicate(100000, mean(rlnorm(1000)))
hist(many_l_means)
mean(samp) + qnorm(0.975) * sd(samp)/sqrt(length(samp))
mean(samp) - qnorm(0.975) * sd(samp)/sqrt(length(samp))

mu_0 <- 100
z_emp <- (mean(samp) - mu_0)/(15/sqrt(length(samp)))
(1 - pnorm(z_emp)) * 2

  