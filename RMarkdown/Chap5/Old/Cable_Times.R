times.Basic <- c(7, 10, 10.6, 10.2, 8.6, 7.6, 8.2, 10.4, 11.0, 8.5)
times.Ext <- c(3.4, 7.8, 9.4, 4.7, 5.4, 7.6, 5.0, 8.0, 7.8, 9.6, 6.2, 8.1)

# Doing some EDA with original samples
hist(times.Basic)
hist(times.Ext)
boxplot(times.Basic, times.Ext, 
        names = c("Basic", "Extended"))

# Summarizing each sample separately
mean(times.Basic)
sd(times.Basic)
n.Basic <- length(times.Basic)

mean(times.Ext)
sd(times.Ext)
n.Ext <- length(times.Ext)
observed <- mean(times.Basic) - mean(times.Ext)
observed

# Create numeric vector to store bootstrap samples
N <- 10^4
times.diff.mean <- numeric(N)

# Randomly select n.Basic values from basic sample (with replacement)
# Randomly select n.Ext values from extended sample (with replacement)
# Calculate difference of means between samples. Store and repeat
for (i in 1:N)
{
  Basic.boot <- sample(times.Basic,  
                       n.Basic, replace=TRUE)
  Ext.boot <- sample(times.Ext, 
                     n.Ext, replace=TRUE)
  times.diff.mean[i] <-  
    mean(Basic.boot)-mean(Ext.boot)
}

# Bootstrap mean and bootstrap standard error
mean(times.diff.mean)
sd(times.diff.mean)

# Find cutoffs for 90% bootstrap CI
lower <- quantile(times.diff.mean, probs = 0.05)
upper <- quantile(times.diff.mean, probs = 0.95)

# Display bootstrap distribution
hist(times.diff.mean)
abline(v = observed, col = "red", lwd = 2, lty = 2)
abline(v = lower, col = "blue", lwd = 2, lty = 2)
abline(v = upper, col = "blue", lwd = 2, lty = 2)
