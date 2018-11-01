# Homework 10 - Missing Data
## Question 14.1
The breast cancer data set breast-cancer-wisconsin.data.txt from
[UC Irvine](http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/)
([description](http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Original%29) ) has missing values.

<ol>
    <li>Use the mean/mode imputation method to impute values for the missing data.</li>
    <li>Use regression to impute values for the missing data.</li>
    <li>Use regression with perturbation to impute values for the missing data.</li>
    <li>(Optional) Compare the results and quality of classification models (e.g., SVM, KNN) build using</li>
    <ol type="i">
        <li>the data sets from questions 1,2,3;</li>
        <li>the data that remains after data points with missing values are removed; and</li>
        <li>the data set when a binary variable is introduced to indicate missing values.</li>
    </ol>
</ol>

### Answer
Before we do any analysis we want to bring in the data and get a feel for how it
looks: 

```R
data_set <- read.csv(
  '../data/breast-cancer-wisconsin.data.txt',
  header=FALSE,
  stringsAsFactors = FALSE
)

print(head(data_set))
# 699 by 11. 
cat(nrow(data_set), 'Rows and ', ncol(data_set), 'columns', '\n')

print(colSums(data_set == '?'))  # only V7 is missing data, 16 values

## output

       V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11
1 1000025  5  1  1  1  2  1  3  1   1   2
2 1002945  5  4  4  5  7 10  3  2   1   2
3 1015425  3  1  1  1  2  2  3  1   1   2
4 1016277  6  8  8  1  3  4  3  7   1   2
5 1017023  4  1  1  3  2  1  3  1   1   2
6 1017122  8 10 10  8  7 10  9  7   1   4

699 Rows and  11 columns

 V1  V2  V3  V4  V5  V6  V7  V8  V9 V10 V11
  0   0   0   0   0   0  16   0   0   0   0
```
As we can see, there are 11 columns, almost 700 records and the only missing
values are 16 in column 7. I believe it's important to note the first column is
an case ID column and thus not predictive. So we'll just remove it. 

part 1. use mean/mode to impute missing values 
because we are dealing with numeric numbers we'll use the Mean to impute the 
missing data instead of the mode which is reserved for categorical data.  _Note_
I omitted some of my code in the sake of brevity. If you would like to see all
of it feel free to open and run my code file.

```R
df1 <- data_set
df1[bln, 6] <- NA
df1 <- sapply(df1, as.numeric)
mu <- mean(df1[, 6], na.rm = TRUE)
df1[bln, 6] <- mu

# Output:

mu:  3.544656 
       V2 V3 V4 V5 V6       V7 V8 V9 V10
 [1,]  8  4  5  1  2 3.544656  7  3   1
 [2,]  6  6  6  9  6 3.544656  7  8   1
 [3,]  1  1  1  1  1 3.544656  2  1   1
 [4,]  1  1  3  1  2 3.544656  2  1   1
 [5,]  1  1  2  1  3 3.544656  1  1   1
 [6,]  5  1  1  1  2 3.544656  3  1   1
 [7,]  3  1  4  1  2 3.544656  3  1   1
 [8,]  3  1  1  1  2 3.544656  3  1   1
 [9,]  3  1  3  1  2 3.544656  2  1   1
[10,]  8  8  8  1  2 3.544656  6 10   1
[11,]  1  1  1  1  2 3.544656  2  1   1
[12,]  5  4  3  1  2 3.544656  2  3   1
[13,]  4  6  5  6  7 3.544656  4  9   1
[14,]  3  1  1  1  2 3.544656  3  1   1
[15,]  1  1  1  1  1 3.544656  2  1   1
[16,]  1  1  1  1  1 3.544656  1  1   1
```
We identify the mean value `3.544656` and put it into the 16 missing slots. Very
simple.


Part  2. use regression to impute missing values.
In this section I used a function because I had to run the function many times
to get it to work correctly and it helped with garbage collection. Not because a
function is the best thing here. 

```R
# make a new copy for this part
df2 <- data_set
df2[bln, 6] <- NA
df2 <- sapply(df2, as.numeric)  # the '?' caused matrix to be all strings
X <- df2[!bln, ]
X <- X - colMeans(X)  # center the data

#  Cross-Validation to get estimate of my error
cv_glm <- function(x, n = 10){
  n_records <- round(nrow(x)/n)
  cat(n_records, ' Used in CV test set', '\n')
  eps <- c()
  for (i in 1:n){
    start = (i-1)*n_records + 1
    end = i*n_records
    if (end > nrow(x) ){
      x_test <- x[c(start:nrow(x)), ]
      x_train <- x[-c(start:nrow(x)), ]

    } else {
      x_test <- x[c(start:end), ]
      x_train <- x[-c(start:end), ]
    }
    m <- glm(V7 ~., data = as.data.frame(x_train) )
    y_hat <- stats::predict(object = m, newdata=as.data.frame(x_test[, -6]))
    mse <- sum(abs(y_hat-x_test[, 6]))/n_records
    eps <- c(eps, mse)
  }
  return(eps)
}
cv_err <- cv_glm(x = X, n = 10)
```

We end up using 68 records in each of our CV test sets. 
The average Cross-Validation error (MSE) is 1.77 which seems fairly good. 
Now that we have an estimate we can use the entire data set to create our best
model and forcast our missing values. 

```R
full_model <- glm(V7 ~ ., data = as.data.frame(X) )
df2[bln, 6] <-  predict(
  full_model,
  newdata=as.data.frame(df2[bln, -6] - colMeans(X[, -6]) )
)
```
The values we end up forecasting are: 

```sh
 
 [1] 3.9912521 8.0866407 1.3117465 2.2349847 1.3554312 2.2618834 3.1286762
 [8] 3.8261852 0.9297857 6.4091057 1.3221137 3.5826881 5.6748969 1.7614829
[15] 1.6999450 2.9223774
```

Part 3. use regression with perturbation to impute missing values.

We already have our predictions and our model. We can use our training
residules, assuming they are normally distributed we can take a random sample
and use them to perturb our results. `sum(bln)` gives us the number of missing
values which happens to be 16.

```R
df3 <- df2  # copy for third part. 
df3[bln, 6] <- df2[bln, 6] + sample(full_model$residuals, size=sum(bln))

# Output
 [1]  2.61907276  6.97745498  1.47308547  3.29938172  5.12238113  6.47025468
 [7] -1.42131881  2.82211507  0.05742913  6.12521176  6.59316678  4.77425293
[13]  6.35241021  3.43979725  1.32798892  0.32075965
```
*Fin!!*

Optional part 4 was a good test. I'm going to just drop my code below and you
can quickly view what I tried. I did a logistic regression where when you just
remove the points performed the best with less than 4% of records being
misclassified in the test set and then a SVM with a linear kernal where all
model performed about the same. Not super satisfying of results to be honest.
I'm sure with more time and testing more interesting results are possible.

### Code:
```R
# 4. (Optional) Compare the results of classification models of the previous
# three models, just removing the records with missing values, and when a binary
# variable is used to indicate missing values

df_remove_points <- data_set[!bln, ]
df_remove_points <- sapply(df_remove_points, as.numeric)

df_add_binary <- data_set
df_add_binary[bln, 6] <- 0
df_add_binary <- sapply(df_add_binary, as.numeric)
missing <- bln+0
df_add_binary <- cbind(df_add_binary, missing)

# add the response back in that I removed in the beggining
df1 <- cbind(df1 , Y)
df2 <- cbind(df2 , Y)
df3 <- cbind(df3 , Y)
df_remove_points <- cbind(df_remove_points , Y[!bln])
colnames(df_remove_points) <- c(colnames(df_remove_points)[-10], 'Y')
df_add_binary <- cbind(df_add_binary , Y)
# test set will be 15% of the data. Arbitrarily chosen, could have been 10% or
# 20% but 15% is about 100 records which is good enouogh to get a decent error
# estimate. 

sample_size = round(nrow(data_set)*0.15)

all_data_sets <- list(df1, df2, df3, df_remove_points, df_add_binary)
ds_names <- c("df1", "df2", "df3", "df_remove_points", "df_add_binary")

## logistic
counter <- 1
#log_err <- c()
for (data in all_data_sets){
  log_mod <- glm(
    Y ~ .,
    data = as.data.frame( data[-c(1:sample_size), ] ),
    family = binomial()
  )
  yhat <- predict(log_mod, newdata = as.data.frame( data[c(1:sample_size), ] ))
  miss_class <- sum(round(yhat) == data[c(1:sample_size), 'Y'])/ sample_size
  # log_err<- c(log_err, mse)
  cat('Model: ', ds_names[counter],' % miss class: ', miss_class, '\n\n') 
  counter <- counter + 1
}

## Data remove errors did the best but less points to get wrong as well. 

## SVM
library(kernlab)
print("SVM Errors:")
counter <- 1
for (data in all_data_sets){
  svm_mod <- ksvm(
    x = data[-c(1:sample_size), !names(data) %in% c('Y')],
    y = as.factor(data[-c(1:sample_size),  'Y']),
    type = 'C-svc',
    kernel = 'vanilladot',  
    tol = 0.01,
    scaled = T,
    C = 100
  )
  yhat <- kernlab::predict(svm_mod, newdata =
    as.data.frame(data[c(1:sample_size), !names(data) %in% c('Y')]) )
  miss_class <- sum(as.numeric(yhat) == as.data.frame(data[c(1:sample_size), 'Y']))/ sample_size
  cat('Model: ', ds_names[counter],' % miss class: ', miss_class, '\n\n') 
  counter <- counter + 1
}
```
#### Printed output:
```

Model:  df1  % miss class:  0.04761905 

Model:  df2  % miss class:  0.04761905 

Model:  df3  % miss class:  0.04761905 

Model:  df_remove_points  % miss class:  0.03809524 

Model:  df_add_binary  % miss class:  0.04761905 

[1] "SVM Errors:"
 Setting default kernel parameters  
Model:  df1  % miss class:  0.4571429 

 Setting default kernel parameters  
Model:  df2  % miss class:  0.4571429 

 Setting default kernel parameters  
Model:  df3  % miss class:  0.4571429 

 Setting default kernel parameters  
Model:  df_remove_points  % miss class:  0.4666667 

 Setting default kernel parameters  
Model:  df_add_binary  % miss class:  0.4571429 
```

## Question 15.1
Describe a situation or problem from your job, everyday life, current events, etc., for which optimization
would be appropriate. What data would you need?

### Answer:
As a contractor, I worked on a project where we had to write an algorithm to
schedule the maintenance of missle facilities. As one would expect, there are
storng regulation around how often these facilities need to be inspecated, which
parts can be used and the their quality. Their is added dificulty with time of
year, since it is much harder to perform maintenance in the winter and only a
few people have the skills necessary to perform this type of maintenance. All of
the constraints required us to perform a huristic optimization to create a  
maintenance schedule that would plan all manditory checks and replacements
required for the year in advance but leave cushion for spontanious events that
were bound to appear. Having major events planned in advance allowed the crew
and security team coordinate approperiatly and have all resources on time.
Planning in advance also allowed us to add cushion in each month by adding a
maximum amount of events allowed in a month to our optimization code.  
