# install.packages(c("tidyverse", "resampledata", "DataExplorer"))


library(tidyverse)
library(DataExplorer)

# The General Social Survey (GSS) is a major survey that tracks demographics,
# characteristics, views, and opinions.

# Who was in sample? How where they selected? 
glimpse(gss_cat) # What do you see?

# How much data is missing and so on. 
# Note these commands are all in DataExplorer package
introduce(gss_cat)
plot_intro(gss_cat)
plot_missing(gss_cat)
#################

view(gss_cat)

# Summarize numerical
#plot_density(gss_cat)
plot_histogram(gss_cat)
plot_boxplot(gss_cat, by  = "marital")

# Summarize categorical
plot_bar(gss_cat)

# Hunt for correlation
#plot_correlation(gss_cat)
#plot_correlation(gss_cat, maxcat = 5)

raceparty <- table(gss_cat$race,gss_cat$partyid)
raceparty

barplot(raceparty, beside = T, legend=c("Other","Black","White", "NA"))#, col = c("black", "gold"))
title("Counts of flights delayed by > 30 Min")
