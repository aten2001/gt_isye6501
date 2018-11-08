# Homework 11 - Optimization
## Question 15.2
In the videos, we saw the "diet problem". (The diet problem is one of the first large-scale optimization
problems to be studied in practice. Back in the 1930's and 40's, the Army wanted to meet the nutritional
requirements of its soldiers while minimizing the cost.) In this homework you get to solve a diet problem
with real data. The data is given in the file `diet.xls`.
  
  1. Formulate an optimization model (a linear program) to find the cheapest diet that satisfies the
maximum and minimum daily nutrition constraints, and solve it using PuLP. Turn in your code
and the solution. (The optimal solution should be a diet of air-popped popcorn, poached eggs,
oranges, raw iceberg lettuce, raw celery, and frozen broccoli. UGH!)
  2. Please add to your model the following constraints (which might require adding more variables)
and solve the new model:
    - If a food is selected, then a minimum of 1/10 serving must be chosen. (Hint: now you will
need two variables for each food i: whether it is chosen, and how much is part of the diet.
You’ll also need to write a constraint to link them.)
    - Many people dislike celery and frozen broccoli. So at most one, but not both, can be
selected.
    - To get day-to-day variety in protein, at least 3 kinds of meat/poultry/fish/eggs must be
selected. [If something is ambiguous (e.g., should bean-and-bacon soup be considered
meat?), just call it whatever you think is appropriate – I want you to learn how to write this
type of constraint, but I don’t really care whether we agree on how to classify foods!]

If you want to see what a more full-sized problem would look like, try solving your models for the file
diet\_large.xls, which is a low-cholesterol diet model (rather than minimizing cost, the goal is to
minimize cholesterol intake). I don’t know anyone who’d want to eat this diet – the optimal solution
includes dried chrysanthemum garland, raw beluga whale flipper, freeze-dried parsley, etc. – which
shows why it’s necessary to add additional constraints beyond the basic ones we saw in the video!
[Note: there are many optimal solutions, all with zero cholesterol, so you might get a different one.
It probably won’t be much more appetizing than mine.]

### Response
First we need to load our packages, read in our data and take a peak at it so we
can get an idea of what it looks like and how to use it.

```python
import pulp
import pandas as pd

df = pd.read_excel('../data/diet.xls', sheet_name=0)
requirments = pd.read_excel('../data/diet.xls', sheet_name=1)

# Head of data
                 Foods  Price/ Serving      Serving Size  Calories  Cholesterol mg  Total_Fat g  Sodium mg  Carbohydrates g  Dietary_Fiber g  Protein g  Vit_A IU  Vit_C IU  Calcium mg  Iron mg
0      Frozen Broccoli            0.16         10 Oz Pkg      73.8             0.0          0.8       68.2             13.6              8.5        8.0    5867.4     160.2       159.0      2.3
1          Carrots,Raw            0.07  1/2 Cup Shredded      23.7             0.0          0.1       19.2              5.6              1.6        0.6   15471.0       5.1        14.9      0.3
2          Celery, Raw            0.04           1 Stalk       6.4             0.0          0.1       34.8              1.5              0.7        0.3      53.6       2.8        16.0      0.2
3          Frozen Corn            0.18           1/2 Cup      72.2             0.0          0.6        2.5             17.1              2.0        2.5     106.6       5.2         3.3      0.3
4  Lettuce,Iceberg,Raw            0.02            1 Leaf       2.6             0.0          0.0        1.8              0.4              0.3        0.2      66.0       0.8         3.8      0.1

# Requirements - min/max
#          Col1 Col2 Col3 Col4 Col5 Col6 Col7  Col8 Col9 Col10 Col11
# Minimum  1500   30   20  800  130  125   60  1000  400   700    10
# Maximum  2500  240   70 2000  450  250  100 10000 5000  1500    40
```
Now PuLP requires us to start the problem, then we need to create a few
dictionaries to hold the mapping between each food item and it's attribute like
cost and calories.

```python
# get list of properties each food item has
# out put looks like ['Calories', 'Cholesterol mg', 'Total_Fat g', ...]
prop_names =  list(df.iloc[:, 3:].columns)

# create a dictionary of varibles, basically each food item
# use pulp funtion to create variable that will determine amount of each food
# that should be eaten
food_vars = pulp.LpVariable.dicts("Food", df.loc[:, 'Foods'], 0)

# create a dict of how much each costs
food_price = {x:y for x,y in df.loc[:, ['Foods', 'Price/ Serving']].values}

# create a list of dictionaries each that holds the property value
food_properties = [{food_name:val for food_name,val in zip(df.loc[:, 'Foods'],
    df.loc[:, col])} for col in prop_names]

# Objective function
prob += pulp.lpSum([food_price[food]*food_vars[food] 
    for food in df.loc[:, 'Foods']]), 'Total cost of diet'
```

`Food_properties` is a list of dictionaries. Each index holds the dictionary
that maps the food item to the property starting at calories and going to the
end of the dataframe. So `food_properties[0]` is the dictionary that looks
similar too `{'Frozen Broccoli': 73.8, 'Carrots,Raw':23.7,...}`. I realize after
I finished the code that I didn't need to make my code so confusing, but I was
trying to follow an example on the PuLP 

Next we have to add the constraints to our problem after our objective function.
For each attribute we'll need to sum all of the food's properties together and
then apply a max and a min. 

```python
for i,prop_dict in enumerate(food_properties):
# add min value for property as a constraint
    prob += pulp.lpSum([prop_dict[food]*food_vars[food] 
        for food in df.loc[:, 'Foods']]) >= requirments.loc[0, 
           prop_names[i]], 'Min'+prop_names[i]
# add max value for property as a constraint
    prob += pulp.lpSum([prop_dict[food]*food_vars[food] 
        for food in df.loc[:, 'Foods']]) <= requirments.loc[1,
            prop_names[i]], 'Max'+prop_names[i]
```
Now that our problem is all set up we solve and write the outputs.

```python
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


## Output:
# Status: Optimal
# Food_Celery,_Raw = 52.64371
# Food_Frozen_Broccoli = 0.25960653
# Food_Lettuce,Iceberg,Raw = 63.988506
# Food_Oranges = 2.2929389
# Food_Poached_Eggs = 0.14184397
# Food_Popcorn,Air_Popped = 13.869322
# Total Cost of Ingredients per can =  4.337116797399999
```

### Part 2
The Second part of our problem is very similar with a few additions before we
call `prob.solve()`. Add the following lines to add binary variables or 
_switches_ to the code. This will allow us to say, 'If variable is selected, the
amount must be at least 0.1', or the like. 

```python
food_selected = pulp.LpVariable.dicts("isSelected", food_items, cat="Binary")

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
```
The key is the `for` loop in the middle that ensures no food is above the
maximum amount of calories. But by adding a min and max to the amount that are
controlled by a binary variable, it ensures that if the variable is not
selected, the amount is not greater than or less than 0, i.e. it is not given an
amount. Now, once we solve we get the following results. 

```sh
Status: Optimal
Food_Celery,_Raw = 42.399358
Food_Kielbasa,Prk = 0.1
Food_Lettuce,Iceberg,Raw = 82.802586
Food_Oranges = 3.0771841
Food_Peanut_Butter = 1.9429716
Food_Poached_Eggs = 0.1
Food_Popcorn,Air_Popped = 13.223294
Food_Scrambled_Eggs = 0.1
isSelected_Celery,_Raw = 1.0
isSelected_Kielbasa,Prk = 1.0
isSelected_Lettuce,Iceberg,Raw = 1.0
isSelected_Oranges = 1.0
isSelected_Peanut_Butter = 1.0
isSelected_Poached_Eggs = 1.0
isSelected_Popcorn,Air_Popped = 1.0
isSelected_Scrambled_Eggs = 1.0
Total Cost of Ingredients per can =  4.512543427000001
```
