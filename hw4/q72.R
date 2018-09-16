#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 4
# Question 7.2

# Libraries
library(ES)  # for general HoltWinters
library(ggplot2)  # to visualize results

# Read in the data
temps <- read.table(
  "temps.txt", 
  sep="\t", 
  header=TRUE
)

# look at how the data looks
print(head(temps))

# Should we melt the data set into one long time series?
