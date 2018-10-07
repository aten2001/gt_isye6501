# Homework 7 - Advanced Regression

## Question 10.1
Using the same crime data set uscrime.txt as in Questions 8.2 and 9.1, find the best model you can
using:

<ol type="a">
  <li>Regression tree model</li>
  <li>Random forest model</li>
</ol> 

In R, you can use the tree package or the `rpart` package, and the `randomForest` package. For
each model, describe one or two qualitative takeaways you get from analyzing the results (i.e., don’t just
stop when you have a good model, <em>but interpret it too</em>).  

**Answer:** 
#### Part 1
After trying some different parameters I determined that the standard minimum amount of calues in a node to split 
was twenty. Given our small sample size, this will generate a shallow tree. After using `rpart` we find that there 
were only three splits created when regressing on our small sample. 

```sh
Regression tree:
rpart(formula = Crime ~ ., data = df, method = mthd, control = rpart.control(minsplit = min_split, 
    cp = my_cp))

Variables actually used in tree construction:
[1] NW  Po1 Pop

Root node error: 6880928/47 = 146403

n= 47 

        CP nsplit rel error  xerror    xstd
1 0.362963      0   1.00000 1.07393 0.26704
2 0.148143      1   0.63704 1.00044 0.23197
3 0.051732      2   0.48889 0.96193 0.20397
4 0.005000      3   0.43716 0.96513 0.20432
```
You can see in the above output that the lowest cross-validation error is on our model with three splits. 
We can prune our tree, or in this case select the deepest model to obtain our _optimal tree_.  We consider 
this to be our best tree based on its cross-validation error not the relative error.  It's important to 
prune our model, especially if we allow many splits, to avoid overfitting the data.  Thus, our final model 
is the following:

![pruned tree diagram](./prunedTree.png)

```sh
node), split, n, deviance, yval
      * denotes terminal node

1) root 47 6880928.0  905.0851  
  2) Po1< 7.65 23  779243.5  669.6087 *
  3) Po1>=7.65 24 3604162.0 1130.7500  
    6) NW< 7.65 10  557574.9  886.9000 *
    7) NW>=7.65 14 2027225.0 1304.9290 *
```

Origonally, the largest variance amount outputs was among `NW`, `Po1`, and `Pop`. which is why they were 
used to create the model. After pruning, we only use `Po1` and `NW`. These appear to be the only features 
required to make a decent tree.  the cutoffs are first in `Po1` at 7.65.  Then again for `NW` at 7.65 if 
`Po1 >=7.65`.  We can visualize this sectioning with the following figure:

![ggplot sections](./nw_po1.png)

If we use this model to predict we'll end up with only three possible outcomes. This may seem weird but 
if we were to have a perfect descision tree all the samples falling into one leaf would be flat or the 
same value. Thus,  our lowest error comes from prediction all points to be one of three values (four if 
we don't have complete information and have to average). The prediction vs. residual plot shows us 
the distribution of our errors for each prediciton. Based on the 47 points we used to build the model. 
Notice how the distribution in the middle is more compact or slim the the extrema. This is similar for 
OLS or other linear models. 

![prediction chart](./prunedTreePredict.png)

Code:
```R
create_reg_tree <- function(df, mthd='anova', min_split=20, my_cp=0.01 ){
  'Create and run a regression tree (CART)'
  require(rpart)
  if (class(df) != 'data.frame') {
    df <- as.data.frame(df)
  }
  # minesplit: requires that the minimum number of observations in a node be 
  # 30 before attempting a split
  # cp:  a split must decrease the overall lack of fit by a factor of 0.001 
  # (cost complexity factor) before being attempted.
  model <- rpart(
    formula = Crime ~ .,
    data = df,
    method = mthd,
    control = rpart.control(
      minsplit = min_split,  # default 20
      cp = my_cp      # default 0.01
    )
  )
  
  
  plot(model)
  text(model)  
  print(model)
  plot(predict(model), residuals(model))
  
  printcp( model )    # print cross validation errors xerror
  #plotcp( model )    # plot cv errors against cp value
  #rsq.rpart( model ) # approx. R-squared
  #summary( model )   # detailed results
  
  # pick the best cp i.e. best model:
  cp_optimal <- model$cptable[which.min(model$cptable[, "xerror"]),"CP"]
  optimal_tree <- prune(model, cp = cp_optimal)
  
  cat("\n", "Optimal Tree", "\n")
  print(optimal_tree)
  plot(predict(optimal_tree), residuals(optimal_tree))
  plot(optimal_tree, uniform = T, main = "Pruned Tree")
  text(optimal_tree, use.n = TRUE, all = TRUE, cex = 0.8)
  
}

uscrime_df <- read.table(
  'uscrime.txt',
  header = TRUE
)

create_reg_tree(df = data, my_cp = 0.005)


library(ggplot2)
p <- ggplot(uscrime_df, aes(x = Po1, y = NW)) + 
  geom_point(color = 'darkblue', size = 3) +
  geom_vline(xintercept = 7.65, linetype="dashed", 
             color = "#d95f02", size=2) +
  geom_segment(aes(x = 7.65, y = 7.65, xend = 16.5, yend = 7.65), 
               size=2, linetype="dashed", color= "#1b9e77")
p  # show plot
```

#### Part 2

Under Construction

<h2>Question 10.2</h2>  
Describe a situation or problem from your job, everyday life, current events, etc., for which a logistic
regression model would be appropriate. List some (up to 5) predictors that you might use.<br>

**Answer:** You could use logistic regression to do a binary classification of whether a candidate will win 
a political race. For example, will a candidate win a Senate position for a given state. One could use the 
following features to help them make this predictions: 

  1. Percent of registered voters in the state of the same political party
  2. Boolean if the candidate is the incumbent
  3. Number of rallies attended or hosted
  4. Total dollars raised 
  5. Average number or socal media posts a week/month
  6. prior approval ratings if available
  7. Age

<h2>Question 10.3</h2>

  1. Using the GermanCredit data set `germancredit.txt` from
    [here](http://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german) (
    [description](http://archive.ics.uci.edu/ml/datasets/Statlog+%28German+Credit+Data%29)
    ), use logistic
    regression to find a good predictive model for whether credit applicants are good credit risks or
    not. Show your model (factors used and their coefficients), the software output, and the quality
    of fit. You can use the `glm` function in R. To get a logistic regression (logit) model on data where 
    the response is either zero or one, use `family=binomial(link="logit")` in your glm
    function call.

  2. Because the model gives a result between 0 and 1, it requires setting a threshold probability to
    separate between “good” and “bad” answers. In this data set, they estimate that incorrectly
    identifying a bad customer as good, is 5 times worse than incorrectly classifying a good
    customer as bad. Determine a good threshold probability based on your model.

**Answer:**
#### Part 1
Under Construction
#### Part 2
Under Construction
