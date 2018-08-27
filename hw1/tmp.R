#!/usr/bin/Rscript

credit_data <- as.matrix( read.table(
  "credit_card_data-headers.txt", 
  header = TRUE, 
  sep = "\t"
  ) 
)

# Part 2

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
