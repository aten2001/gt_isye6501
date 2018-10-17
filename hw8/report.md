# Homework 8 - Variable Selection

## Question 11.1
Using the crime data set uscrime.txt from Questions 8.2, 9.1, and 10.1, build a regression model
using:  
  1. Stepwise regression
  2. Lasso
  3. Elastic net  

For Parts 2 and 3, remember to scale the data first – otherwise, the regression coefficients will be on
different scales and the constraint won’t have the desired effect.
For Parts 2 and 3, use the glmnet function in R.
Notes on R:  

  - For the elastic net model, what we called λ in the videos, glmnet calls "alpha"; you can get a
range of results by varying alpha from 1 (lasso) to 0 (ridge regression) [and, of course, other
values of alpha in between].  
  -  In a function call like `glmnet(x, y, family="mgaussian", alpha=1)` 
  the predictors x need to be in R's matrix format, rather than data 
  frame format. You can convert a data frame to a matrix using 
  as.matrix – for example, `x <- as.matrix(data[,1:n-1])`  
  -  Rather than specifying a value of T, glmnet returns models for a variety of values of T.


## Response
