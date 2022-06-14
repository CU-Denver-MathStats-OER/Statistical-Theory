library(resampledata)

# Create a vector of just the Delay values for both June and May together
Delay <- FlightDelays$Delay

# Create a vector of only May Delay Times
Delay.May <-subset(FlightDelays, select = Delay,
                  Month == "May", drop = T)

# Create a vector of only June Delay Times
Delay.June <-subset(FlightDelays, select = Delay,
                   Month == "June", drop = T)

# Calculate the proportion of all June flights delayed by more than 20 min.
mean(Delay.June > 20)

# Calculate the observed test statistic which is the 
# difference in the two proportions and display that value
observed <- mean(Delay.June > 20) - mean(Delay.May > 20)
observed

N <- 10^5 - 1 # Number of resamples we will create

# Create a numeric variable where we will store each difference in means
result <- numeric(N)

# m denotes the total number of flights in June. What is the value of m?
# n dentoes the total number of flights in May. What is the value of n?
# Pool all m+n in flights in May and June together
# Randomly pick m flights without replacement to represent one sample
# Assign the other n flights to the other sample
# then calculate difference in proportion of those selected and those not selected
for (i in 1:N)
{
  index <- sample(4029, size = 2030, replace = FALSE)
  result[i] <- mean(Delay[index] > 20) - mean(Delay[-index] >20)
}

# Create a histogram of the permutation distribution
# And add a vertical line at the observed test statistic
hist(result, xlab = "phat1-phat2",
     main = "Permutation Distribution")
abline(v = observed, col = "steelblue")

# Calculate the P-value How likely is it to get samples with a difference
# in means as or more extreme than the observed test statistic
2*(sum(result >= observed) + 1)/(N+1)