# Homework 9 - DOE & Probability
## Question 12.1
Describe a situation or problem from your job, everyday life, current events, etc., for which a design of
experiments approach would be appropriate.
## Question 12.2
To determine the value of 10 different yes/no features to the market value of a house (large yard, solar
roof, etc.), a real estate agent plans to survey 50 potential buyers, showing a fictitious house with
different combinations of features. To reduce the survey size, the agent wants to show just 16 fictitious
houses. Use R’s `FrF2` function (in the `FrF2` package) to find a fractional factorial design for this
experiment: what set of features should each of the 16 fictitious houses have? Note: the output of
`FrF2` is "1" (include) or "-1" (don’t include) for each feature.
## Question 13.1
For each of the following distributions, give an example of data that you would expect to follow this
distribution (besides the examples already discussed in class).
  -  Binomial  
  -  Geometric  
  -  Poisson  
  -  Exponential  
  -  Weibull  
## Question 13.2
In this problem you, can simulate a simplified airport security system at a busy airport. Passengers arrive
according to a Poisson distribution with λ<sub>1</sub> = 5 per minute (i.e., mean interarrival rate μ<sub>1</sub> = 0.2 minutes)
to the ID/boarding-pass check queue, where there are several servers who each have exponential
service time with mean rate μ<sub>2</sub> = 0.75 minutes. [Hint: model them as one block that has more than one
resource.] After that, the passengers are assigned to the shortest of the several personal-check queues,
where they go through the personal scanner (time is uniformly distributed between 0.5 minutes and 1
minute).
Use the Arena software (PC users) or Python with SimPy (PC or Mac users) to build a simulation of the
system, and then vary the number of ID/boarding-pass checkers and personal-check queues to
determine how many are needed to keep average wait times below 15 minutes. [If you’re using SimPy,
or if you have access to a non-student version of Arena, you can use λ<sub>1</sub> = 50 to simulate a busier airport.]
