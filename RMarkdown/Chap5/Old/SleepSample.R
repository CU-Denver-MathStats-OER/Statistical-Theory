# Set working directory location where csv file is saved
setwd("/Users/adamspiegler/Dropbox/CUDenver/Math3382/Data")

# Load csv file into R with headers
sleep <- read.csv("Chap5-SleepSample.csv", header = TRUE)

# Compute sample statistics
sample.mean <- mean(sleep$Sleep.Hours)
sample.sd <- sd(sleep$Sleep.Hours)
sample.mean
sample.sd

# Create histogram of the sample
hist(sleep$Sleep.Hours, xlab = "Hours Typically Sleep",
     main = "Sample (n=71)")
abline(v = sample.mean, col = "red", lwd=2)

N <- 10^4 # number of bootstrap resamples
result <-numeric(N) #vector where to store bootstrap stats

# for each bootstrap resample, pick 71 random numbers
for (i in 1:N)
{
  index <- sample(71, replace = TRUE)
  sleep.boot <- sleep[index, ]
  result[i] <- mean(sleep.boot)
}

# Create a histogram of resulting bootstrap sample means
hist(result,  xlab = "xbar",
     main = "Bootstrap Distribution")

mean(result) #Calculate center of bootstrap dist
sd(result) #Calculate center of bootstrap dist
