#!/usr/bin/Rscript
# vim: ts=2 sw=2:


# Data & Libraries
#    #  Attribute                     Domain
#    -- -----------------------------------------
#    1. Sample code number            id number
#    2. Clump Thickness               1 - 10
#    3. Uniformity of Cell Size       1 - 10
#    4. Uniformity of Cell Shape      1 - 10
#    5. Marginal Adhesion             1 - 10
#    6. Single Epithelial Cell Size   1 - 10
#    7. Bare Nuclei                   1 - 10
#    8. Bland Chromatin               1 - 10
#    9. Normal Nucleoli               1 - 10
#   10. Mitoses                       1 - 10
#   11. Class:                        (2 for benign, 4 for malignant)


# Class distribution:
#  
#    Benign: 458 (65.5%)
#    Malignant: 241 (34.5%)
data_set <- read.csv(
  '../data/breast-cancer-wisconsin.data.txt',
  header=FALSE,
  stringsAsFactors = FALSE
)

print(head(data_set))
# 699 by 11. 
cat(nrow(data_set), 'Rows and ', ncol(data_set), 'columns', '\n')

print(colSums(data_set == '?'))  # only V7 is missing data, 16 values
bln <- data_set[, 7] == '?'

# Response:
Y = as.vector(data_set[, 11]) / 2 - 1  # (outputs now 1 or 0)

# The first column is an ID column which means it is not perdictive and we can
# drop it.

data_set[, 11] <- NULL
data_set[, 1] <- NULL

# 1. use mean/mode to impute missing values
## because we are dealing with numeric numbers we'll use the Mean to impute the
## missing data instead of the mode which is reserved for categorical data. 
df1 <- data_set
df1[bln, 6] <- NA
df1 <- sapply(df1, as.numeric)
mu <- mean(df1[, 6], na.rm = TRUE)
cat("mu: ", mu, '\n\n')
df1[bln, 6] <- mu
print(df1[bln, ])

# 2. use regression to impute missing values
# split data up and remove records we will impute
df2 <- data_set
df2[bln, 6] <- NA
df2 <- sapply(df2, as.numeric)
X <- df2[!bln, ]
X <- X - colMeans(X)  # center the data

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
cv_err <- cv_glm(x = X, n = 10)  # MSE is 115 which seems... good.
cat("Avg. Cross-Validation Error (MSE): ", mean(cv_err), '\n','\n')

# impute missing values
full_model <- glm(V7 ~ ., data = as.data.frame(X) )
df2[bln, 6] <-  predict(
  full_model,
  newdata=as.data.frame(df2[bln, -6] - colMeans(X[, -6]) )
)

print(df2[bln, 6])

# 3. use regression with perturbation to impute missing values

# We already have our predictions and our model. We can use our training
# residules, assuming they are normally distributed we can take a random sample
# and use them to perturb our results. Sum(bln) gives us the number of missing
# values which happens to be 16
df3 <- df2  # copy for third part. 
df3[bln, 6] <- df2[bln, 6] + sample(full_model$residuals, size=sum(bln))

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
