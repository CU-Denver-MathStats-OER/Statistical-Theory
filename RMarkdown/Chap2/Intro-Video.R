library(resampledata)

# library() is used to load a package.
# You only need to install a package one time
# However, each time a new R terminal you must load packages 
# needed for the code to run.

# Hashtags are not for twitter
# We use them to make comments in code

airline <- table(FlightDelays$Carrier)
airline
barplot(airline)

#barplot(airline, col = c("black","gold"), 
#        main = "Number of Flights by Airline", 
#        xlab = "Airline", ylab = "Number of Flights",
#        ylim = c(0,3000))
