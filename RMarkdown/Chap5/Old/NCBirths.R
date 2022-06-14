library(resampledata)

N <- 10^5 # number of bootstrap resamples
result <-numeric(N) #vector where to store sample stats
weight <- NCBirths2004$Weight

# for each bootstrap resample, pick 1009 random numbers
# between 1 and 1009 (with replacement)
# Then pick corresponding values in original sample 
# and compute sample mean
for (i in 1:N)
{
  x <- sample(weight, 1009, replace = TRUE)
  result[i] <- mean(x)
}

# Create a histogram of resulting bootstrap sample means
hist(result,  xlab = "xbar",
     main = "Bootstrap Distribution")

mean(result) #Calculate center of bootstrap dist
sd(result) #Calculate bootstrap standard error

quantile(result, c(0.025, 0.975))