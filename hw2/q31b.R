#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 2
# Question 3.1.b

# Libraries
library(kernlab)

# user defined functions
my_ksvm <- function(train, test, c = 100){ 
  # call ksvm. Vanilladot is a simple linear kernel.
  model <- ksvm(
    train[, 1:10], 
    train[, 11], 
    type = "C-svc", 
    kernel = "vanilladot", 
    C = c, 
    scaled = TRUE
  )
  
  # calculate a1…am
  a <- colSums(model@xmatrix[[1]] * model@coef[[1]])

  # calculate a0 ~ intercept 
  a0 <- -model@b
  
  # see what the model predicts
  pred <- predict(model, test[, 1:10])
  
  # see what fraction of the model’s predictions match the actual classification
  error <- sum(abs(pred - test[, 11]))/nrow(test)

  # Return everything we created and may need after.
  return(list(coef=c(a0,a), m_error=error, svm_model=model))
}

# Loading data
credit_data <- as.matrix( read.table(
  "credit_card_data-headers.txt", 
  header = TRUE, 
  sep = "\t"
  ) 
)

# Running actual code

# creating and vetting groups
cat("Class 1:", 
  sum(credit_data[, 11]), 
  "total casses:", 
  nrow(credit_data),
  "Percent:",
  sum(credit_data[, 11])/ nrow(credit_data),
  "\n"
)

# split data up
n <- nrow(credit_data)
train <- credit_data[c(((c(1:n) %% 8) !=3) & ((c(1:n) %% 8) !=5)), ] # 75%
test <- credit_data[c(1:n) %% 8 ==3, ]  # 12.5%
validate <- credit_data[c(1:n) %% 8 ==5, ] # 12.5%

# check to see if each is large enough
cat("train: ", sum(train[, 11])/nrow(train))
cat("\n")
cat("test: ", sum(test[, 11])/nrow(test))
cat("\n")
cat("val: ", sum(validate[, 11])/nrow(validate))
cat("\n")


c_vals <- c(1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1e0, 1e1, 1e2)
all_errors <- c()
counter <- 1
for (i in c_vals){
  c_error <- my_ksvm(train = train, test=test, c = i)[[2]] # the error
  all_errors[counter] <- c_error
  counter <- counter + 1
}

print(data.frame(c_val=c_vals, error=all_errors))
library(ggplot2)
p <- ggplot(data.frame(c_val=c_vals, error=all_errors), aes(c_val, error))
p <- p + geom_point()
print(p)

ksvm_model <- my_ksvm(train = train, test=validate, c = 100)
cat("Error: ", ksvm_model[[2]],"\n", 
"Coefficients: ", cat(ksvm_model[[1]], sep="+"), "\n", sep="")
