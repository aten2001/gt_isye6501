# Homework 3
# Question 6.2

# part 1
# make sure nothing is left from last problem
rm(list = ls())

# load data
climate_data <- read.table(
  "temps.txt", 
  header = TRUE, 
  stringsAsFactors = FALSE
)

# CUSUM function
cusum <- function(my_vector, threshold = 100, C = 0, type="high"){
  # Type - high/low, what we are looking for. 
  # higher change or lower change. 
  # threshold, is our threshold
  # C - correction value. 
  
  # error handeling, input an option?
  if (!(type %in% c("low", "high"))){
    print("type is not low or high")
    stop()
  }
  output <- 0
  n = length(my_vector)
  # for each time step
  for (t in 2:n){
    # use rolling avg. because if it was the real world we wouldn't know 
    # future points to use them in our average.
    mu <- mean(my_vector[1:t])  # rolling avg. 
    if (type == "high"){
      # CUSUM formula: st = max{0, s(t-1) + (xt - mu - C)}
      deltas <- my_vector[1:t] - mu - C
    } else {
      # CUSUM formula: st = max{0, s(t-1) + (mu - xt - C)}
      deltas <- mu - my_vector[1:t]  - C
    }
    
    st = max(0, deltas[1])
    for (i in 2:t){
      st <- max(0, st + deltas[i] )
    }
    
    # check if pasted the threshold
    if (st >= threshold){
      print(paste("CUSUM over threshold @", t))
      output <- t
      break
    }
  }
  return(output) # 0 if never go over threshold. 
}


# now to figure out a proper C & threshold. 80 looks about good. 
# test <- cusum(climate_data[, 3], threshold = 86, C = 5, type="low")

indices <- rep(0, 20)  # initiate vector
for (year in 2:21){
  output <- cusum(
    climate_data[, year], 
    threshold = 15, 
    C = 5, 
    type="low"
  )
  
  indices[year - 1] <- output
  first_date <- climate_data[output, 1]
  print(first_date)
}
print(paste("median date:", climate_data[median(indices), 1]))

library(ggplot2)
climate_data$DAY <- factor(climate_data$DAY, levels = climate_data$DAY)
p <- ggplot(climate_data, aes(x = DAY, y = X2007) ) + geom_point(stat = "identity")
p + scale_x_discrete(breaks = climate_data[seq(1, 123, by=10), 1]) 


# part 2
rm(list = ls())
climate_data <- read.table(
  "temps.txt", 
  header = TRUE, 
  stringsAsFactors = FALSE
)

# until September 21 end of summer. 
summer <- climate_data[1:83, 2:21]
avg_summer_temp <- colMeans(summer)
cusum2 <- function(data, threshold=5, C=0){
  for (k in 2:length(data)){
    mu = mean(data[1:k])
    deltas <- data - mu - C
    st <- deltas[1]
    for (i in 1:k){
       st <- max(0, st + deltas[i])
       if (st > threshold) break
    }
    if (st > threshold) {
      output <- k
      print(paste("Over threshold @", k))
      break
    } else {
      output <- 0
    }
  }
  return(output)
}
  
year <- cusum2(avg_summer_temp, threshold = 5, C = 1) 

if (year > 0){
  print(paste("Year it's definitely hotter:", colnames(summer)[year]))
}
