# Homework 3
# Question 6.2

# make sure nothing is left from last problem
rm(list = ls())

# load data
climate_data <- read.table("temps.txt", header = TRUE)

# CUSUM function
cusum <- function(my_vector, threshold, C = 0, type="high"){
  # Type - high/low, what we are looking for. 
  # higher change or lower change. 
  # threshold, is our threshold
  # C - correction value. 
  
  if (!(type %in% c("low", "high"))){
    print("type is not low or high")
    stop()
  }
  n = length(my_vector)
  cs <- rep(0, (n-1))
  cs[1] <- my_vector[1]
  if (type == "high"){
    # CUSUM formula: st = max{0, s(t-1) + (xt - mu - C)}
    deltas <- my_vector - mean(my_vector) - C
  } else {
    # CUSUM formula: st = max{0, s(t-1) + (mu - xt - C)}
    deltas <- mean(my_vector) - my_vector  - C
  }
  
  for (i in 2:(n-1)){
    cs[i] <- max(0, cs[i-1] + deltas[i] )
  }
  
  bln <- cs > threshold
  
  return(list(indices=which(bln), over_vals=cs[bln], cum_vals=cs))
}


# now to figure out a proper C & threshold.
test <- cusum(climate_data[, 3], threshold = 70, C = 3, type="low")
