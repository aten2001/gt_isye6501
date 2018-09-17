#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 4
# Question 7.2

# Libraries
library(smooth)  # for general HoltWinters
library(ggplot2)  # to visualize results
library(reshape2)  # melt dataframe
require(graphics)

# Read in the data
temps <- read.table(
  "temps.txt", 
  sep="\t", 
  header=TRUE
)

# look at how the data looks
#print(head(temps))

L <-  nrow(temps)  # constant L to be using in seasonality
# Melt dataframe because we're going to use it as one long time-series
m_temps <- reshape2::melt(temps)
m_temps <- m_temps[with(m_temps, order(variable)), ]  # sort the data.
#print(head(m_temps))  # show the changes we made by melting.
rownames(m_temps) <- 1:nrow(m_temps)  # not needed, but I a clean axis.

ts_temps <- ts(as.vector(m_temps[, "value"]), start = 1996, frequency = L )
print(ts_temps)

#test <- es(
#  ts_temps,
#  model="AAM", 
#  ic="BIC", 
#  cfType="MSE", 
#  h=L
#)

hw_model <- HoltWinters(
  ts_temps,
  alpha = NULL,
  beta = NULL,
  gamma = NULL, 
  seasonal = "multiplicative", 
  optim.start = c(alpha=0.7, beta = 0.1, gamma=0.15)
)

print(paste("SSE: ", hw_model$SSE))

'
require(graphics)
plot(hw_model)
plot(fitted(hw_model))
'
