library(resampledata)

# Note there are more than just two aquifer types 
# in the dataset MnGroundwater. So for the pooled
# sample lead, we want to select the lead values
# for any observation that has Aquifer.Group 
# Equal to "buried Quaternary" or "surficial Quaternary"
# In R the command for "or" is a vertical bar |
# So Aquifer.Group == "buried Quaternary" | Aquifer.Group == "surficial Quaternary"
# Means choose if Auqifier.Group is Equal to "buried Quaternary" 
# or "surficial Quaternary"

lead <- subset(MnGroundwater, select = Lead,
               Aquifer.Group == "buried Quaternary" | Aquifer.Group == "surficial Quaternary", drop = T)
buried <- subset(MnGroundwater, select = Lead,
                 Aquifer.Group == "buried Quaternary", drop = T)
surface <- subset(MnGroundwater, select = Lead,
                  Aquifer.Group == "surficial Quaternary", drop = T)

observed <- mean(buried) - mean(surface)

m <- length(buried)
n <- length(surface)
total <- length(lead)

N <- 10^5 - 1
result <- numeric(N)

for (i in 1:N)
{
  index <- sample(total, size = m, replace = FALSE)
  result[i] <- mean(lead[index]) - mean(lead[-index])
}

hist(result, xlab = "xbar1-xbar2",
     main = "Permutation Distribution")
abline(v = observed, col = "red")

(sum(result <= observed) + 1)/(N+1)

###### There is one large outlier in buried data and one extremely
###### large value in surface data. That is why the permutation dist
###### is skewed. Lets scrub out those two extreme values since they
###### are likely incorrect readings. Below is an anlysis with clean data

lead.clean <-  subset(MnGroundwater, select = Lead,
                      (Aquifer.Group == "buried Quaternary" | Aquifer.Group == "surficial Quaternary") & Lead < 80, drop = T)
buried.clean <- subset(MnGroundwater, select = Lead,
                       Aquifer.Group == "buried Quaternary" & Lead < 80, drop = T)
surface.clean <- subset(MnGroundwater, select = Lead,
                        Aquifer.Group == "surficial Quaternary" & Lead < 80, drop = T)
observed.clean <- mean(buried.clean) - mean(surface.clean)

m.clean <- length(buried.clean) #length(vector) = number of values in vector
n.clean <- length(surface.clean)
total.clean <- length(lead.clean)

N <- 10^5 - 1
result.clean <- numeric(N)

for (i in 1:N)
{
  index.clean <- sample(total.clean, size = m.clean, replace = FALSE)
  result.clean[i] <- mean(lead.clean[index.clean]) - mean(lead.clean[-index.clean])
}

hist(result.clean, xlab = "xbar1-xbar2",
     main = "Permutation Distribution")
abline(v = observed.clean, col = "red")

(sum(result.clean <= observed.clean) + 1)/(N+1)