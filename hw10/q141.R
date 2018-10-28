#!/usr/bin/Rscript
# vim: ts=2 sw=2:


# Data & Libraries
#    #  Attribute                     Domain
#    -- -----------------------------------------
#    1. Sample code number            id number
#    2. Clump Thickness               1 - 10
#    3. Uniformity of Cell Size       1 - 10
#    4. Uniformity of Cell Shape      1 - 10
#    5. Marginal Adhesion             1 - 10
#    6. Single Epithelial Cell Size   1 - 10
#    7. Bare Nuclei                   1 - 10
#    8. Bland Chromatin               1 - 10
#    9. Normal Nucleoli               1 - 10
#   10. Mitoses                       1 - 10
#   11. Class:                        (2 for benign, 4 for malignant)


# Class distribution:
#  
#    Benign: 458 (65.5%)
#    Malignant: 241 (34.5%)
data_set <- read.csv(
  '../data/breast-cancer-wisconsin.data.txt',
  header=FALSE,
)

print(head(data_set))
# 699 by 11. 
cat(nrow(data_set), 'Rows and ', ncol(data_set), 'columns', '\n')

print(colSums(data_set == '?'))

# Column one is an ID number But we see from the following a few people appear
# more than once. 699 rows but only 645 unique. 
print(length(unique(data_set[, 1]))) # 645

n_occur <- data.frame(table(vocabulary$id))
n_occur[n_occur$Freq > 1,]
vocabulary[vocabulary$id %in% n_occur$Var1[n_occur$Freq > 1],]

# 1. use mean/mode to impute missing values

# 2. use regression to impute missing values

# 3. use regression with perturbation to impute missing values

# 4. (Optional) Compare the results of classification models of the previous
# three models, just removing the records with missing values, and when a binary
# variable is used to indicate missing values
