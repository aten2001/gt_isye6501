# Homework 1

## Questions 2.1

_Describe a situation or problem from your job, everyday life, current events, etc., for which a classification model would be appropriate. List some (up to 5) predictors that you might use._

**ANSWER**: Classification is one of the major pillers machine learning stands on. 
From building up AI to classify images to investers classifying investments, 
these methods are everywhere. At my job we were working with an inssurance 
company to classify incidents. The insurance angency want to classify scenarios into different levels of risk, low, medium, and high. 
Features that we were able to use were a ranking of how labor intensive it was to vet the claim, 
the amount paid out in an average case previously, how prevelent or often the claim occured, 
and how many fraudulent cliams have been determined. Although it is impossible to know a total number of fraudlent claims it 
is related to how arduous it is to vet and adds to risk. This can save time and help make the insurance company make pricing choices  


## Questions 2.2

### Part 1
Equation to predict Y. 
```R
yHat = ( 0.08158492 -0.0010065348*A1 + -0.0011729048*A2 + -0.0016261967*A3 + 0.0030064203*A8 
      + 1.0049405641*A9 + -0.0028259432*A10 + 0.0002600295* A11 + 
      -0.0005349551* A12+ -0.0012283758*A14 + 0.1063633995*A15 )
```
Value for C used was 100. Error does not seem to decrease significantly from 1e-2 to 1e2. 

![ksvm-error-plot](/hw1/Rplot-ksvm-errors.png)


#### Code
```R
credit_data <- as.matrix( read.table(
  "credit_card_data-headers.txt", 
  header = TRUE, 
  sep = "\t"
  ) 
)

# Part 1.

# We want to find a good value for C below. We'll have to try a few and plot their
# results next to eachother to see which has the lowest error. % error here

my_ksvm <- function(data, c = 100, p = F){ 
  require(kernlab)
  # call ksvm. Vanilladot is a simple linear kernel.
  model <- ksvm(
    data[, 1:10], 
    data[, 11], 
    type = "C-svc", 
    kernel = "vanilladot", 
    C = c, 
    scaled = TRUE
  )
  
  # calculate a1…am
  a <- colSums(model@xmatrix[[1]] * model@coef[[1]])

  
  # calculate a0 ~ intercept 
  a0 <- -model@b
  
  if (p){
    print(a)  # print coefficients to console
    print("A0")
    print(a0)
  }
  
  # see what the model predicts
  pred <- predict(model, data[, 1:10])
  
  # see what fraction of the model’s predictions match the actual classification
  error <- model@error
}

c_vals <- c(1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1e0, 1e1, 1e2)
all_errors <- c()
counter <- 1
for (i in c_vals){
  c_error <- my_ksvm(data = credit_data, c = i)  
  all_errors[counter] <- c_error
  counter <- counter + 1
}
plot(x = c_vals, y= all_errors, log="x")

# Plot shows errors don't decrease much after 1e-2 to 1e2. 
# We'll just use C = 100 as provided in example. 

my_ksvm(data = credit_data, c = 100, p = T)
```

### Part 2
_optional_ Try out different kernals for the SVM to see if a soft boundry will improve accuracy. 
Increaseing the flexability of our kernal by making it nonlinear. I tried running the my same code 
looping through the different kernals. below are the results.

| Kernal   | Error             |
|:---------|------------------:|
|rbfdot    | 0.0412844036697247|
|polydot   | 0.136085626911315 |
|vanilladot| 0.136085626911315 |
|tanhdot   | 0.2782874617737   |
|laplacedot| 0                 |
|besseldot | 0.0749235474006116|
|anovadot  | 0.0932721712538226|
|splinedot | 0.0214067278287462|


As sceen above, the laplace kernal fits the data perfectly. The RBF and Spline kernals also perform 
very well. Nonlinear kernals are definitely something I should read more about for the future. 

### code

```R
my_ksvm <- function(data, c = 100, p = F, my_kernal="vanilladot"){ 
  require(kernlab)
  # call ksvm. Vanilladot is a simple linear kernel.
  model <- ksvm(
    data[, 1:10], 
    data[, 11], 
    type = "C-svc", 
    kernel = my_kernal, 
    C = c, 
    scaled = TRUE
  )
  
  # calculate a1…am
  a <- colSums(model@xmatrix[[1]] * model@coef[[1]])

  
  # calculate a0 ~ intercept 
  a0 <- -model@b
  
  if (p){
    print(a)  # print coefficients to console
    print("A0")
    print(a0)
  }
  
  # see what the model predicts
  pred <- predict(model, data[, 1:10])
  
  # see what fraction of the model’s predictions match the actual classification
  error <- model@error
}

c_vals <- 100
kernals <- c('rbfdot', 'polydot', 'vanilladot', 'tanhdot', 'laplacedot', 'besseldot', 'anovadot', 'splinedot')

all_errors <- c()
counter <- 1
for (kern in kernals){
 #print(kern)
 k_error <- my_ksvm(
     data = credit_data, 
     c = c_vals, 
     my_kernal=kern
 )  
 all_errors[counter] <- k_error
 counter <- counter + 1
 print(paste(kern, ": ", k_error, sep=""))
}

```
### Part 3
See code for details. 

Best value for K appears to be 5 after trying 1 through 10. You can see the error quickly drops from 4 to 5 and then hovers around 14-15%. 

![knn-error-plot](/hw1/Rplot-knn.png)

#### Code
```R
## Part 3.  Use Knn to create a classification model.
# Goal: Suggest a good value for the number of neighbors.

my_data <- as.data.frame(credit_data)

my_knn <- function(data, my_k){
  require(kknn)  # make sure library is turned on
  my_predictions <- c()
  counter = 1
  for (i in 1:nrow(data)){
    model <- kknn(
      R1~.,                 # use name of columns to define function
      train = data[-i, ],   # train on dataset leaving point out. 
      test = data[i, ],     # predict on point left out
      k = my_k,             # number of neighbors to use.
      scale = T
    )
    
    # kknn will produce a float and we want the binary classification. 
    # So we will round our fitted value/prediction. 
    my_predictions[counter] <- round(model$fitted.values)
    counter <- counter + 1
  }
  
  # count how many are different and divide by how many there are.
  my_error <- (sum(abs(my_predictions - data[, 11])) / nrow(data) )
  print(paste("K: ", k))
  print(paste("error: ", my_error))
  return(my_error)
}

k_error <- c()
k_counter <- 1
for (k in seq(1, 10, by=1)) {
  current_error <- my_knn(data= my_data, my_k = k)
  k_error[k_counter] <- current_error
  k_counter <- k_counter + 1
}

plot(x= 2:10, y = k_error)

# Best K appears to be 5. 
```
