# install.packages(c("tidyverse", "dplyr", "resampledata"))

library(tidyverse) # loads package tidyverse
library(dplyr)

help(package = "dplyr") # glossary of functions and datasets in dplyr

# The glimpse function is in the dplyr package
glimpse(storms) #gives a glimpse of the dataset storms

# The view function is in the tidyverse package
# If tidyverse has not been loaded, then use View() 
view(storms) # displays the dataset in tabular form

types <- table(storms$status)
barplot(types)

hist(storms$wind, breaks = 15, 
     xlab="Wind speed (in knots)",
     xlim = c(0, 160), ylim = c(0,2500), 
     col = "steelblue",
     xaxt='n')                      # This means no x axis drawn
axis(1, at=seq(0, 160, 20), pos=0)  # This adds a specific axis back 

# Below is simplier code that 
# Generates a default x axis which is fine too!
#hist(storms$wind, breaks = 15, 
#     xlab="Wind speed (in knots)",
#     xlim = c(0, 160), ylim = c(0,2500), 
#     col = "steelblue",
#     main = "Distribution of Windspeed from 1975-2015")

hist(storms$month, 
     breaks = 12, 
     xlab="Month",
     xlim = c(1, 12), 
     ylim = c(0,4500), 
     col = "green",
     main = "Distribution of Storms by Month",
     xaxt='n')
axis(1, at=seq(1, 12, 1), pos=0)

hist(storms$long, 
     breaks = 15, 
     xlab="Degrees of Longitude",
     xlim = c(-120, 0), 
     ylim = c(0,1000), 
     col = "red",
     main = "Distribution of Storms by Longitude",
     xaxt='n')
axis(1, at=seq(-120, 0, 10), pos=0)

mean(storms$wind)  #Mean
median(storms$wind) #Median

###########
#### Day 2
###########
july <- filter(storms, month == "7")

#july <- subset(storms), month == "7") #keeps all variables same as filter above
#july.wind <- subset(storms, select = wind, month == "7") #keeps only windspeed variable
#july.wind.vec <- subset(storms, select = wind, month == "7", drop = T) #data vector instad of data frame

# Calculate centers for July
mean(july$wind) # mean is 41.195 knots
median(july$wind) # median is 37.5 knots

# Filter August and September Storms
aug <- filter(storms, month == "8") 
sep <- filter(storms, month == "9") 
mean(aug$wind) # mean is 52.1 knots
mean(sep$wind) # mean is 57.958 knots

# Optional plots to visualize wind speeds by month

hist(july$wind)
hist(aug$wind)
hist(sep$wind)

summary(july$wind)

boxplot(aug$wind, 
        main = "August Windspeeds", 
        horizontal = FALSE)

boxplot(july$wind, 
        main = "July Windspeeds", 
        horizontal = TRUE)

boxplot(july$wind, aug$wind, 
        main = "Windspeed of Storms (knots)", 
        names = c("July", "August"), 
        col = c("red", "blue"), 
        horizontal = TRUE)
        