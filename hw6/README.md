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
The instructions say to present the coefficients in terms of the original features. Each Principal 
Component is a linear combination or rotation of the original features. So we can get your linear model as:

```R
factors <- crime_pca$rotation
for (i in 1:15) {
  factors[, i] * pca_glm$coefficients[i+1]  
}
```
Then our model is the summation of the dot product of  the entry of each of the original
fifteen features and each of the vectors below plus intercept `905.08511`.
```
         x1         x2           x3         x4         x5          x6         x7
-0.30371194  0.06280357  0.1724199946 -0.02035537 -0.35832737 -0.449132706 -0.15707378
-0.33088129 -0.15837219  0.0155433104  0.29247181 -0.12061130 -0.100500743  0.19649727
 0.33962148  0.21461152  0.0677396249  0.07974375 -0.02442839 -0.008571367 -0.23943629
 0.30863412 -0.26981761  0.0506458161  0.33325059 -0.23527680 -0.095776709  0.08011735
 0.31099285 -0.26396300  0.0530651173  0.35192809 -0.20473383 -0.119524780  0.09518288
 0.17617757  0.31943042  0.2715301768 -0.14326529 -0.39407588  0.504234275 -0.15931612
 0.11638221  0.39434428 -0.2031621598  0.01048029 -0.57877443 -0.074501901  0.15548197
 0.11307836 -0.46723456  0.0770210971 -0.03210513 -0.08317034  0.547098563  0.09046187
-0.29358647 -0.22801119  0.0788156621  0.23925971 -0.36079387  0.051219538 -0.31154195
 0.04050137  0.00807439 -0.6590290980 -0.18279096 -0.13136873  0.017385981 -0.17354115
 0.01812228 -0.27971336 -0.5785006293 -0.06889312 -0.13499487  0.048155286 -0.07526787
 0.37970331 -0.07718862  0.0100647664  0.11781752  0.01167683 -0.154683104 -0.14859424
-0.36579778 -0.02752240 -0.0002944563 -0.08066612 -0.21672823  0.272027031  0.37483032
-0.25888661  0.15831708 -0.1176726436  0.49303389  0.16562829  0.283535996 -0.56159383
-0.02062867 -0.38014836  0.2235664632 -0.54059002 -0.14764767 -0.148203050 -0.44199877
        x8         x9        x10        x11        x12        x13        x14
-0.55367691  0.15474793 -0.01443093  0.39446657  0.16580189 -0.05142365  0.04901705
 0.22734157 -0.65599872  0.06141452  0.23397868 -0.05753357 -0.29368483 -0.29364512
-0.14644678 -0.44326978  0.51887452 -0.11821954  0.47786536  0.19441949  0.03964277
 0.04613156  0.19425472 -0.14320978 -0.13042001  0.22611207 -0.18592255 -0.09490151
 0.03168720  0.19512072 -0.05929780 -0.13885912  0.19088461 -0.13454940 -0.08259642
 0.25513777  0.14393498  0.03077073  0.38532827  0.02705134 -0.27742957 -0.15385625
-0.05507254 -0.24378252 -0.35323357 -0.28029732 -0.23925913  0.31624667 -0.04125321
-0.59078221 -0.20244830 -0.03970718  0.05849643 -0.18350385  0.12651689 -0.05326383
 0.20432828  0.18984178  0.49201966 -0.20695666 -0.36671707  0.22901695  0.13227774
-0.20206312  0.02069349  0.22765278 -0.17857891 -0.09314897 -0.59039450 -0.02335942
 0.24369650  0.05576010 -0.04750100  0.47021842  0.28440496  0.43292853 -0.03985736
 0.08630649 -0.23196695 -0.11219383  0.31955631 -0.32172821 -0.14077972  0.70031840
 0.07184018 -0.02494384 -0.01390576 -0.18278697  0.43762828 -0.12181090  0.59279037
-0.08598908 -0.05306898 -0.42530006 -0.08978385  0.15567100 -0.03547596  0.04761011
 0.19507812 -0.23551363 -0.29264326 -0.26363121  0.13536989 -0.05738113 -0.04488401
         x15
 0.0051398012
 0.0084369230
-0.0280052040
-0.6894155129
 0.7200270100
 0.0336823193
 0.0097922075
 0.0001496323
-0.0370783671
 0.0111359325
 0.0073618948
-0.0025685109
 0.0177570357
 0.0293376260
 0.0376754405
```

Kind of confusing to look at all of the numbers at once, but we can code this pretty good consicly. 
First, let's scale our sample and then we can use the numbers above to make our prediction. 

```R
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

# scale sample instead of coefficients 
sample <- (sample - crime_pca$center)/ crime_pca$scale

ans <- pca_glm$coefficients[1] + sum( factors%*%sample )  # about 900

cat("\n", "Answer:", ans, "\n")

Answer: 900.6613
```

Thus, **our answer is 900!** which is just below the average of the sample. This is much 
closer than our original prediction last week of around 150, which would be a potential 
outlier.  Unlike normal matrices, we know each of the columns in our new rotated matrix 
is orthogonal to each of the others so we don't need to test any feature selection. 


### Helpful Links
  - [PCA - I.T. Jolliffe](http://wpage.unina.it/cafiero/books/pc.pdf)  
  - [Explained Visually](http://setosa.io/ev/principal-component-analysis/)
