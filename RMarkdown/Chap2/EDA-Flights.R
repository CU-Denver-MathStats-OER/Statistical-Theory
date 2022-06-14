library(resampledata)
library(tidyverse)

#lapply(c("resampledata", "tidyverse"), require, character.only = TRUE) #loads both

##### Create table of totals for each airline
airline <- table(FlightDelays$Carrier)

### Bar Graph compare airline totals
barplot(airline, col = c("black","gold"), 
        main = "Number of Flights by Airline", 
        xlab = "Airline", ylab = "Number of Flights")

## Create contingency table table(var1, var2)
## values of var1 recorded in each row
## values of var2 recorded in each column
delay <- table(FlightDelays$Delayed30, FlightDelays$Carrier)

## Creates joint density table
prop.table(delay)

## Creates conditional prob table sum down each column (var2) is 1
prop.table(delay, 2)

## Create clustered bar chart 
## each var2 is a cluster with bars for each value of var1
## Change beside=F to get stacked
## change input to prop.table(delay, 2) for proportional stack
barplot(delay, beside = T, legend=c("No","Yes"), col = c("black", "gold"))
  title("Counts of flights delayed by > 30 Min")

## Greate new table by filtering out observations with AA as carrier
## Note this command requires library(tidyverse)
AA1 <- FlightDelays %>% 
  filter(Carrier == "AA")

## Or you can subset which does not require tidyverse
AA <-subset(FlightDelays, select = FlightLength, Carrier == "AA")

## Create histogram of dist of flight length for AA data
#ggplot(data = AA, mapping = aes(x = FlightLength)) +
#  geom_histogram(fill = "steelblue", color = "black", binwidth = 10) +
#  ggtitle("Distribution of AA Flight Lengths (n=2906)")

## Using built-in function hist
hist(AA$FlightLength, 
     breaks = 10, 
     xlim = c(140, 250), ylim = c(0,650), 
     col = "steelblue")

## Greate new table by subset or filtering out observations with UA as carrier
UA <-subset(FlightDelays, select = FlightLength, Carrier == "UA")

#UA <- FlightDelays %>% 
#  filter(Carrier == "UA")

## Create histogram of dist of flight length for UA data
#ggplot(data = UA, mapping = aes(x = FlightLength)) +
#  geom_histogram(fill = "steelblue", color = "black", binwidth = 10) + 
#  ggtitle("Distribution of UA Flight Lengths (n=1123)")

## Using built-in function hist
hist(UA$FlightLength, 
     breaks = 10, 
     xlim = c(60, 300), ylim = c(0,600),
     col = "steelblue")

## Compare Frequency Polygons 
#ggplot(data = FlightDelays, mapping = aes(x = FlightLength, y = ..density..)) + 
#  geom_freqpoly(mapping = aes(color = Carrier), binwidth = 50) + 
#plot  ggtitle("Flight Lengths of United and American (n=1123)")

## Box Plot for AA flightlength
boxplot(AA$FlightLength, 
        main = "AA Flight Lengths", 
        horizontal = FALSE)

## Box Plot for UA flightlength
boxplot(UA$FlightLength, 
        main = "UA Flight Lengths", 
        horizontal = TRUE)

## Compare Side by Side Box Plots
boxplot(AA$FlightLength, UA$FlightLength, 
        main = "Flight Lengths", 
        names = c("AA", "UA"), 
        col = c("red", "blue"), 
        horizontal = FALSE)

#ggplot(data = FlightDelays, mapping = aes(x = Carrier, y = FlightLength)) + 
#  geom_boxplot() + coord_flip()

## Create table for destinations by airline
dest <- table(FlightDelays$Destination, FlightDelays$Carrier)

## Calculate summary statistics
mean(AA$FlightLength)  #Mean
median(AA$FlightLength) #Median
quantile(AA$FlightLength, probs = 0.25) # Q1=first quartile=25th percentile
summary(AA$FlightLength) # 5 number summary plus mean
sd(AA$FlightLength) #Sample standard deviation
IQR(AA$FlightLength) #IQR
max(AA$FlightLength) - min(AA$FlightLength) #Range
mad(AA$FlightLength, center=mean(AA$FlightLength)) #Mean Absolute Deviation

## Create sample qqplot with exam scores
x <- c(55, 62, 71, 72, 74, 76, 80, 90, 91, 98)
qqnorm(x)
qqline(x)
hist(x)

plot.ecdf(x)