# Homework 5 - Linear Regression

## Question 8.1
**Question:**
Describe a situation or problem from your job, everyday life, current events, etc., for which a linear
regression model would be appropriate. List some (up to 5) predictors that you might use.

**Answer:**  A example that is always used is forecasting revenues. You can use previous sales, sales growth, 
number of new products being released, number of new markets you plan to enter, and mean price of products. 
Another example could be predicting the number of "likes" someone will get on a Facebook post. You could use 
  1. number of friends 
  2. number of words in post
  3. numbe of likes on previous post
  4. day of the week of the post
  5. their age (young people are assumed to be more active)
  6. number of posts

## Question 8.2
Using crime data from http://www.statsci.org/data/general/uscrime.txt (file uscrime.txt,
description at http://www.statsci.org/data/general/uscrime.html ), use regression (a useful R function is
lm or glm) to predict the observed crime rate in a city with the following data:

```
M       = 14.0
So      = 0
Ed      = 10.0
Po1     = 12.0
Po2     = 15.5
LF      = 0.640
M.F     = 94.0
Pop     = 150
NW      = 1.1
U1      = 0.120
U2      = 3.6
Wealth  = 3200
Ineq    = 20.1
Prob    = 0.04
Time    = 39.0
``` 
Show your model (factors used and their coefficients), the software output, and the quality of fit.<br><br>
**Note** that because there are only 47 data points and 15 predictors, you’ll probably notice some
overfitting. We’ll see ways of dealing with this sort of problem later in the course.
