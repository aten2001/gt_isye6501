#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 6

# Read data
crimes_df <- read.table("uscrime.txt", header=T)

# compute PCA (SVD) 
crime_pca <- prcomp(
  crimes_df[, -ncol(crimes_df)], 
  center = T, 
  scale = T
)

# new values after the SVD
# print(crime_pca$x)

# crime_pca$rotation  # matrix of variable loadings.
print("scale")
print( crime_pca$scale )     # scaling used. 


# To put the model back in terms of the original features we use 
# the model coefficents times the loadings (singular values) found in the
# rotation element of our prcomp() funcion.  

pca_df <- cbind(crime_pca$x, crimes_df[, ncol(crimes_df)])  # add response
colnames(pca_df)[ncol(pca_df)] <- "response"
print(head(pca_df))  ## name the last column!
pca_glm <- glm(response ~ ., data = as.data.frame(pca_df)) 

# check the coefficients
print(pca_glm$coefficients)

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

# we need to multiply the coefficients by the rotation and then the scale
# factors to get the linear model in terms of the original features and unscaled

factors <- crime_pca$rotation
for (i in 1:15) {
  factors[, i] * pca_glm$coefficients[i+1]  
}

# scale sample instead of coefficients 
sample <- (sample - crime_pca$center)/ crime_pca$scale

ans <- pca_glm$coefficients[1] + sum( factors%*%sample )  # about 900

cat("\n", "Answer:", ans, "\n")
