# Homework 6 - PCA

## Question 9.1
Using the same crime data set uscrime.txt as in Question 8.2, apply Principal Component Analysis
and then create a regression model using the first few principal components. Specify your new model in
terms of the original variables (not the principal components), and compare its quality to that of your
solution to Question 8.2. You can use the R function prcomp for PCA. (Note that to first scale the data,
you can include scale. = TRUE to scale as part of the PCA function. Don’t forget that, to make a
prediction for the new city, you’ll need to unscale the coefficients.

**Answer:** We are using the US crimes data set again. This dataset looks like the following. 

```R
crimes_df <- read.table("uscrime.txt", header=T)
print(head(crimes_df))

     M So   Ed  Po1  Po2    LF   M.F Pop   NW    U1  U2 Wealth Ineq     Prob    Time Crime
1 15.1  1  9.1  5.8  5.6 0.510  95.0  33 30.1 0.108 4.1   3940 26.1 0.084602 26.2011   791
2 14.3  0 11.3 10.3  9.5 0.583 101.2  13 10.2 0.096 3.6   5570 19.4 0.029599 25.2999  1635
3 14.2  1  8.9  4.5  4.4 0.533  96.9  18 21.9 0.094 3.3   3180 25.0 0.083401 24.3006   578
4 13.6  0 12.1 14.9 14.1 0.577  99.4 157  8.0 0.102 3.9   6730 16.7 0.015801 29.9012  1969
5 14.1  0 12.1 10.9 10.1 0.591  98.5  18  3.0 0.091 2.0   5780 17.4 0.041399 21.2998  1234
6 12.1  0 11.0 11.8 11.5 0.547  96.4  25  4.4 0.084 2.9   6890 12.6 0.034201 20.9995   682
```

Now we can compute the [Singular Value Decomposition](http://www2.imm.dtu.dk/pubdb/views/edoc_download.php/4000/pdf/imm4000)
```R
# compute PCA (SVD) 
crime_pca <- prcomp(
  crimes_df[, -ncol(crimes_df)], 
  center = T, 
  scale = T
)
```
Let's check out what our scaling looks like since we'll use these later:
``R
print("scale")
print( crime_pca$scale )     # scaling used. 
           M           So           Ed          Po1          Po2           LF          M.F 
  1.25676339   0.47897516   1.11869985   2.97189736   2.79613186   0.04041181   2.94673654 
         Pop           NW           U1           U2       Wealth         Ineq         Prob 
 38.07118801  10.28288187   0.01802878   0.84454499 964.90944200   3.98960606   0.02273697 
        Time 
  7.08689519 
```

Those are the values that we divide the corresponding column by to make sure they are on a similar 
scale.  Before doing anything more with these values, let's create our linear model. 

```R
pca_df <- cbind(crime_pca$x, crimes_df[, ncol(crimes_df)])  # add response
colnames(pca_df)[ncol(pca_df)] <- "response"
pca_glm <- glm(response ~ ., data = as.data.frame(pca_df)) 

# check the coefficients
print(pca_glm$coefficients)

(Intercept)         PC1         PC2         PC3         PC4         PC5         PC6         PC7 
  905.08511    65.21593   -70.08312    25.19408    69.44603  -229.04282   -60.21329   117.25590 
        PC8         PC9        PC10        PC11        PC12        PC13        PC14        PC15 
   28.71656   -37.17564    56.31771    30.59374   289.61333    81.78638   219.18679  -622.21208 
 ```
