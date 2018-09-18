#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 4
# Question 7.2

# Libraries
library(smooth)  # for general HoltWinters
library(ggplot2)  # to visualize results
library(reshape2)  # melt dataframe

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
# print(ts_temps)

hw_model <- HoltWinters(
  ts_temps,
  alpha = NULL,
  beta = NULL,
  gamma = NULL, 
  seasonal = "multiplicative", 
  #optim.start = c(alpha=0.7, beta = 0.1, gamma=0.15)
)

#png("my_timeseries.png")
#plot.ts(ts_temps)
#dev.off()
#png("HoltWinters_match.png")
#plot(hw_model)
#dev.off()
#print(paste("SSE: ", hw_model$SSE))
png("HoltWinters_match_2years.png")
zoomed_fit <- data.frame(
  c(1:123), 
  tail(hw_model$fitted[, 'xhat'], 123),
  tail(ts_temps, 123)
)
colnames(zoomed_fit) <- list("date", "fit", "og")
p1<- ggplot(zoomed_fit, aes(date)) + 
    geom_line(aes(y = fit, colour = "fit")) + 
    geom_line(aes(y = og, colour = "og"))
plot(p1)
# plot(tail(hw_model$fitted, 246))
dev.off()

new_matrix <- cbind(round(as.vector(time(hw_model$fitted))),
as.vector(hw_model$fitted[, 'xhat']))

# 1996 - 2015
for (i in 2:20) {
  start <- (i-2)*123+1  
  end <- (i-1)*123
  temps[, i] <- new_matrix[c(start:end), 2]
  print(start)
}

# for some reason having trouble populating the last column
temps <- temps[, -21]
print(head(temps))

## now take our results and use the CUSUM to test for end of summer
## with smoothed out results

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

indices <- rep(0, 19)  # initiate vector
for (year in 2:20){
  output <- cusum(
    temps[, year], 
    threshold = 41, 
    C = 6, 
    type="low"
  )
  
  indices[year - 1] <- output
  first_date <- temps[output, 1]
  print(first_date)
}

tmp <- data.frame(indices, c(1996:2014))
colnames(tmp) <- c('date', 'year')
png("index_end_summer.png")
p <- ggplot(tmp, aes(x=year, y=date)) + geom_point() + geom_smooth(method = "lm") 
plot(p) 
dev.off()
