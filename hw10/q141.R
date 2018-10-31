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
Y = as.vector(data_set[, 11])

# The first column is an ID column which means it is not perdictive and we can
# drop it.

data_set[, 1] <- NULL
data_set[, 11] <- NULL

# 1. use mean/mode to impute missing values
## because we are dealing with numeric numbers we'll use the Mean to impute the
## missing data instead of the mode which is reserved for categorical data. 
df1 <- data_set
df1[bln, 6] <- NA
df1 <- sapply(df1, as.numeric)
mu <- mean(df1[, 6], na.rm = TRUE)
cat("mu: ", mu)
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
    mse <- sum(abs(y_hat-x_test[, 6]))
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

# 3. use regression with perturbation to impute missing values

# 4. (Optional) Compare the results of classification models of the previous
# three models, just removing the records with missing values, and when a binary
# variable is used to indicate missing values
