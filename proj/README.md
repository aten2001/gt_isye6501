# Class Project
Bellow is the class project which asks the students to go explore real world
problems and analyze approaches and solutions that may or were used. 

## Project Instructions

This project should be done individually.
The web sites: 
  - [SAS](https://www.sas.com/en_us/customers.html)
  - [IMB](https://www.ibm.com/case-studies)
  - [Informs](https://www.informs.org/Impact/O.R.-Analytics-Success-Stories)
  
among others, contain  brief overviews of some major Analytics success 
stories.  In this course project, your job is to think carefully about what analytics models and data might 
have been required.

<ol type="1">
 <li>
 Browse the short overviews of the projects.  Read a bunch of them –
 they’re really interesting.  
 But don’t try to read them all unless you have a lot of spare time; there are lots!
 </li>
 <li>
 Pick a project for which you think at least three different Analytics models might have been 
 combined to create the solution.
 </li>  
<li>
Think carefully and critically about what models might be used to create the solution, how they 
would be combined, what specific data might be needed to use the models, how it might be 
collected, and how often it might need to be refreshed and the models re-
run.  
DO NOT find a description online (or elsewhere) of what the company or organization actually did. 
 I want this project to be about your ideas, not about reading what someone else did.
  </li>
  <li>
Write a short report describing your answers to (3).
  </li>
</ol>


## Response
[option
1](https://www.informs.org/Impact/O.R.-Analytics-Success-Stories/The-New-York-City-Off-Hours-Deliveries-Project-A-Business-and-Community-Friendly-Sustainability-Program)
NYC Delivery project. 
#### Step 1
  - Given: business addresses or locations in New York City (NYC)
  - Use: Clustering algorithms, probably SVM or KNN. 
  - To: Cluster businesses together that are physically close to each other and
    may impact one other's shipping times and have similar delivery routes. 
NYC is large and there are millions of businesses. Places that are similar in
geographic location will have similar delivery times and problems since drivers
will take similar or the same roads to get there. Businesses in the same
industry even more so since they may even have the same exact supplier.
Grouping businesses together that are in upper Manhattan will have different
routes than those in lower Manhattan since drivers are likely to take a
different bridge onto the Island. In addition, these business can have an impact
on each other that will be easier to identify if we have the clustered together. 

#### Step 2
  - Given: business addresses or locations in New York City (NYC), average or
    current traffic patters, any construction or event that would prevent the
    use of a road. 
  - Use: [Map routing optimization](https://en.wikipedia.org/wiki/Vehicle_routing_problem)
  - To: Identify optimal routes for delivery 
> Tens of thousands of vehicle routing problems (VRPs) had to be solved for Manhattan, to complete a single iteration of the BMS.

Depending the time of day, traffic, events going on in the city, accidents,
and the hours it takes to deliver (because drivers can only be on the road for
so long) many different routes need to be considered. There are many ways to get
around NYC and finding the best route can be difficult. This will end up being a
small piece that we will reuse in our simulation, as you can see from the quote
extracted from the article. 

#### Step 3
  - Given: 
    - Number, or estimated, of delivers in a day and week
    - Number of stores, facilities, and businesses
    - their locations
    - Historic Traffic patters
    - VRP output
    - gas prices
    - Average MPG for freight trucks
    - Average shipping cost per mile
    - Distributions of the data
  - Use: Simulation models
  - To: simulate the results of starting deliveries at different times and adding
    restrictions to when deliversy can be some.

Changing when deliveries may start or creating a window where they are allowed
to be delivered will create different results. In addition to changing the width
of the window of delivery, we can see how many deliveries are possible and how
much it will cost. Because of randomness this simulation will have to be run
many times to try and get an accurate prediction of is the best time to have a
window of delivery and quantify how much better it. It's important to see if a
change in when deliveries should be done is _worth_ it. If we are only going to
find a 1% improvement in efficiency, it may not be worth the hassle to add more
regulation to the delivery industry. Currently drivers have a limit on the
amount of hours they are able drive in a given day and some limitations on the
roads they may use, depending the truck size. We also need to quantify it to
select a winner. If there are three or four solutions that are better than the
chaos that was going on, how do they know which is best? 

Since many of these variables are not constant the team would have to do some
research into the distribution the data would fall into. For example, the
arrival rate of trucks to a given area of the city may follow an exponential
rate, which would mean the amount that arrive is Poisson. However, they may find
it follows more of a normal distribution, not likely but possible. The same for
Traffic for a given part of the city at a particular time of day. This would all
be needed to compute an accurate simulation of everything. 

The simulation must be run on and checked with historical data to ensure we have
an accurate model. If we cannot simulate historic patterns and results, we won't
be able to have any confidence in our recommendations. 

#### Step 4
  - Given: Behavior research results
  - Use: Behavioral microsimulation (BMS) 
  - To: Simulate how receivers and carriers will feel about a change in the 
  approved delivery window

> The team conducted extensive behavioral research on how receivers and carriers
> would respond to policy measures intended to foster OHD, and integrated the
> chief findings of the research in a behavioral microsimulation (BMS).

The proposed change to have delivery window, having all deliveries be over
night between 7:00PM-6:00AM, could be very hard on the drivers and receivers.
This means someone will have to be at the store to receive the delivery and
drivers are forced to work third shift, driving all night and becoming basically
nocturnal. Many people would likely not want to work this full time. It is hard
to quantify how dissatisfied the carriers and receivers may be which is why they
needed to run many simulations. However, it's important to know the sentiment of
the workforce to make sure there is not a massive protest, walkout or people
leaving. This would or could be far more detrimental than leaving the delivery
schedule the way it is. 

### Conclusion
They did end up implementing the delivery schedule of 7PM-6AM to many carriers
and receivers but is not obligatory. Those who have implemented the system have
been having more consistent deliveries, cheaper, less carbon emissions, and
car accidents. NYCDOT hopes to expand their OHD program after the success thus
far.  
