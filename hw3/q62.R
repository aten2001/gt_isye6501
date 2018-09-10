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
cusum <- function(my_vector, threshold, C = 0, type="high"){
  # Type - high/low, what we are looking for. 
  # higher change or lower change. 
  # threshold, is our threshold
  # C - correction value. 
  
  # error handeling, input an option?
  if (!(type %in% c("low", "high"))){
    print("type is not low or high")
    stop()
  }
  n = length(my_vector)
  cs <- rep(0, (n-1))
  if (type == "high"){
    # CUSUM formula: st = max{0, s(t-1) + (xt - mu - C)}
    deltas <- my_vector - mean(my_vector) - C
  } else {
    # CUSUM formula: st = max{0, s(t-1) + (mu - xt - C)}
    deltas <- mean(my_vector) - my_vector  - C
  }
  
  cs[1] = max(0, deltas[1])
  for (i in 2:(n-1)){
    cs[i] <- max(0, cs[i-1] + deltas[i] )
  }
  
  # check if pasted the threshold
  bln <- cs > threshold
  
  return(list(
    indices=which(bln), 
    cs_over_vals=cs[bln], 
    over_vals=my_vector[bln], 
    cum_vals=cs
    )
  )
}


# now to figure out a proper C & threshold. 80 looks about good. 
# test <- cusum(climate_data[, 3], threshold = 86, C = 5, type="low")

for (year in 2:21){
  output <- cusum(
    climate_data[, year], 
    threshold = 10, 
    C = 2, 
    type="low"
    )
  
  first_date <- climate_data[output$indices[1], 1]
  print(first_date)
}

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
summer <- climate_data[1:83, 2:21] # only summer months
avg_summer_temp <- colMeans(summer)  # avg. temp in each summer
cusum2 <- function(data, threshold=5, C=0){
  # don't want to take avg of tmps in the future not real world scenario
  for (k in 2:length(data)){ 
    mu = mean(data[1:k])  # avg. until now
    deltas <- data - mu - C
    st <- deltas[1]
    for (i in 1:k){
       st <- max(0, st + deltas[i])
       if (st > threshold) break  # if we went over threshold stop loop
    }
    if (st > threshold) { # have to check again because we only broke out of inner loop
      output <- k # save the year that put us over
      print(paste("Over threshold @", k))  # it's just the index
      break
    } else {
      output <- 0  # never went over
    }
  }
  return(output)
}
  
year <- cusum2(avg_summer_temp, threshold = 5, C = 1) 

if (year > 0){
  print(paste("Year it's definitely hotter:", colnames(summer)[year]))  # turn index into year.
}
