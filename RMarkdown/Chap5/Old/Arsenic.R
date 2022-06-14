library(resampledata)

# Load and summarize the sample
Arsenic <- Bangladesh$Arsenic
sample.mean <- mean(Arsenic)
sample.sd <- sd(Arsenic)
hist(Arsenic)

# Compare sample to normal dist
qqnorm(Arsenic)
qqline(Arsenic)

n <- length(Arsenic) # how many observations in Arsenic
N <- 10^4 # Number of bootstrap samples
boot.mean <- numeric(N)

# Pick n values from the original sample with replacement
# And calculate mean of each bootstrap sample.
for (i in 1:N)
{
  x <- sample(Arsenic, n, replace = TRUE)
  boot.mean[i] <- mean(x)
}

# Show bootstrap sample
hist(boot.mean, xlab = "xbar", 
     main = "Bootstrap Distribution")
abline(v = sample.mean, col = "red", lwd = 2, lty = 2)

# Compare bootstrap dist to normal dist
qqnorm(boot.mean)
qqline(boot.mean)

# Find cutoffs for 95% Bootstrap CI
quantile(boot.mean, c(0.025, 0.975))