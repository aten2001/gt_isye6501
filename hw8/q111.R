#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 8 - Variable selection


## Helpful links:
#  1. https://www4.stat.ncsu.edu/~post/josh/LASSO_Ridge_Elastic_Net_-_Examples.html
#  2. https://web.stanford.edu/~hastie/glmnet/glmnet_alpha.html

library(glmnet)

crime <- read.table(
  '../data/uscrime.txt',
  header = TRUE
)

# part 1 - Step regression
# It's good practice to scale and center predictors in regression
crime[, -ncol(crime)] <- scale(crime[, -ncol(crime)])

# Fit simple model
fit <- glm(
  formula = Crime ~ ., 
  data = crime
)
# AIC: 650

print(fit)
cat(
  "\n",
  "Dev ratio:",
  "\n",
  1-fit$deviance/fit$null.deviance,
  "\n",
  sep=""
)

# using both direcion stepwise helps to avoid bias but has to check more models.
# Still not possible of checking all models and thus is not perfect. 
step_stuff <- step(
  fit, 
  direction = "both"  
)
# Results:
# Step:  AIC=639.32
# Crime ~ M + Ed + Po1 + M.F + U1 + U2 + Ineq + Prob

cat("\n", "Step dev ratio", "\n")
slim_fit <- glm(
  Crime ~ M + Ed + Po1 + M.F + U1 + U2 + Ineq + Prob,
  data = crime
)
cat(
  "\n",
  "Dev ratio:",
  "\n",
  1-slim_fit$deviance/slim_fit$null.deviance,
  "\n",
  sep=""
)

# under estimating AIC since we don't have a test set

# Step 2. Lasso
X <- as.matrix(crime[, -ncol(crime)])
y <- as.vector(crime[, ncol(crime)])

cv_lasso_fit <- cv.glmnet(
  x = X,
  y = y,
  family = "gaussian",
  alpha = 1,  # Lasso
  nlambda = 150,  # 50% more checks than normal
  nfolds = 5,
  type.measure = "mse"
)

png('lasso_results.png')
plot(cv_lasso_fit)
dev.off()

coef(cv_lasso_fit, s = "lambda.min")
coef(cv_lasso_fit, s = "lambda.1se")

lasso_fit <- glmnet(
  x = X,
  y = y,
  family = "gaussian",
  alpha = 1,  # Lasso
  nlambda = 150  # 50% more checks than normal
)

png('lasso_coef_results.png')
plot(lasso_fit, xvar="lambda", label = TRUE)
dev.off()

cat("\n", "\n")
print(cv_lasso_fit)

opt_lasso_fit <- glmnet(
  x = X,
  y = y,
  family = "gaussian",
  alpha = 1,  # Lasso
  lambda = cv_lasso_fit$lambda.1se
)

cat(
  "\n",
  "Dev ratio:",
  "\n",
  opt_lasso_fit$dev.ratio,
  "\n",
  sep=""
)

