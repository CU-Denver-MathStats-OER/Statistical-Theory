library(resampledata)

target <- Groceries$Target
walmart <- Groceries$Walmart

mean(target)
mean(walmart)


Diff <- target - walmart

# Calculate the observed test statistic, the mean of the paired differences
observed <-mean(Diff) 
observed

# Create a numeric vector size N to store the resampled paird differences
N <- 10^5-1
result <-numeric(N)

# For each pair, randomly assign the difference to be positive or negative.
# Then calculate the new mean of the paired differences
for (i in 1:N)
{
  Sign <-sample(c(-1,1), 30, replace=TRUE)
  Diff2 <- Sign*Diff
  result[i] <- mean(Diff2)
}

# Create a histogram of the permutation distribution
# And add a vertical line at the observed test statistic
hist(result,  xlab = "xbar-diff",
     main = "Permutation Distribution")
abline(v = observed, col = "steelblue")

# Calculate the P-value How likely is it to get samples with a difference
# in means as or more extreme than the observed test statistic
(sum(result >= observed) + 1)/(N+1)



