# if (!require("drat")) {
# install.packages("drat")
# library("drat")
# }
#
# drat::addRepo("kjhealy")

library(dplyr)

#x70 <-subset(storms, Carrier >= "1975" & Carrier <= "1984")

x75 <- filter(storms, year < "1985")
x85 <- filter(storms, year >= "1985" & year < "1995")
x95 <- filter(storms, year >= "1995" & year < "2005")
x05 <- filter(storms, year >= "2005" & year < "2015")

cat5 <- filter(storms, category == "5")

hist(cat5$wind)

cat1 <- filter(storms, category == "1")
hist(cat1$wind)

hist(cat5$wind)

hist(x75$wind)

hist(x85$wind)

hist(x95$wind)

hist(x05$wind)