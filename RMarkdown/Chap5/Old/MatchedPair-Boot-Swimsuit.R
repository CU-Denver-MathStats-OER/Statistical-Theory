# Vectors containing the times of each swimmer. Ordering is critical
wetsuit <- c(1.57, 1.47, 1.42, 1.35, 1.22, 1.75, 1.64, 1.57, 1.56, 1.53, 1.49, 1.51)
none <- c(1.49, 1.37, 1.35, 1.27, 1.12, 1.64, 1.59, 1.52, 1.50, 1.45, 1.44, 1.41)

# Create a vector of the 12 paired differences
Diff <- wetsuit - none
mean(Diff)

# Calculate the mean difference in original sample
observed <-mean(Diff) 
observed
n <- length(Diff)

# Create a numeric vector size N to store the resampled paird differences
N <- 10^5
boot.diff <- numeric(N)

# Create bootstrap samples by picking n difference from original sample
# With replacement, and then find mean of those differences.
for (i in 1:N)
{
  result <- sample(Diff, n, replace = TRUE)
  boot.diff[i] <- mean(result)
}

# Calculate lower and upper cutoffs
# for the 95% Bootstrap CI
lower <- quantile(boot.diff, probs = 0.025)
upper <- quantile(boot.diff, probs = 0.975)
lower
upper

# Display results of bootstrap distribution
hist(boot.diff, xlab = "Difference", 
     main = "Bootstrap Distribution")
abline(v = observed, col = "red", lwd = 2, lty = 2)
abline(v = lower, col = "blue", lwd = 2, lty = 2)
abline(v = upper, col = "blue", lwd = 2, lty = 2)

mean(boot.diff)
sd(boot.diff)



