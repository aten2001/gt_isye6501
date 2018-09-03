#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 2
# Questions 4.2

library(datasets)
library(ggplot2)
print(head(iris))

all_features = list(
  1, 
  2, 
  3, 
  4, 
  c(1,2),
  c(1,3),
  c(1,4),
  c(2,3),
  c(2,4),
  c(3,4),
  c(1,2,3),
  c(1,2,4),
  c(1,4,3),
  c(2,4,3),
  c(1, 2,3, 4)
)
set.seed(42) # meaning of life

all_errs <- rep(0, length(all_features))
counter <- 1
for (i in all_features){
  my_cluster <- kmeans(
    iris[, i], 
    centers = 3, 
    iter.max = 30,
    nstart = 10
  )

  err <- my_cluster$betweenss/my_cluster$totss
  err <- 1 - err
  cat("feature:", i, "\n")
  cat("approx. error:", err, "\n")
  all_errs[counter] <- err
  counter <- counter + 1
}

p <- plot(x = 1:length(all_errs), y= all_errs)
print(p)

idx <- which.min(all_errs)

paste("Best features:", all_features[idx])


my_cluster <- kmeans(
  iris[, 3], 
  centers = 3, 
  iter.max = 30,
  nstart = 10
)
table(my_cluster$cluster, iris$Species)

iris[, "cluster"] <- as.factor(my_cluster$cluster)
p1 <- ggplot(iris, aes(Petal.Length, Petal.Width, color=cluster))
p1 <- p1 + geom_point()
print(p1)
