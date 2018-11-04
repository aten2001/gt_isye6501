#!/usr/bin/env python

# PULP documentation:
# https://pythonhosted.org/PuLP/CaseStudies/a_blending_problem.html

import pulp
import pandas as pd

df = pd.read_excel('../data/diet.xls')

print(df.head())

prob = LpProblem("The Army Diet Problem", LpMinimize)

# Variables: LpVariable("name", lower_bound, upper_bound, discrete | continuous)
# options LpContinuous or LpInteger
