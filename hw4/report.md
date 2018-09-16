# Homework 4

# Question 7.1
**Question:** Describe a situation or problem from your job, everyday life, current events, etc., for which exponential
smoothing would be appropriate. What data would you need? Would you expect the value of α (the
first smoothing parameter) to be closer to 0 or 1, and why?

**Answer:** At my job we create performance management applications to monitor 
specific business lines. One of the business lines we monitor is hospital performance. One major thing we track is the infeciton ration inside the ICU & different wards. The data would be the number and percent of people in the hosiptal that 
have or got an infection since entering the hospital. It's important to keep 
this in check and avoid a large outbreak across the hospital. Since infections 
are mostly easy to identify and are being reported by doctors we generally 
assume little noise in the data which means we'd try to use a larger alpha 
closer to 1. In addition, in hospitals nurses are constantly checking in with 
patients and verifying information. This redundent checking, and importances of 
subject matter generally leads to low amounts of noise. 

# Question 7.2
**Question:** Using the 20 years of daily high temperature data for Atlanta (July through October) from Question 6.2
(file ```temps.txt```), build and use an exponential smoothing model to help make a judgment of whether
the unofficial end of summer has gotten later over the 20 years. (Part of the point of this assignment is
for you to think about how you might use exponential smoothing to answer this question. Feel free to
combine it with other models if you’d like to. There’s certainly more than one reasonable approach.)
Note: in R, you can use either ```HoltWinters``` (simpler to use) or the ```smooth``` package’s ```es``` function
(harder to use, but more general). If you use es, the Holt-Winters model uses ```model=”AAM”``` in the
function call (the first and second constants are used “A”dditively, and the third (seasonality) is used
“M”ultiplicatively; the documentation doesn’t make that clear).

**Answer:**
