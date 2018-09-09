# Homework 3

## Questions 5.1
__Question:__ Using crime data from the file uscrime.txt (http://www.statsci.org/data/general/uscrime.txt,
description at http://www.statsci.org/data/general/uscrime.html), test to see whether there are any
outliers in the last column (number of crimes per 100,000 people). Use the grubbs.test function in
the outliers package in R

__Answer__: in progress 

## Question 6.1
__Question:__ Describe a situation or problem from your job, everyday life, current events, etc., for which a Change
Detection model would be appropriate. Applying the CUSUM technique, how would you choose the
critical value and the threshold?

__Answer:__ CUSUM and change detection is a fundamental way of running a factory. 
[Control charts](http://asq.org/learn-about-quality/data-collection-analysis-tools/overview/control-chart.html) 
are common practice to ensure machines don't overload, processes aren't disrupted, and throughput is optimized. 
There are endless example similar to the microchip example from the lecture videos. More interesting to me is 
how airline companies use sensors to monitor the status of their planes, much like the train example from class. 
Airplanes are catastrophic if one breaks in the air, and expensive to have them out of commision for extended periods 
between flights. It is often far cheaper and faster to replace them between flights before a complete failure. 
However, plane components are expensive and air line companies opperate on low margins, so replacing parts too 
often can also cause problems. Since planes cool off and are inspected between flights, we can expect less 
failure rates at the beggining of a flight as opposed to the end of a flight. Thus, we could set the time (T) 
to check in more often over the duration of the flight. Each part/sensor would have its own threshold and 
critical value dependion on how paramount it is to flight, but I would assume the critical value would be set 
low. A false positive is a far greater alternative to having a plane fall out of the sky. 

## Question 6.2 
__Question(s):__
  1. Using July through October daily-high-temperature data for Atlanta for 1996 through 2015, use
a CUSUM approach to identify when unofficial summer ends (i.e., when the weather starts
cooling off) each year. You can get the data that you need from the file temps.txt or online,
for example at http://www.iweathernet.com/atlanta-weather-records or
https://www.wunderground.com/history/airport/KFTY/2015/7/1/CustomHistory.html . You can
use R if you’d like, but it’s straightforward enough that an Excel spreadsheet can easily do the
job too.
  2. Use a CUSUM approach to make a judgment of whether Atlanta’s summer climate has gotten
warmer in that time (and if so, when).

__Answer__: in progress
