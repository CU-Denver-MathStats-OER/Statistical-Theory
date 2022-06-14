#load required packages

library(ggplot2, knitr) 
set.seed(7759) #So population is the same for all

# Create a populationfrom 70,000 adults and 30,000 10-yr olds
adult <- rnorm(70000, mean = 66.5, sd = 3.25)
child <- rnorm(30000, mean = 55, sd =4)
pop <- c(adult, child)

# Calculate population mean and sd
(mu <- mean(pop))
(sigma <- sd(pop))

# Converts vector of people into a data frame (one column of values)
poppdf <- as.data.frame(pop)

# Make histogram of the population
hg <- ggplot(poppdf, aes(x = pop)) + stat_bin(color = "black", fill = "steelblue", bins=30) + 
  ggtitle("Frequency Distribution of Population") + xlab("Height (inches)")
hg

#Pick random sample size 10
set.seed(NULL)
draw10 = sample(pop, size = 10, replace = TRUE)

#
n <- c(1, 5, 10, 30, 50, 100)  #size n of each sample
t <- c(10, 100, 1000, 10000) #number of samples size n picked

df <- data.frame() #initialize our empty data frame

# Run the simulation
for(i in n) { #for each value of n...
  col <- c()
  for(j in t) { #we loop through each value of t...
    trial <- 1:j
    counter <- j #set up an egg timer based on whichever t value we're on
    value <- c()
    while(counter > 0) {    # and extract n samples from the population...
      bucket <- sample(pop, i, replace = TRUE)
      xbar <- mean(bucket) #calculate the mean...
      value <- c(value, xbar) # and add it to a vector
      counter <- counter - 1 #egg timer counts down and loops back until it hits 0
    }
    sbar <- sd(value) #calculate the standard deviation of our sample
    col <- cbind(trial, value, sbar, i, j) #stick all the info together...
    df <- rbind(df, col) #and attach it to our master data frame
  } #and we do it again for the next set of values until we're done!
  
}

rm(col, bucket, value, counter, i, j, n, sbar, t, xbar, trial) #clean up

# Let's take a look!
str(df)

head(df, n = 25) #the full table is too big to look at but we can take a peek at the first few rows.

# We tidy up our data frame to get it ready for graphing. Note that we built it in "tall"
# form so it's already structured for ggplot

names(df) <- c("trial#", "value", "sdev", "samples", "trials")

# Creating the plot
g <- ggplot(df, aes(x = value)) + geom_density(fill = "steelblue") + 
  facet_grid(samples ~ trials, labeller = label_both) + 
  ggtitle("Demonstrating The Central Limit Theorem With Simulation") + 
  geom_vline(xintercept = mu, linetype = "dashed")
g