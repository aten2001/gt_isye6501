vim: tw=90:
# Homework 9 - DOE & Probability
## Question 12.1
Describe a situation or problem from your job, everyday life, current events, etc., for which a design of
experiments approach would be appropriate.
### Answer
In the field of marketing, A/B testing and DOE are very important. Often, you create an experiment to test which 
type of marketing plan will drive the most sales. You generally start a few months early, and create a random sample 
of potential customers and divied them into two groups. You then track to see whom in the groups purchase over the 
next one to two months and match those whom purchased something from your website against who you marketed to. 
You can then have a head to head winner. This can be repeated a few times or iterated over a year to try and find 
the best marketing schema for your product. That way you know when you deploy to the entire market, you have the 
highest, or at least a better idea, of your return on investment. The investment being the money you spend on 
the advertisments or whatever you deem best. It's very important to perform a solid DOE when doing this so your 
company doesn't spend large swaths of money on an inferior campain. The amount of complexity and factors included 
can vary wildly from product to product and company to company. 

    I just saw this is one of the examples used in the video. You may need DOE 
to help you pick the best stategy for a game you are trying to learn. Let's say you make
a bet with your friend Steve. You and Steve have been friends since childhood and you are
always competing with each other. He has been bragging about how good he is at the board
game Monopoly and you intend to teach him a lesson. Thus, leading up to D-Day you set up a
DOE to figure out the best way to win the game. You can test which color to go for, should
you make trades on certain properties, does the strategy change when there are four
players instead of two. You can even apply A/B test comparing the results of owning a
single color property for a whole game over another to compare the advantages of each. Of
course, Monopoly takes 87 hours per game and thus, this cannot actually be tested since it
would take more than a single persons life time to find the true solution. 

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
  -  Binomial - rolling an odd number on a die. Each roll is independent.
     'p=0.5' & `q=(1-p)=0.5`
  -  Geometric - Probability of winning the lottery `x` times. Hope you like small numbers 
  -  Poisson - The number of people to vote in an election. Definitely a non-negative
     whole number. Cannot be 1/2 a person and cannot have negative people. You can _kind_
     of assume independence
  -  Exponential - following the above, the distribution of people arriving to vote. 
  -  Weibull - failure rates over time huh... hmm dates of when someone will or the next drop out of
     gradschool. You'd expect k<1 because you would assume those not made out for grade
     school or those who are not enthusastic about the program will drop out early and
     then those who have put in a lot more time and are better at school will make it
     through.  
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
