# Homework 3
# Question 5.1 Test for Outliers in the US Crime dataset (last column)

# Use grubbs.test from outliers
library(outliers)
library(ggplot2)

# Read in data
crimes <- read.table("uscrime.txt", header = TRUE)

p <- ggplot(crimes, aes(x = "Number of Crimes", y = Crime)) + 
  geom_boxplot(fill = "#fdc086", outlier.color = "#377eb8", outlier.size = 3)
p + theme_light()  # visually, three outliers.

print(summary(crimes[, "Crime"]))
Q3 <- summary(crimes[, "Crime"])[5]

# generic way outliers are computed. What ggplot uses
num_of_outliers  <- sum(crimes[, "Crime"] > (1.5*Q3))  # output is 4
# Values outside 2 std. dev are outside 95% of expected data points.
num_of_outliers1 <- sum(crimes[, "Crime"] > (sd(crimes[, "Crime"])*2 
                                             + mean(crimes[, "Crime"])))  # 2

gt <- outliers::grubbs.test(
  crimes[, "Crime"], 
  type = 10,  # test for an outlier on the high side. 
  opposite = FALSE, 
  two.sided = FALSE
)

print(gt$alternative)
print(gt$p.value)  # p-value = 0.07887, if alpha = 0.5 we fail to reject null
