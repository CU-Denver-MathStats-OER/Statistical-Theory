library(resampledata)

# tapply applies a function (such as mean) to the hotwings
# column separately for each gender category.
# First is the column you apply the function to
# Second is the how you are subgrouping summary
# Last is what function you are applying. 
# Type ?tapply to see help documentation
tapply(Beerwings$Hotwings, Beerwings$Gender, mean) 

observed <- 14.533-9.333 # Assign observed difference in means to observed
# Easier to refer to hotwing sample data
# drop = T options creates a vector where the subset of values is stored.
hotwings <- subset(Beerwings, select = Hotwings, drop = T)

N <- 10^5 - 1 # Number of resamples we will create

# Create a numeric variable where we will store each difference in means
result <- numeric(N)

# Pick 15 out of the the 30 possible values without replacement, 
# then calculate difference in means of those selected and those not selected
for (i in 1:N)
{
  index <- sample(30, size = 15, replace = FALSE)
  result[i] <- mean(hotwings[index]) - mean(hotwings[-index])
}

# Create a histogram of the permutation distribution
# And add a vertical line at the observed test statistic
hist(result, xlab = "xbar1-xbar2",
     main = "Permutation Distribution")
abline(v = observed, col = "steelblue")

# Calculate the P-value How likely is it to get samples with a difference
# in means as or more extreme than the observed test statistic
(sum(result >= observed) + 1)/(N+1)

# If for some reason you want to export data to latex
# library(xtable)
# print(xtable(Beerwings, type = "latex"), file = "beerwings-table.tex")

