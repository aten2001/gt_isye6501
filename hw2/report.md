# Homework 2

## Questins 3.1 
Using the same data set (credit\_card\_data.txt or credit\card\_data-headers.txt) as  
in Question 2.2, use the ksvm or kknn function to find a good classifier:
  a. Using cross-validation (do this for the k-nearest-neighbors model; SVM is optional);  
  b. Splitting the data into training, validation, and test data sets 
  (pick either KNN or SVM; the other is optional).


### ASIDE
Before getting started let's refresh ourselves on what the data looks like.

```R
  A1    A2    A3   A8 A9 A10 A11 A12 A14 A15 R1
1  1 30.83 0.000 1.25  1   0   1   1 202   0  1
2  0 58.67 4.460 3.04  1   0   6   1  43 560  1
3  0 24.50 0.500 1.50  1   1   0   1 280 824  1
4  1 27.83 1.540 3.75  1   0   5   0 100   3  1
5  1 20.17 5.625 1.71  1   1   0   1 120   0  1
6  1 32.08 4.000 2.50  1   1   0   0 360   0  1
```

We'll be using the first 10 calumns all prefixed with an _A_ as our features and the last column, R1,
as our response. Just to clarify, the first unnamed column we see is simply our index. Another note,
last time, to avoid counting the point itself as a neighbor when running KNN, we performed 
leave-one-out cross-validation. So in a sense we have already done CV on KNN.

### Part A
The goal is to find the optimal number of neighbors, K, to classify people into two distinct groups. 
To verify that our results are accurate we'll use _cross-validation_ with 10 folders. Our choice 
of 10 folds is mostly arbitrary but industry standard.

To do N-fold cross-validation we'll have to write a function to split up our dataset. My plan is to 
extract the _Nth_ section in a loop as our test set and use the rest of the data, the other n-1 folds, 
as our training set. 

```R
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
```

Next we'll create a function that will use our CV function to run our KNN algorithm on the training and 
test set.

```R
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
  my\_error <- mean(fold\_errors)

  return(my\_error)
}
```

This will perform CV knn for on value of k. To test multiple values of k we'll have to use a loop and
find which is has the lowest mean error.

```R
# run our CV KNN on a number of k neighbors to find the best val.
errors <- rep(0L, 14)
for (k in 2:15){
  err <- my_knn(data=credit_data, my_k=k, my_folds=10)
  cat("K-neihbors: ", k, " ", "Error: ", round(err, 3), sep="")
  cat("\n")
  errors[(k-1)] <- err
}

# get index of lowest error and add 1 because loop started @ 2.
best_k <- which.min(errors) + 1  
```

Here are our results printed out:
```sh
K-neihbors: 2 Error: 0.218
K-neihbors: 3 Error: 0.218
K-neihbors: 4 Error: 0.218
K-neihbors: 5 Error: 0.18
K-neihbors: 6 Error: 0.183
K-neihbors: 7 Error: 0.184
K-neihbors: 8 Error: 0.181
K-neihbors: 9 Error: 0.181
K-neihbors: 10 Error: 0.177
K-neihbors: 11 Error: 0.18
K-neihbors: 12 Error: 0.183
K-neihbors: 13 Error: 0.181
K-neihbors: 14 Error: 0.18
K-neihbors: 15 Error: 0.183

Best Value of K is:  10 
```

Using CV we find out that ```k=10``` has our lowest average error and thus is our best value of __K__. 
We would then re-run the algorithm using ```k=10``` on the entire dataset to obtain our best results in 
the future. However, with KNN we are not truely building a model but just creating labels. Thus, we would 
most likely run _leave-one-out cross validation_ [(LOOCV)](https://en.wikipedia.org/wiki/Cross-validation_(statistics)#Leave-one-out_cross-validation).


### Part B

