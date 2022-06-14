library(dplyr)
library(tidyverse)

# What is the mean wind speed of all storms in July?
# Filter command
# new_obj <- filter(dataset_name, condition(s))
july <- filter(storms, month == "7")

# Or use the subset command
july.ver2 <- subset(storms, month == "7") #same as filter above
july.wind <- subset(storms, select = wind, month == "7") #keeps only windspeed variable
july.wind.vec <- subset(storms, select = wind, month == "7", drop = T) #data vector instad of data frame

# Calculate centers for July
mean(july$wind)
median(july.wind.vec)

# Filter August Storms and compute mean and median
aug <- filter(storms, month == "8")
mean(aug$wind)

# Optional plots to visualize wind speeds by month
hist(july$wind)
hist(aug$wind)
