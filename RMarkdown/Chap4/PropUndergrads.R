par(mfrow=c(2,2)) # create 2 by 2 matrix of figures1

N <- 100 #Size of each sample
p <- 0.6 #Probability of a "success", student chosen is an undergraduate
B <- 10^5 #Pick 10,000 random samples each size N

results <- numeric(B) # create a numeric vector with B entries to store statistics

# Each time, fandomly pick one sample (of 1's and 0's for success and failure) 
# of size N from a binomial distributionwith prob of success p, and divide by
# the sample size N to calculate what proportion of values are 1's.
# Repeat this B times and store each result in the vector result.
for (i in 1:B) 
{
  results[i] <- rbinom(1, N, p)/N
}

hist(results, xlab = "Prop of Undergrads", main="N=100", xlim=c(0.3,0.9))
abline(v = p, col = "red", lwd=2)

# Repeat with N=200, 500, 1000

N <- 200 #Size of each sample
p <- 0.6; #Probability of a "success", student chosen is an undergraduate
B <- 10^5 #Pick 10,000 random samples each size N

results <- numeric(B) # create a numeric vector with B entries to store statistics

for (i in 1:B) 
{
  results[i] <- rbinom(1, N, p)/N
}

hist(results, xlab = "Prop of Undergrads", main="N=200", xlim=c(0.3,0.9))
abline(v = p, col = "red", lwd=2)


# N = 500
N <- 500 #Size of each sample
p <- 0.6; #Probability of a "success", student chosen is an undergraduate
B <- 10^5 #Pick 10,000 random samples each size N

results <- numeric(B) # create a numeric vector with B entries to store statistics

for (i in 1:B) 
{
  results[i] <- rbinom(1, N, p)/N
}

hist(results, xlab = "Prop of Undergrads", main="N=500", xlim=c(0.3,0.9))
abline(v = p, col = "red", lwd=2)


# N=1000
N <- 1000 #Size of each sample
p <- 0.6 #Probability of a "success", student chosen is an undergraduate
B <- 10^5 #Pick 10,000 random samples each size N

results <- numeric(B) # create a numeric vector with B entries to store statistics

# Each time, fandomly pick one sample (of 1's and 0's for success and failure) 
# of size N from a binomial distributionwith prob of success p, and divide by
# the sample size N to calculate what proportion of values are 1's.
# Repeat this B times and store each result in the vector result.
for (i in 1:B) 
{
  results[i] <- rbinom(1, N, p)/N
}

hist(results, xlab = "Prop of Undergrads", main="N=1000", xlim=c(0.3,0.9))
abline(v = p, col = "red", lwd=2)
