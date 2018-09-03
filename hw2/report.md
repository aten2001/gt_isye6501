# Homework 2

## Questins 3.1 
Using the same data set (credit\_card\_data.txt or credit\card\_data-headers.txt) as  
in Question 2.2, use the ksvm or kknn function to find a good classifier:  

  1. Using cross-validation (do this for the k-nearest-neighbors model; SVM is optional);  
  2. Splitting the data into training, validation, and test data sets 
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
  my_error <- mean(fold_errors)

  return(my_error)
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
We are going to split the dataset into three groups: train, test, and validation. Before we do that we 
must check for any patters that may be in the data. There are no dates or geographic information in 
the data, so no obvious patters stick out. In addition, we want to make sure we don't split the groups 
up such that none of the groups have a higher proportion of one class/case than another. 

```R
Class 1: 296 total casses: 654 Percent: 0.4525994
```
We can assume the data is stored randomly and send every fourth value to the test set and every 6th point to 
the validation set. Then check to make sure the same proportion of case 1 is in each of the three sets.

```R
# split data up
n <- nrow(credit_data)
train <- credit_data[c(((c(1:n) %% 8) !=3) & ((c(1:n) %% 8) !=5)), ] # 75%
test <- credit_data[c(1:n) %% 8 ==3, ]  # 12.5%
validate <- credit_data[c(1:n) %% 8 ==5, ] # 12.5%
```
These three groups will have the following proportions of case 1:

```R
train:  0.4489796
test:   0.4756098
val:    0.4512195
```
Which are all close to the entire population.  This grouping has more than 30 samples of each case in all 
three groups which satifies our soft condition of groups that are _big_ enough. 
<br>
Now we can change our code from homework 1 to go off of a train and test set.

```R
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
```

Running this code we get the following results:

```R
  c_val     error
1 1e-05 0.4756098
2 1e-04 0.4756098
3 1e-03 0.2317073
4 1e-02 0.1463415
5 1e-01 0.1463415
6 1e+00 0.1463415
7 1e+01 0.1463415
8 1e+02 0.1463415
```

As seen in the table above, the error doesn't decrease after ```0.01``` up. 
Because of this we'll use ```C=100``` which was originially given to us. 
We'll now test that on our validation set to get a final approximation of 
our error. 

```R
ksvm_model <- my_ksvm(train = train, test=validate, c = 100)
cat("Error: ", ksvm_model[[2]],"\n", 
  "Coefficients: ", ksvm_model[[1]], "\n", sep="")
```
which gives us the following results:
```R
Error: 0.1585366 
Coefficients: 0.07912255, -0.001567725, -0.01145886, -0.004054599, 
  0.008312549,  1.01074, -0.007873757, 0.007556349, 0.002312918, -0.01176068, 0.124189
```

These results show that we should expect our error to be around 
```14.6%-15.9%```.

## Questions 4.1
Describe a situation or problem from your job, everyday life, current events, etc., for which a clustering
model would be appropriate. List some (up to 5) predictors that you might use.

Cluster could be used when a company wants to spontaneously give internet viewers a deal to urge them to make 
a purchase. The company could check to see how long the user has been on their website, how many times that 
user/ip address has been to the website, the products they have clicked on, and where geographically the 
user/ip is pinging from. You could cluster visiters into the following groups: 

  - Likely to buy
  - somewhat likely
  - not likely

Once they have clustered the visiters they can provide deals to the middle group to bump them into the 
_likely to buy_ group. 

## Questions 4.2
The iris data set iris.txt contains 150 data points, each with four predictor variables and one
categorical response. The predictors are the width and length of the sepal and petal of flowers and the
response is the type of flower. The data is available from the R library datasets and can be accessed with
iris once the library is loaded. It is also available at the UCI Machine Learning Repository
(https://archive.ics.uci.edu/ml/datasets/Iris ). The response values are only given to see how well a
specific method performed and should not be used to build the model.Use the R function kmeans to cluster the points as well as possible. Report the best combination of
predictors, your suggested value of k, and how well your best clustering predicts flower type.


R comes with the famous _iris_ data set built in. Thus we can quickly explore it with:

```R
library(datasets)
head(iris)
```
```sh
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

Because we are know the solution we can jump to ```k=3``` as the optimal value for _k_. However, 
if we didn't know we could do a similar process for _k_ as we will for feature selection. That is 
to say, we will fit a cluster, then check to see the approximate error by taking the between 
Sum of Squares and dividing it by the total Sum of Squares. A rough interpretation is: 
how much of the variation is explaid within the clusters and not noise outside of the clusters. 

We will do this by looping through all possible combination of features and selecting the one
with the least error. 
```R
all_features = list(
  1, 
  2, 
  3, 
  4, 
  c(1,2),
  c(1,3),
  c(1,4),
  c(2,3),
  c(2,4),
  c(3,4),
  c(1,2,3),
  c(1,2,4),
  c(1,4,3),
  c(2,4,3),
  c(1, 2,3, 4)
)
set.seed(42) # meaning of life

all_errs <- rep(0, length(all_features))
counter <- 1
for (i in all_features){
  my_cluster <- kmeans(
    iris[, i], 
    centers = 3, 
    iter.max = 30,
    nstart = 10
  )

  err <- my_cluster$betweenss/my_cluster$totss
  err <- 1 - err
  cat("feature:", i, "\n")
  cat("approx. error:", err, "\n")
  all_errs[counter] <- err
  counter <- counter + 1
}

p <- plot(x = 1:length(all_errs), y= all_errs)
print(p)

idx <- which.min(all_errs)

paste("Best features:", all_features[idx])
```

![iris_feature_error](/hw2/iris_error.pdf)

From our code above we find the best selection of features is to just use the third 
feature _Petal.Length_. Doing this we are able to cluster just under 95% of the flowers. 

Here is how we classified the the points using just petal length.
```R
    setosa versicolor virginica
  1      0         48         6
  2     50          0         0
  3      0          2        44
```

We can use ggplot to show these results as well. 

![iris_clusters](/hw2/iris_clusters.pdf)
