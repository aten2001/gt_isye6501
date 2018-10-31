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
data_set[bln, 6] <- NA
data_set <- sapply(data_set, as.numeric)
mu <- mean(data_set[, 6], na.rm = TRUE)
cat("mu: ", mu)
data_set[bln, 6] <- mu
print(data_set[bln, ])

# 2. use regression to impute missing values
# split data up and remove records we will impute
tmp_y <- as.vector(data_set[!bln, 6])
X <- as.matrix(data_set[!bln, -6])
X <- X - colMeans(X)  # center the data

cv_glm <- function(x,y, n = 10){
  n_records <- round(nrow(x)/n)
  eps <- c()
  for (i in 1:n){
    start = (i-1)*n_records + 1
    end = i*n_records
    if (end > nrow(x) ){
      x_test <- x[c(start:nrow(x)), ]
      y_test <- x[c(start:nrow(y)), ]
      x_train <- x[-c(start:nrow(x)), ]
      y_train <- x[-c(start:nrow(y)), ]

    } else {
      x_test <- x[c(start:end), ]
      y_test <- x[c(start:end), ]
      x_train <- x[-c(start:end), ]
      y_train <- x[-c(start:end), ]
    }
    model <- glm.fit(
      x = x_train,
      y = y_train, 
      family = gaussian()
    )
    y_hat <- predict(model, newdata = x_test)
    mse <- sum(abs(y_hat-y_test))
    eps[i] <- mse
  }
  return(eps)
}

cv_err <- cv_glm(x = X, y = tmp_y)

print(cv_err)
# 3. use regression with perturbation to impute missing values

# 4. (Optional) Compare the results of classification models of the previous
# three models, just removing the records with missing values, and when a binary
# variable is used to indicate missing values
