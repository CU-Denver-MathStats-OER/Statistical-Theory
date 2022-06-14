library(resampledata)

# tapply applies a function (such as mean) to the hotwings
# column separately for each gender category.
# First is the column you apply the function to
# Second is the how you are subgrouping summary
# Last is what function you are applying. 
# Type ?tapply to see help documentation
tapply(FlightDelays$FlightLength, FlightDelays$Month, var) 

observed <- 1808.357-1684.430 # Assign observed difference in means to observed
# Easier to refer to hotwing sample data
# drop = T options creates a vector where the subset of values is stored.
lengths <- subset(FlightDelays, select = FlightLength, drop = TRUE)

N <- 10^5 - 1 # Number of resamples we will create

# Create a numeric variable where we will store each difference in means
result <- numeric(N)

# Pick 1999 out of the the 4029 possible values without replacement, 
# then calculate difference in means of those selected and those not selected
for (i in 1:N)
{
  index <- sample(4029, size = 1999, replace = FALSE)
  result[i] <- var(lengths[index]) - var(lengths[-index])
}

# Create a histogram of the permutation distribution
# And add a vertical line at the observed test statistic

hist(result, main = "Permutation Dist for test on variance")

