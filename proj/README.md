# Class Project
Bellow is the class project which askes the students to go explore real world
problems and analyze approaches and solutions that may or were used. 

## Project Instructions

This project should be done individually.
The web sites: 
  - [SAS](https://www.sas.com/en_us/customers.html)
  - [IMB](https://www03.ibm.com/software/businesscasestudies/us/en/corp)
  - [Informs](https://www.informs.org/Impact/O.R.-Analytics-Success-Stories)
  
among others, contain  brief overviews of some major Analytics success 
stories.  In this course project, your job is to think carefully about what ana
lytics models and data might 
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
would be combined, what specific data might be neede
d to use the models, how it might be 
collected, and how often it might need to be refreshed and the models re-
run.  
DO NOT find a description online (or elsewhere) of what the company or organization actually did. 
 I want this project to be about your ideas, not about reading what someone else did.
  </li>
  <li>
Write a short report describing your answers to (3).
  </li>
</ol>


## Reponse
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
Grouping businesses together that are in upper Manhatten will have different
routes than those in lower Manhattan since drivers are likely to take a
different bridge onto the Island. In addition, these business can have an impact
on each other that will be easier to identify if we have the clusterd together. 

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
around NYc and finding the best route can be difficult. This will end up being a
small piece that we will reuse in our simulation, as you can see from the quote
extracted from the article. 




[option
2](https://www.informs.org/Impact/O.R.-Analytics-Success-Stories/Industry-Profiles/Disney)

option 3. soy bean yeilds
