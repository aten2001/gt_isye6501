#!/usr/bin/Rscript
# Homework 5
# vim: tw=80 ts=2 sw=2:

library(boot)
library(ggplot2)

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
## Would be, 275.424. This does not imply our average error is 
## 275. A common miss-interpretation. 

## Let's take a quick look at the features to see if we can 
## Remove some. 
print(summary(my_fit))

## After seeing the results it appears as though a few of 
## the features are unnecessary. I'm going to perform a 
## simple backward model selection, because I want the bias
## of keeping more varibles in my model, to remove a few 
## Variables. This will not give us the best model in the 
## world but it's easy and doesn't go too far past this 
## Section of the notes

slim_lm <- step(my_fit, direction = "backward")

print(slim_lm$anova)  # Check out who was kept!

cv.glm(crimes, slim_lm)$delta  # 48661.19 

## yay our cv error went down! We can assume our new 
## linear model fits the data better now. 

sample <- c(
                 14.0,
                 0,
                 10.0,
                 12.0,
                 15.5,
                 0.640,
                 94.0,
                 150,
                 1.1,
                 0.120,
                 3.6,
                 3200,
                 20.1,
                 0.04,
                 39.0
               )

print(predict(my_fit, newdata=sample))
