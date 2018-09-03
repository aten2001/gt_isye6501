#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 2
# Question 3.1

# Intersting note before we get started:
# https://stackoverflow.com/questions/10814731/knn-training-testing-and-validation

# Libraries used
library(kknn)

"
The point of this question is to split up the dataset into k-folds to help us 
test for the best K (i.e. number of neighbors). To avoid confusion between 
the k in k-folds and k-nearest-neighbor, I'm going to use N-folds from now on.
"

# User Defined functions

# Create my own N-Folds function. It will be called each loop to create the test
# and training set. Creating these each loop will save memory so we don't have
# to many objects floating around.  
n_folds <- function(data, n_folds=10, requested_fold=1) {
  # Data is the data we are asking to be split ( matrix | data.frame )
  # n_folds is the number of folders we are creating ( int > 0 )
  # Requeted fold will indicate which fold is the response since we will be
  # using this function in a loop. ( int >= n_folds )

  total_rows <- nrow(data)
  rows_per_fold <- round(total_rows/n_folds)
  if (requested_fold == n_folds){
    # make sure no row is left out because of rounding.
    response_rows <- c(((requested_fold-1)*rows_per_fold+1):total_rows)
  } else {
    response_rows <- c(
    ((requested_fold-1)*rows_per_fold+1):(requested_fold*rows_per_fold)
    )
  }
  train <- data[-response_rows, ]
  test <- data[response_rows, ]

  return(list(train, test))
}

my_knn <- function(data, my_k=10, my_folds=10){
  require(kknn)  # make sure library is turned on

  fold_errors <- rep(0, my_folds)
  for (i in 1:my_folds){
    data_split <- n_folds(data, n_folds=my_folds, requested_fold=i)
    my_train <- data_split[[1]]
    my_test <- data_split[[2]]
    model <- kknn(
      R1~.,              # use name of columns to define function
      train = my_train,  # train on dataset leaving point out. 
      test = my_test,    # predict on point left out
      k = my_k,          # number of neighbors to use.
      scale = T
    )
    
    # kknn will produce a float and we want the binary classification. 
    # So we will round our fitted values/prediction. 
    my_pred <- round(model$fitted.values)

    # find error
    fold_errors[i] <- (sum(abs(my_pred-my_test[, 11]))/nrow(my_test))
  }
  
  # find the average error over the folds and report 
  my_error <- mean(fold_errors)

  return(my_error)
}


# Read in data
credit_data <- read.table(
  "credit_card_data-headers.txt", 
  header = TRUE, 
  sep = "\t"
) 

# Let's get a look at the data to start.
print(head(credit_data))

# run our CV KNN on a number of k neighbors to find the best val.
errors <- rep(0L, 14)
for (k in 2:15){
  err <- my_knn(data=credit_data, my_k=k, my_folds=10)
  cat("K-neihbors: ", k, " ", "Error: ", round(err, 3), "\n", sep="")
  errors[(k-1)] <- err
}

# get index of lowest error and add 1 because loop started @ 2.
best_k <- which.min(errors) + 1  

# results are k=10
cat("Best Value of K is: ", best_k, "\n")
