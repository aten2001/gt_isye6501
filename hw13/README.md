# Homework 13
## Question 19.1 (Only Question)

Describe analytics models and data that could be used to make good recommendations to the retailer.  
How much shelf space should the company have, to maximize their sales or their profit?

Of course, there are some restrictions - for each product type, the retailer imposed a minimum amount 
of shelf space required, and a maximum amount that can be devoted; and of course, the physical size of 
each store means there’s a total amount of shelf space that has to be used.  But the key is the division of 
that shelf space among the product types. 

For the purposes of this case, I want you to ignore other factors - 
for example, don’t worry about promotions for certain products, and don’t consider the fact that some 
companies pay stores to get more shelf space. Just think about the basic question asked by the retailer, 
and how you could use analytics to address it.  

As part of your answer, I'd like you to think about how to 
measure the effects.  How will you estimate the extra sales the company might get with different amounts 
of shelf space - and, for that matter, how will you determine whether the effect really exists at all? 
Maybe the retailer's hypotheses are not all true - can you use analytics to check?  

Think about the problem 
and your approach.  Then talk about it with other learners, and share and combine your ideas.  And then, 
put your approaches up on the discussion forum, and give feedback and suggestions to each other.  
You can use the {given, use, to} format to guide the discussions: Given {data}, use {model} to {result}.

One of the key issues in this case will be data - in this case, thinking about the data might be harder 
than thinking about the models. 

## Response

We want to optimize the profit to the store based off of an optimization model.
This is obvious and we can create a small small outline of the optimization
problem.

The Objective Function:
Maximize Profit (Items sold multiplied by their price)

Potential constriants (but not limited too):
  - Square footage of total shelf space
  - minimal amount of shelf space per item
  - maxmimum distance between two items
  - One item has proportional shelf space as another, e.g.If item A has X
    shelf space, Item B has 1.5*X shelf space. 
  - Only X or Y can be on the shelf. E.g. choose Coke or Pepsi
  - Max of Y brands for item X. E.g. you can only have three brands of bread.
    Else, you may end up with a store of just bread.
  - Must have at least these X items. E.g. Store must have at least eggs, bread,
    and milk

The constraints will have to be adjusted depending on different analysis. We
could also try to use a correlation matrix to see if any items are related. We
could also use the previous months where we have the data for which products
where on the shelves and how much space they were given. You could then use
ridge regession to help determine the importance of individual items/products.
Ridge regression will leave larger coefficients on the features that explain the
most variance in the response, profit that month.

I want to point out that it is important to point out we want to avoid standard
variable selection methods. Lasso Regression has the propensity to remove one of
two variables if they are highly correlated. In our case, this may be bad. We
would want to sell items together if they are correlated to increase sales and
then profit. Thus, this is a bad idea in our model. 

Instead, we'll want to take an A/B testing or multi arm bandet approach to
stocking our shelves. We could update the shelf space at the end of each week or
month depending on how often the store recieves shipments to test product groups
head to head. This will allow us to convert customers as we go and gain
information to add to our optimization problem and to our similuation we will
build. 

Like many optimization and real life problems, creating a simulation is an
excellant idea. This allows us to test many possibilities concurently with the
real world to see if our optimization problem will meet customer demand and
patters. We also create a feedback loop where we can use optimization to feed
our real life shelving problem, which we'll use to check the results of our
simulation which will test the results of our optimization problem. This will
allow us to quickly iterate to a true optimal solution since we are bound to
start the problem missing information. 
