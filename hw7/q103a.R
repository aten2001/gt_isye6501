#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# using glmnet instead of glm because the elastic net and lasso regression are
# great ways to perform model/feature selection to improve accuracy. It also has
# built in cross-validation so you don't have to create a training and
# validation set
library(glmnet)

credit <- read.table(
  'germancredit.txt', 
  stringsAsFactors = FALSE, 
  header = TRUE
)

# Helper function to do one hot encoding
factor_to_binary <- function(data, col){
  'assuming the entries in the column are all strings. Not checking this but
  should in the future if you have more time to come back and add asserts'

  distinct_vals <- unique(data[, col])
  for (val in distinct_vals) {
    data[[val]] <- (data[, col] == val) + 0 # make numeric
  }

  data[, col] <- NULL

  return(data)
}

# new data let's get a look
print( head( credit ) )

response_name <- colnames(credit)[ncol(credit)]

# find whichcolumns are factors or strings
char_cols_check <- lapply(credit, typeof) == 'character'
char_cols <- colnames(credit)[char_cols_check]

# one hot encode all categorical variables. 
for (name in char_cols){
  credit <- factor_to_binary(credit, name)
}

train_idx <- sample(
  1:nrow(credit),
  round(0.8*nrow(credit)),
  replace=FALSE
)

# create Response vector and feature matrix
X = credit[train_idx, setdiff(names(credit), c(response_name))]
Y = credit[train_idx, response_name]

x_test = credit[-train_idx, setdiff(names(credit), c(response_name))]
y_test = credit[-train_idx, response_name]

Y <- Y - 1  # (0 & 1) instead of (1 & 2)
y_test <- y_test - 1

# Glmnet only takes a matrix as input. 
# this should help performance anyway
# matrices are smaller (memory) and consistent (one data type)
X <- as.matrix(X)
Y <- as.matrix(Y)
x_test <- as.matrix(x_test)
y_test <- as.matrix(y_test)
# 1. create a model
# using glmnet 
fit = glmnet(
  x = X, 
  y = Y, 
  family = "binomial",
  standardize = FALSE  # because we don't want to change the binary columns
)
# 2. Check how well the model fits
print(fit)  
yhat <- predict(fit, newx = x_test, type = "class", s = 0) # s=0 is reg logit
misclass_err <- sum(abs(as.numeric(yhat)-y_test))/nrow(y_test)
cat("\n","Misclassification error of logit fit: ", misclass_err, "\n", sep="")

# model doesn't look that good. We can use cross validation 
# to create a better model.
cvfit = cv.glmnet(
  x = X, 
  y = Y, 
  family = "binomial", 
  type.measure = "class",  # misclassification error
  nfolds = 10,
  standardize = F
)
# create an error of the plots
png('logistic_cv_error.png')
plot(cvfit)
dev.off()

# Let's check out our coefficents for the model with the lowest error

coef(cvfit, s = 'lambda.min')

# You can see that the cross validation removes most of our variables we added
# by one hot encoding.  

yhat <- predict(cvfit, newx = x_test, s = "lambda.min", type = "class")
misclass_err2 <- sum(abs(as.numeric(yhat)-y_test))/nrow(y_test)
cat("\n","Misclassification error of logit fit: ", misclass_err2, "\n", sep="")

# results on the test set are...
# about 26.5% for our original logistic model and our sparsed out model.
# we could try performing more perprocessing on our data to see if it would
# improve results. We don't standardize our matrix but we should standardize
# our continuous variables in the future. 
