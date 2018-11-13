// vim: tw=120:
# Homework 12
## Question 18.1
Describe analytics models and data that could be used to make good recommendations to the power 
company.
Here are some questions to consider:
  - The bottom-line question is which shutoffs should be done each month, given 
  the capacity constraints.  One consideration is that some of the capacity - 
  the workers' time - is taken up by travel, so maybe the shutoffs can be scheduled 
  in a way that increases the number of them that can be done.
  - Not every shutoff is equal.  Some shutoffs shouldn't be done at all, because 
  if the power is left on, those people are likely to pay the bill eventually.  
      How can you identify which shutoffs should or shouldn’t be done?  And 
    among the ones to shut off, how should they be prioritized? 
    
Think about the problem and your approach. Then talk about it with other learners, 
and share and combine your ideas.  And then, put your approaches up on the 
discussion forum, and give feedback and suggestions to each other.  You can 
use the {given, use, to} format to guide the discussions: Given {data}, use {model} to {result}.

### Response
#### Step 1
  - **Given:** 
    - Missed bill before? - Binary
    - If bill missed before, did they pay it back later? - Binary, used to split between difference of those who will
      never pay back and those who have a hard time paying bills in general but mean to pay back.
    - Credit score - Integer in [300 , 850]
    - Number of continuous months unpaid - count data, Poisson or Negative Binomial. Expect most to be 1.
    - Amount owed - Positive number, you'd expect someone to be extremely in the hole to be most likely to not be able to repay.
    - Has the customer contacted the power company about the late/missing payment - binary yes/no
    - I beleive power companies look at your credit report or can so they may be able to glean the **following:**
      - Estimated income
      - estimated rent or mortgage payment
      - amount of total debt owed
      - have they been sent to collections by someone else previously
    - Clustering results (from KNN or DBSCAN as input for logistic regression input)
  - **use:**Logistic Regression Model(s), a clustering algorithm to feed one of the logistic models
  - **to:** To create different confidence intervals likely hood to pay back the power company, and one to determine if its
    possible for a customer to pay back the power company. Remember, we only want to turn the power off if they have the
    ability to the power company but choose not too. 

Our dataset we'll be analyzing is the collectoin of customers that currently
owe the power company money regardless if this is their first missed bill or
their hundreth. Because we want to avoid as many false positives (turning power
off on those who were going to pay the company back), we want to use a model
where we are able to easily move our cutoff point to allow for more Type I error
so we can further reduce our Type II error. These models include, Support Vector Machines (SVMs), Logistic Regression,
and Quadradic Discriminant Analysis (QDA). We will not use QDA since it assumes the predictor matrix, _X_, is drawn from
a Normal Distribution while we are likely to have categorical or poisson distributed features. SVMs are very cool and
generally good models when we have a large data set but can be hard to explain to the general public. Mapping a data set
into higher dimensional feature space allowes the SVM to draw a line in the gaps between groups, but is hard for people
to invision. SVM are, generally,  non-probabalistic models which prevent us from drawing different confidence lines. I
wish to have different levels of confidence to help us set our priority list determining which customers should have
their power turned off first. I am not considering Descision Trees since they are imfamous for overfitting and I'm
avoiding using a Random Forest because it doesn't give me the control over the types of error as I would like (i.e. I
cannot focus on minimizing type II error as easily).  This leaves Logistic Regression as our main model to create
probabilities of who is likely to pay back the company next month. Before running this model, we should first use the
data collected to produce a model that suggests whether the customer is able to pay back the power company. We should
tend to use a higher cutoff point as there will be some subjectivity used here. Aggragating all of the information above
and making estimates of bills, debts, income and using a clustering method like KNN or DBSCAN to cluster people (dangerous to do this
read [Weapons of Math Destruction](https://www.amazon.com/Weapons-Math-Destruction-Increases-Inequality/dp/0553418815)
) to see if people appear as though they are able to pay back the company. Once we have an estimate on whether or not
someone is likely to be able to pay back the power company, we can create a logistic model to predict whether or not
they will pay back the power company. Again, we should use caution and use a high cutoff probability as to whether or
not someone will pay the company back. After the moral argument and social consequences, it is far more costly to turn
someones power off erroneously. 
#### Step 2
  - **Given:** Amount owed by customer with probability outputs from Logistic model
  - **use:** Decision Tree with regression models at the nodes
  - **to:** create estimates on the potential cost of not turning off a customers power and produce a priority ranking for
    each customer

Now that we have probabilities for each customer to pay back the power company, we have to make a choice. Our first
option is to set a single cutoff and only prioritize those we classify as not going to pay back the company. Then,
create a regression model to predict the amount of money each customer that is expected to not pay would owe. 

The second options is to set multiple cutoffs to create different levels of confidence. For example, we could have three 
sections where each customer will be assigned a weight of 0.33, 0.67 or 1 depending on which section they fall in. Then
for each of the three sections you can predict how much they are likely to owe the company by creating three distinct 
regression models. Potentially more scientific would be to use software to create a decision tree on the logistic model
output along with the other data collected and create a regression model at each node or leaf. For the leaves that
corespond with customers of a lower confidence level we would add a penalty or subtract away expected money owed to
emphesize this point. This may happen already with some of the predictions come through as 0 since they are likely to
pay back the company, it's hard to tell without actually creatng the models.  A single decision tree is
still easily explainable to a general listener, however depending on the sample size we may end up overfitting the data.
We have now cut the data down many times, and not many people default in the first place. One would have to check at
this point using a test and validation set or cross-validation to make sure. 
#### Step 3
  - **Given:** Projected costs and locations of customers 
  - use Density Based Clustering (DBSCAN)
  - to identify areas or clusters that can be shut down together or by a single employee  to save the company 
  the most money at once. 

_May be illegal to cluster on location because it can be linked to ethnicity and religion._

If you know where everyone lives, then you could use a density based clustering algorithm like DBSCAN or OPTICS
algorithm to create clusters and then sum up the amount of money owed by the entire cluster. Then the power company
would be able to target the largest clusters in order to optimize their returns.

#### Alternative
  - Given the amount owed by customer and the mean/estimated drive time to each other customer
  - Use Network/Graph Optimization problem (considered easily solvable like linear optimizatoin)
  - **to:** determine which groups of customers can be reached in the month that will maximize the estimated savings to the
    power company. 

#### Step 4
  - **Given:** The above models, probability distributions,  and data
  - **use:** Simulation
  - **to:** test our hypothesis against real life data to ensure accurate decision making. 
