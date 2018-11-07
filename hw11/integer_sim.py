#!/usr/bin/env python

'''
Helpful Links:

1. PuLP documentation:
https://pythonhosted.org/PuLP/CaseStudies/a_blending_problem.html

2. A stack overflow problem on integer problems
https://stackoverflow.com/questions/31410972/binary-integer-programming-with-pulp-using-vector-syntax-for-variables

3. Linear Programming with Python - Ben alex Keen
http://benalexkeen.com/linear-programming-with-python-and-pulp-part-5/
'''

import pulp
import pandas as pd

df = pd.read_excel('../data/diet.xls', sheet_name=0)
requirments = pd.read_excel('../data/diet.xls', sheet_name=1)

prob = pulp.LpProblem("The Army Diet Problem", pulp.LpMinimize)
food_items = list(df.loc[:, 'Foods'])

# get list of properties each food item has
prop_names =  list(df.iloc[:, 3:].columns)
# create a dictionary of varibles, basically each food item

# How much of the food
food_amount = pulp.LpVariable.dicts("Food", food_items, lowBound=0)
food_selected = pulp.LpVariable.dicts("isSelected", food_items, cat="Binary")

# create a dict of how much each costs
food_price = {x:y for x,y in df.loc[:, ['Foods', 'Price/ Serving']].values}
# create a list of dictionaries each that holds the property value
food_properties = [{food_name:val for food_name,val in zip(food_items,
    df.loc[:, col])} for col in prop_names]

# Objective function
#prob += pulp.lpSum([food_price[food]*food_amount[food]
#    for food in food_items]+ [food_selected[food] 
#        for food in food_items]), 'Total cost of diet'
prob += pulp.lpSum([food_price[food]*food_amount[food]
    for food in food_items]), 'Total cost of diet'


##############################    PART 2    ################################### 
## Introducing integer programming. Binaries to indicate inclusion

# Part 2.1 if a food is selected it has at least 1/10 serving. 
"""
If the food is selected, x1 = 1, then the amount, x2 >= 0.1 servings. Thus, if
x1 == 1 then x2 >= 0.1 = 1.1 - 1 = 1.1 - x1 = 1.1*x1 - x1

if x1 == 0 then x1+x2 =0+x2 >= 1.1*0=0 => x2=0
"""
for food in food_items:
    prob += food_selected[food]+food_amount[food] >= 1.1*food_selected[food], \
    'enough '+food+' requested'
    prob += food_amount[food]*food_properties[0][food] <=\
    2500*food_selected[food], 'not too much'+food

# part 2.2 At most either broccoli or celery can be chosen 
prob += food_selected['Frozen Broccoli'] + food_selected['Celery, Raw']  <=1,\
    'Have Celery or broccoli'

# part 2.3 at least three kinds of meats need to be included
meats = [
    'Bologna,Turkey', 
    'Chicknoodl Soup', 
    'Frankfurter, Beef', 
    'Ham,Sliced,Extralean', 
    'Hamburger W/Toppings', 
    'Hotdog, Plain', 
    'Kielbasa,Prk', 
    'Poached Eggs', 
    'Pork', 
    'Roasted Chicken', 
    'Scrambled Eggs', 
    'Tofu', 
    'Vegetbeef Soup', 
    'White Tuna in Water'
    ] 

prob += pulp.lpSum([food_selected[meat] for meat in meats])>=3,('At least three'
    'meats')

for i,prop_dict in enumerate(food_properties):
    # add min value for property as a constraint
    prob += pulp.lpSum([prop_dict[food]*food_amount[food] 
        for food in df.loc[:, 'Foods']]) >= requirments.loc[0, 
           prop_names[i]], 'Min'+prop_names[i]
    # add max value for property as a constraint
    prob += pulp.lpSum([prop_dict[food]*food_amount[food] 
        for food in df.loc[:, 'Foods']]) <= requirments.loc[1,
            prop_names[i]], 'Max'+prop_names[i]
# Write the output
prob.writeLP("smallDietPartII.lp")
# The problem is solved using PuLP's choice of Solver
prob.solve()
# The status of the solution is printed to the screen
print("Status:", pulp.LpStatus[prob.status])
# Each of the variables is printed with it's resolved optimum value
for v in prob.variables():
    if v.varValue > 0:
        print(v.name, "=", v.varValue)
# The optimised objective function value is printed to the screen
print("Total Cost of Ingredients per can = ", pulp.value(prob.objective))

