# Question 2.2

# Libraries used
library(kernlab)
library(kknn)


credit_data <- as.matrix( read.table(
  "credit_card_data-headers.txt", 
  header = TRUE, 
  sep = "\t"
  ) 
)

# Part 1.

# We want to find a good value for C below. We'll have to try a few and plot their
# results next to eachother to see which has the lowest error. % error here

my_ksvm <- function(data, c = 100, p = F){ 
  # call ksvm. Vanilladot is a simple linear kernel.
  model <- ksvm(
    data[, 1:10], 
    data[, 11], 
    type = "C-svc", 
    kernel = "vanilladot", 
    C = c, 
    scaled = TRUE
  )
  
  # calculate a1…am
  a <- colSums(model@xmatrix[[1]] * model@coef[[1]])

  
  # calculate a0 ~ intercept 
  a0 <- -model@b
  
  if (p){
    print(a)  # print coefficients to console
    print("A0")
    print(a0)
  }
  
  # see what the model predicts
  pred <- predict(model, data[, 1:10])
  
  # see what fraction of the model’s predictions match the actual classification
  error <- model@error
}

c_vals <- c(1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1e0, 1e1, 1e2)
all_errors <- c()
counter <- 1
for (i in c_vals){
  c_error <- my_ksvm(data = credit_data, c = i)  
  all_errors[counter] <- c_error
  counter <- counter + 1
}
plot(x = c_vals, y= all_errors, log="x")

# Plot shows errors don't decrease much after 1e-2 to 1e2. 
# We'll just use C = 100 as provided in example. 

my_ksvm(data = credit_data, c = 100, p = T)


## Part 2. (optional) Choose a nonlinear kernal.

# Trying out different kernals to see if we can get better performance

my_ksvm <- function(data, c = 100, p = F, my_kernal="vanilladot"){ 
  require(kernlab)
  # call ksvm. Vanilladot is a simple linear kernel.
  model <- ksvm(
    data[, 1:10], 
    data[, 11], 
    type = "C-svc", 
    kernel = my_kernal, 
    C = c, 
    scaled = TRUE
  )
  
  # calculate a1…am
  a <- colSums(model@xmatrix[[1]] * model@coef[[1]])

  
  # calculate a0 ~ intercept 
  a0 <- -model@b
  
  if (p){
    print(a)  # print coefficients to console
    print("A0")
    print(a0)
  }
  
  # see what the model predicts
  pred <- predict(model, data[, 1:10])
  
  # see what fraction of the model’s predictions match the actual classification
  error <- model@error
}

c_vals <- 100
kernals <- c('rbfdot', 'polydot', 'vanilladot', 'tanhdot', 'laplacedot', 'besseldot', 'anovadot', 'splinedot')

all_errors <- c()
counter <- 1
for (kern in kernals){
 #print(kern)
 k_error <- my_ksvm(
     data = credit_data, 
     c = c_vals, 
     my_kernal=kern
 )  
 all_errors[counter] <- k_error
 counter <- counter + 1
 print(paste(kern, ": ", k_error, sep=""))
}

# laplace fits the data perfectly!! wow. Adding a nonlinear kernal helps a lot

## Part 3.  Use Knn to create a classification model.
# Goal: Suggest a good value for the number of neighbors.

my_data <- as.data.frame(credit_data)

my_knn <- function(data, my_k){
  require(kknn)  # make sure library is turned on
  my_predictions <- c()
  counter = 1
  for (i in 1:nrow(data)){
    model <- kknn(
      R1~.,                 # use name of columns to define function
      train = data[-i, ],   # train on dataset leaving point out. 
      test = data[i, ],     # predict on point left out
      k = my_k,             # number of neighbors to use.
      scale = T
    )
    
    # kknn will produce a float and we want the binary classification. 
    # So we will round our fitted value/prediction. 
    my_predictions[counter] <- round(model$fitted.values)
    counter <- counter + 1
  }
  
  # count how many are different and divide by how many there are.
  my_error <- (sum(abs(my_predictions - data[, 11])) / nrow(data) )
  print(paste("K: ", k))
  print(paste("error: ", my_error))
  return(my_error)
}

k_error <- c()
k_counter <- 1
for (k in seq(1, 10, by=1)) {
  current_error <- my_knn(data= my_data, my_k = k)
  k_error[k_counter] <- current_error
  k_counter <- k_counter + 1
}

plot(x= 2:10, y = k_error)

# Best K appears to be 5. 
