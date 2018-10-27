# Homework 10 - Missing Data
## Question 14.1
The breast cancer data set breast-cancer-wisconsin.data.txt from
[UC Irvine](http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/)
([description](http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Original%29) has missing values.

<ol>
    <li>Use the mean/mode imputation method to impute values for the missing data.</li>
    <li>Use regression to impute values for the missing data.</li>
    <li>Use regression with perturbation to impute values for the missing data.</li>
    <li>(Optional) Compare the results and quality of classification models (e.g., SVM, KNN) build using</li>
    <ol type="i">
        <li>the data sets from questions 1,2,3;</li>
        <li>the data that remains after data points with missing values are removed; and</li>
        <li>the data set when a binary variable is introduced to indicate missing values.</li>
    </ol>
</ol>

## Question 15.1
Describe a situation or problem from your job, everyday life, current events, etc., for which optimization
would be appropriate. What data would you need?

### Answer:
As a contractor, I worked on a project where we had to write an algorithm to
schedule the maintenance of missle facilities. As one would expect, there are
storng regulation around how often these facilities need to be inspecated, which
parts can be used and the their quality. Their is added dificulty with time of
year, since it is much harder to perform maintenance in the winter and only a
few people have the skills necessary to perform this type of maintenance. All of
the constraints required us to perform a huristic optimization to create a  
maintenance schedule that would plan all manditory checks and replacements
required for the year in advance but leave cushion for spontanious events that
were bound to appear. Having major events planned in advance allowed the crew
and security team coordinate approperiatly and have all resources on time.
Planning in advance also allowed us to add cushion in each month by adding a
maximum amount of events allowed in a month to our optimization code.  
