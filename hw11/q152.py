#!/usr/bin/env python

# PuLP documentation:
# https://pythonhosted.org/PuLP/CaseStudies/a_blending_problem.html

import pulp
import pandas as pd

df = pd.read_excel('../data/diet.xls', sheet_name=0)
requirments = pd.read_excel('../data/diet.xls', sheet_name=1)
#          Col1 Col2 Col3 Col4 Col5 Col6 Col7  Col8 Col9 Col10 Col11
# Minimum  1500   30   20  800  130  125   60  1000  400   700    10
# Maximum  2500  240   70 2000  450  250  100 10000 5000  1500    40

print(df.head())
print(requirments)
prob = pulp.LpProblem("The Army Diet Problem", pulp.LpMinimize)

# Variables: LpVariable("name", lower_bound, upper_bound, discrete | continuous)
# options LpContinuous or LpInteger

##############################    PART 1    ################################### 
## note to self, part 1 can be rewritten to just to the pandas dataframe. No
## need to dictionaries when you can index with .loc[]

# get list of properties each food item has
prop_names =  list(df.iloc[:, 3:].columns)
# create a dictionary of varibles, basically each food item
food_vars = pulp.LpVariable.dicts("Food", df.loc[:, 'Foods'], 0)
# create a dict of how much each costs
food_price = {x:y for x,y in df.loc[:, ['Foods', 'Price/ Serving']].values}
# create a list of dictionaries each that holds the property value
food_properties = [{food_name:val for food_name,val in zip(df.loc[:, 'Foods'],
    df.loc[:, col])} for col in prop_names]

# Objective function
prob += pulp.lpSum([food_price[food]*food_vars[food] 
    for food in df.loc[:, 'Foods']]), 'Total cost of diet'

for i,prop_dict in enumerate(food_properties):
# add min value for property as a constraint
    prob += pulp.lpSum([prop_dict[food]*food_vars[food] 
        for food in df.loc[:, 'Foods']]) >= requirments.loc[0, 
           prop_names[i]], 'Min'+prop_names[i]
# add max value for property as a constraint
    prob += pulp.lpSum([prop_dict[food]*food_vars[food] 
        for food in df.loc[:, 'Foods']]) <= requirments.loc[1,
            prop_names[i]], 'Max'+prop_names[i]

# Write the output
prob.writeLP("smallDiet.lp")
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

##############################    PART 2    ################################### 
