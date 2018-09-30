#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 6

# Read data
crimes_df <- read.table("uscrime.txt", header=T)

# compute PCA (SVD) 
crime_pca <- prcomp(
  crimes_df[, -1], 
  center = T, 
  scale = T
)

# new values after the SVD
print(crime_pca$x)

# crime_pca$rotation  # matrix of variable loadings.
# crime_pca$scale     # scaling used. 


# To put the model back in terms of the original features we use 
# the model coefficents times the loadings (singular values) found in the
# rotation element of our prcomp() funcion.  

pca_df <- cbind(crime_pca$x, crimes_df[, ncol(crimes_df)])  # add response
print(head(pca_df))  ## name the last column!
pca_glm <- glm(pca_df[, ncol(pca_df)]~., data = as.data.frame(pca_df)) 

print(pca_glm)
