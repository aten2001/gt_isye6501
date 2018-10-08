#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 7 - Advanced Regression (Random Forest)

# helpful sits:
# 1. https://cran.r-project.org/web/packages/randomForest/randomForest.pdf
# 2. https://datascienceplus.com/random-forests-in-r/
# 3. https://www.r-bloggers.com/in-depth-introduction-to-machine-learning-in-15-hours-of-expert-videos/#chapter8treebasedmethodsslideshttpsclassstanfordeduc4xhumanitiessciencestatlearningassettreespdfplaylisthttpswwwyoutubecomplaylistlistpl5da3qgb5ib23tlua8zgvgc8hv8zadgh

create_rand_forest <- function(data, num_trees=500, m_try=5){
  require(randomForest)
  if (class(data) != 'data.frame') {
    data <- as.data.frame(data)
  }
  fit <- randomForest(
    x = data[, -ncol(data)], 
    y = data[, ncol(data)], 
    # growing 10x the number of points we can expect all points will be used
    # multiple times while still not wasting time recomputing trees. We expect
    # tress to be shallow so we'll most likely have many repeats. Random forest
    # models can be computationally expensive and saving time growing trees can
    # greatly reduce the number time to compute. That's why I don't use 500 or
    # more trees.
    ntree =  num_trees,
    mtry = m_try
  )

  print(fit)
  png("myRandomForestError.png")
  plot(fit)
  dev.off()

}


uscrime_df <- read.table(
  'uscrime.txt',
  header = TRUE
)


##  I tried mtry=3, 4, 5 and 4 explained the most variance at 42%.
create_rand_forest(uscrime_df, 470, 4)  
