# Homework 5

library(boot)

crimes <- read.table("uscrime.txt", header=T)

my_fit <- glm(Crime~., data=crimes)

#LOOCV - Because there aren't enough points for 10-fold Cv or even 5
cv.glm(crimes, my_fit)$delta  # 75308.54

## Kind of hard to interpret the LOOCV when not comparing it 
## to another model but this is pretty bad for onl 46 points. 
## Highly likely we could do better once we perform some model 
## selection like forward/backward/stepwise or Lasso Regression. 
## Also, possible to perform PCA to ensure orthogonal features. 
## Those are comming in a future homework so I'll wait on them. 
## Feels weird with such a short homework. Our error is ~MSE.
## Some people like to look at RMSE because it puts the error 
## on the same order as the response (generally). for us, that 
## Would be, 275.424
