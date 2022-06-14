library(resampledata)

Time.ILEC <- subset(Verizon, select = Time, Group == "ILEC", drop =T)
Time.CLEC <- subset(Verizon, select = Time, Group == "CLEC", drop =T)

N <- 10^4
time.ratio.mean <- numeric(N)
for (i in 1:N)
{
  ILEC.sample <- sample(Time.ILEC, 1664, replace = TRUE)
  CLEC.sample <- sample(Time.CLEC, 23, replace = TRUE)
  time.ratio.mean[i] <- mean(ILEC.sample)/mean(CLEC.sample)
}

quantile(time.ratio.mean, c(0.025, 0.975))
original.ratio <- mean(Time.ILEC)/mean(Time.CLEC)
mean.boot <- mean(time.ratio.mean)

hist(time.ratio.mean, main = "Bootstrap dist for ratio of means")
abline(v = mean.boot, col = "red", lty = 2, lwd = 1.5)
abline(v = original.ratio, col = "blue", lty = 2, lwd = 1.5)

qqnorm(time.ratio.mean)
qqline(time.ratio.mean)