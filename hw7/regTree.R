#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 7 - Advanced Regression

# HELP:  https://www.statmethods.net/advstats/cart.html

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

create_rand_forrest <- function(){
  require(randomForest)
}

test_reg <- function(data, myCP){
  create_reg_tree(df = data, my_cp = myCP)
}



uscrime_df <- read.table(
  'uscrime.txt',
  header = TRUE
)
german_credit_df <- read.table(
  'germancredit.txt', 
  header = FALSE
)


test_reg(uscrime_df, myCP = 0.005)
