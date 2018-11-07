\* The Army Diet Problem *\
Minimize
Total_cost_of_diet: 0.23 Food_2%_Lowfat_Milk + 0.16 Food_3.3%_Fat,Whole_Milk
 + 0.24 Food_Apple,Raw,W_Skin + 0.16 Food_Apple_Pie + 0.16 Food_Bagels
 + 0.15 Food_Banana + 0.67 Food_Beanbacn_Soup,W_Watr
 + 0.15 Food_Bologna,Turkey + 0.05 Food_Butter,Regular
 + 0.31 Food_Cap'N_Crunch + 0.07 Food_Carrots,Raw + 0.04 Food_Celery,_Raw
 + 0.25 Food_Cheddar_Cheese + 0.28 Food_Cheerios + 0.39 Food_Chicknoodl_Soup
 + 0.03 Food_Chocolate_Chip_Cookies + 0.28 Food_Corn_Flks,_Kellogg'S
 + 0.39 Food_Couscous + 0.65 Food_Crm_Mshrm_Soup,W_Mlk
 + 0.27 Food_Frankfurter,_Beef + 0.16 Food_Frozen_Broccoli
 + 0.18 Food_Frozen_Corn + 0.32 Food_Grapes + 0.33 Food_Ham,Sliced,Extralean
 + 0.83 Food_Hamburger_W_Toppings + 0.31 Food_Hotdog,_Plain
 + 0.15 Food_Kielbasa,Prk + 0.49 Food_Kiwifruit,Raw,Fresh
 + 0.02 Food_Lettuce,Iceberg,Raw + 0.17 Food_Macaroni,Ckd
 + 0.52 Food_Malt_O_Meal,Choc + 0.99 Food_New_E_Clamchwd,W_Mlk
 + 0.75 Food_Neweng_Clamchwd + 0.82 Food_Oatmeal + 0.09 Food_Oatmeal_Cookies
 + 0.15 Food_Oranges + 0.07 Food_Peanut_Butter + 0.53 Food_Peppers,_Sweet,_Raw
 + 0.44 Food_Pizza_W_Pepperoni + 0.08 Food_Poached_Eggs
 + 0.04 Food_Popcorn,Air_Popped + 0.81 Food_Pork
 + 0.22 Food_Potato_Chips,Bbqflvr + 0.06 Food_Potatoes,_Baked
 + 0.12 Food_Pretzels + 0.34 Food_Raisin_Brn,_Kellg'S
 + 0.32 Food_Rice_Krispies + 0.84 Food_Roasted_Chicken
 + 0.45 Food_Sardines_in_Oil + 0.11 Food_Scrambled_Eggs + 0.13 Food_Skim_Milk
 + 0.78 Food_Spaghetti_W__Sauce + 0.38 Food_Special_K
 + 0.67 Food_Splt_Pea&Hamsoup + 0.59 Food_Taco + 0.31 Food_Tofu
 + 0.27 Food_Tomato,Red,Ripe,Raw + 0.39 Food_Tomato_Soup
 + 0.19 Food_Tortilla_Chip + 0.71 Food_Vegetbeef_Soup + 0.05 Food_Wheat_Bread
 + 0.06 Food_White_Bread + 0.08 Food_White_Rice
 + 0.69 Food_White_Tuna_in_Water
Subject To
At_least_threemeats: isSelected_Bologna,Turkey + isSelected_Chicknoodl_Soup
 + isSelected_Frankfurter,_Beef + isSelected_Ham,Sliced,Extralean
 + isSelected_Hamburger_W_Toppings + isSelected_Hotdog,_Plain
 + isSelected_Kielbasa,Prk + isSelected_Poached_Eggs + isSelected_Pork
 + isSelected_Roasted_Chicken + isSelected_Scrambled_Eggs + isSelected_Tofu
 + isSelected_Vegetbeef_Soup + isSelected_White_Tuna_in_Water >= 3
Have_Celery_or_broccoli: isSelected_Celery,_Raw + isSelected_Frozen_Broccoli
 <= 1
MaxCalcium_mg: 296.7 Food_2%_Lowfat_Milk + 291.3 Food_3.3%_Fat,Whole_Milk
 + 9.7 Food_Apple,Raw,W_Skin + 3.1 Food_Apple_Pie + 21 Food_Bagels
 + 6.8 Food_Banana + 81 Food_Beanbacn_Soup,W_Watr + 23.8 Food_Bologna,Turkey
 + 1.2 Food_Butter,Regular + 4.8 Food_Cap'N_Crunch + 14.9 Food_Carrots,Raw
 + 16 Food_Celery,_Raw + 202 Food_Cheddar_Cheese + 48.6 Food_Cheerios
 + 27.1 Food_Chicknoodl_Soup + 6.2 Food_Chocolate_Chip_Cookies
 + 0.9 Food_Corn_Flks,_Kellogg'S + 7.2 Food_Couscous
 + 178.6 Food_Crm_Mshrm_Soup,W_Mlk + 9 Food_Frankfurter,_Beef
 + 159 Food_Frozen_Broccoli + 3.3 Food_Frozen_Corn + 3.4 Food_Grapes
 + 2 Food_Ham,Sliced,Extralean + 51.4 Food_Hamburger_W_Toppings
 + 23.5 Food_Hotdog,_Plain + 11.4 Food_Kielbasa,Prk
 + 19.8 Food_Kiwifruit,Raw,Fresh + 3.8 Food_Lettuce,Iceberg,Raw
 + 4.9 Food_Macaroni,Ckd + 23.1 Food_Malt_O_Meal,Choc
 + 186 Food_New_E_Clamchwd,W_Mlk + 82.8 Food_Neweng_Clamchwd
 + 18.7 Food_Oatmeal + 6.7 Food_Oatmeal_Cookies + 52.4 Food_Oranges
 + 13.1 Food_Peanut_Butter + 6.7 Food_Peppers,_Sweet,_Raw
 + 64.6 Food_Pizza_W_Pepperoni + 24.5 Food_Poached_Eggs
 + 2.8 Food_Popcorn,Air_Popped + 59.9 Food_Pork
 + 14.2 Food_Potato_Chips,Bbqflvr + 22.7 Food_Potatoes,_Baked
 + 10.2 Food_Pretzels + 12.9 Food_Raisin_Brn,_Kellg'S + 4 Food_Rice_Krispies
 + 21.9 Food_Roasted_Chicken + 91.7 Food_Sardines_in_Oil
 + 42.6 Food_Scrambled_Eggs + 302.3 Food_Skim_Milk
 + 80.2 Food_Spaghetti_W__Sauce + 8.2 Food_Special_K
 + 33.6 Food_Splt_Pea&Hamsoup + 220.6 Food_Taco + 121.8 Food_Tofu
 + 6.2 Food_Tomato,Red,Ripe,Raw + 27.6 Food_Tomato_Soup
 + 43.7 Food_Tortilla_Chip + 32.6 Food_Vegetbeef_Soup + 10.8 Food_Wheat_Bread
 + 26.2 Food_White_Bread + 7.9 Food_White_Rice + 3.4 Food_White_Tuna_in_Water
 <= 1500
MaxCalories: 121.2 Food_2%_Lowfat_Milk + 149.9 Food_3.3%_Fat,Whole_Milk
 + 81.4 Food_Apple,Raw,W_Skin + 67.2 Food_Apple_Pie + 78 Food_Bagels
 + 104.9 Food_Banana + 172 Food_Beanbacn_Soup,W_Watr
 + 56.4 Food_Bologna,Turkey + 35.8 Food_Butter,Regular
 + 119.6 Food_Cap'N_Crunch + 23.7 Food_Carrots,Raw + 6.4 Food_Celery,_Raw
 + 112.7 Food_Cheddar_Cheese + 111 Food_Cheerios + 150.1 Food_Chicknoodl_Soup
 + 78.1 Food_Chocolate_Chip_Cookies + 110.5 Food_Corn_Flks,_Kellogg'S
 + 100.8 Food_Couscous + 203.4 Food_Crm_Mshrm_Soup,W_Mlk
 + 141.8 Food_Frankfurter,_Beef + 73.8 Food_Frozen_Broccoli
 + 72.2 Food_Frozen_Corn + 15.1 Food_Grapes + 37.1 Food_Ham,Sliced,Extralean
 + 275 Food_Hamburger_W_Toppings + 242.1 Food_Hotdog,_Plain
 + 80.6 Food_Kielbasa,Prk + 46.4 Food_Kiwifruit,Raw,Fresh
 + 2.6 Food_Lettuce,Iceberg,Raw + 98.7 Food_Macaroni,Ckd
 + 607.2 Food_Malt_O_Meal,Choc + 163.7 Food_New_E_Clamchwd,W_Mlk
 + 175.7 Food_Neweng_Clamchwd + 145.1 Food_Oatmeal + 81 Food_Oatmeal_Cookies
 + 61.6 Food_Oranges + 188.5 Food_Peanut_Butter + 20 Food_Peppers,_Sweet,_Raw
 + 181 Food_Pizza_W_Pepperoni + 74.5 Food_Poached_Eggs
 + 108.3 Food_Popcorn,Air_Popped + 710.8 Food_Pork
 + 139.2 Food_Potato_Chips,Bbqflvr + 171.5 Food_Potatoes,_Baked
 + 108 Food_Pretzels + 115.1 Food_Raisin_Brn,_Kellg'S
 + 112.2 Food_Rice_Krispies + 277.4 Food_Roasted_Chicken
 + 49.9 Food_Sardines_in_Oil + 99.6 Food_Scrambled_Eggs + 85.5 Food_Skim_Milk
 + 358.2 Food_Spaghetti_W__Sauce + 110.8 Food_Special_K
 + 184.8 Food_Splt_Pea&Hamsoup + 369.4 Food_Taco + 88.2 Food_Tofu
 + 25.8 Food_Tomato,Red,Ripe,Raw + 170.7 Food_Tomato_Soup
 + 142 Food_Tortilla_Chip + 158.1 Food_Vegetbeef_Soup + 65 Food_Wheat_Bread
 + 65 Food_White_Bread + 102.7 Food_White_Rice
 + 115.6 Food_White_Tuna_in_Water <= 2500
MaxCarbohydrates_g: 11.7 Food_2%_Lowfat_Milk + 11.4 Food_3.3%_Fat,Whole_Milk
 + 21 Food_Apple,Raw,W_Skin + 9.6 Food_Apple_Pie + 15.1 Food_Bagels
 + 26.7 Food_Banana + 22.8 Food_Beanbacn_Soup,W_Watr + 0.3 Food_Bologna,Turkey
 + 23 Food_Cap'N_Crunch + 5.6 Food_Carrots,Raw + 1.5 Food_Celery,_Raw
 + 0.4 Food_Cheddar_Cheese + 19.6 Food_Cheerios + 18.7 Food_Chicknoodl_Soup
 + 9.3 Food_Chocolate_Chip_Cookies + 24.5 Food_Corn_Flks,_Kellogg'S
 + 20.9 Food_Couscous + 15 Food_Crm_Mshrm_Soup,W_Mlk
 + 0.8 Food_Frankfurter,_Beef + 13.6 Food_Frozen_Broccoli
 + 17.1 Food_Frozen_Corn + 4.1 Food_Grapes + 0.3 Food_Ham,Sliced,Extralean
 + 32.7 Food_Hamburger_W_Toppings + 18 Food_Hotdog,_Plain
 + 0.6 Food_Kielbasa,Prk + 11.3 Food_Kiwifruit,Raw,Fresh
 + 0.4 Food_Lettuce,Iceberg,Raw + 19.8 Food_Macaroni,Ckd
 + 128.2 Food_Malt_O_Meal,Choc + 16.6 Food_New_E_Clamchwd,W_Mlk
 + 21.8 Food_Neweng_Clamchwd + 25.3 Food_Oatmeal + 12.4 Food_Oatmeal_Cookies
 + 15.4 Food_Oranges + 6.9 Food_Peanut_Butter + 4.8 Food_Peppers,_Sweet,_Raw
 + 19.9 Food_Pizza_W_Pepperoni + 0.6 Food_Poached_Eggs
 + 22.1 Food_Popcorn,Air_Popped + 15 Food_Potato_Chips,Bbqflvr
 + 39.9 Food_Potatoes,_Baked + 22.5 Food_Pretzels
 + 27.9 Food_Raisin_Brn,_Kellg'S + 24.8 Food_Rice_Krispies
 + 1.3 Food_Scrambled_Eggs + 11.9 Food_Skim_Milk
 + 58.3 Food_Spaghetti_W__Sauce + 21.3 Food_Special_K
 + 26.8 Food_Splt_Pea&Hamsoup + 26.7 Food_Taco + 2.2 Food_Tofu
 + 5.7 Food_Tomato,Red,Ripe,Raw + 33.2 Food_Tomato_Soup
 + 17.8 Food_Tortilla_Chip + 20.4 Food_Vegetbeef_Soup + 12.4 Food_Wheat_Bread
 + 11.8 Food_White_Bread + 22.3 Food_White_Rice <= 450
MaxCholesterol_mg: 18.3 Food_2%_Lowfat_Milk + 33.2 Food_3.3%_Fat,Whole_Milk
 + 2.5 Food_Beanbacn_Soup,W_Watr + 28.1 Food_Bologna,Turkey
 + 10.9 Food_Butter,Regular + 29.4 Food_Cheddar_Cheese
 + 12.3 Food_Chicknoodl_Soup + 5.1 Food_Chocolate_Chip_Cookies
 + 19.8 Food_Crm_Mshrm_Soup,W_Mlk + 27.4 Food_Frankfurter,_Beef
 + 13.3 Food_Ham,Sliced,Extralean + 42.8 Food_Hamburger_W_Toppings
 + 44.1 Food_Hotdog,_Plain + 17.4 Food_Kielbasa,Prk
 + 22.3 Food_New_E_Clamchwd,W_Mlk + 10 Food_Neweng_Clamchwd
 + 14.2 Food_Pizza_W_Pepperoni + 211.5 Food_Poached_Eggs + 105.1 Food_Pork
 + 129.9 Food_Roasted_Chicken + 34.1 Food_Sardines_in_Oil
 + 211.2 Food_Scrambled_Eggs + 4.4 Food_Skim_Milk + 7.2 Food_Splt_Pea&Hamsoup
 + 56.4 Food_Taco + 10 Food_Vegetbeef_Soup + 35.7 Food_White_Tuna_in_Water
 <= 240
MaxDietary_Fiber_g: 3.7 Food_Apple,Raw,W_Skin + 0.5 Food_Apple_Pie
 + 0.6 Food_Bagels + 2.7 Food_Banana + 8.6 Food_Beanbacn_Soup,W_Watr
 + 0.5 Food_Cap'N_Crunch + 1.6 Food_Carrots,Raw + 0.7 Food_Celery,_Raw
 + 2 Food_Cheerios + 1.5 Food_Chicknoodl_Soup + 0.7 Food_Corn_Flks,_Kellogg'S
 + 1.3 Food_Couscous + 0.5 Food_Crm_Mshrm_Soup,W_Mlk
 + 8.5 Food_Frozen_Broccoli + 2 Food_Frozen_Corn + 0.2 Food_Grapes
 + 2.6 Food_Kiwifruit,Raw,Fresh + 0.3 Food_Lettuce,Iceberg,Raw
 + 0.9 Food_Macaroni,Ckd + 1.5 Food_New_E_Clamchwd,W_Mlk
 + 1.5 Food_Neweng_Clamchwd + 4 Food_Oatmeal + 0.6 Food_Oatmeal_Cookies
 + 3.1 Food_Oranges + 2.1 Food_Peanut_Butter + 1.3 Food_Peppers,_Sweet,_Raw
 + 4.3 Food_Popcorn,Air_Popped + 1.2 Food_Potato_Chips,Bbqflvr
 + 3.2 Food_Potatoes,_Baked + 0.9 Food_Pretzels + 4 Food_Raisin_Brn,_Kellg'S
 + 0.4 Food_Rice_Krispies + 11.6 Food_Spaghetti_W__Sauce + 0.7 Food_Special_K
 + 4.1 Food_Splt_Pea&Hamsoup + 1.4 Food_Tofu + 1.4 Food_Tomato,Red,Ripe,Raw
 + Food_Tomato_Soup + 1.8 Food_Tortilla_Chip + 4 Food_Vegetbeef_Soup
 + 1.3 Food_Wheat_Bread + 1.1 Food_White_Bread + 0.3 Food_White_Rice <= 250
MaxIron_mg: 0.1 Food_2%_Lowfat_Milk + 0.1 Food_3.3%_Fat,Whole_Milk
 + 0.2 Food_Apple,Raw,W_Skin + 0.1 Food_Apple_Pie + Food_Bagels
 + 0.4 Food_Banana + 2 Food_Beanbacn_Soup,W_Watr + 0.4 Food_Bologna,Turkey
 + 7.5 Food_Cap'N_Crunch + 0.3 Food_Carrots,Raw + 0.2 Food_Celery,_Raw
 + 0.2 Food_Cheddar_Cheese + 4.5 Food_Cheerios + 1.5 Food_Chicknoodl_Soup
 + 0.4 Food_Chocolate_Chip_Cookies + 1.8 Food_Corn_Flks,_Kellogg'S
 + 0.3 Food_Couscous + 0.6 Food_Crm_Mshrm_Soup,W_Mlk
 + 0.6 Food_Frankfurter,_Beef + 2.3 Food_Frozen_Broccoli
 + 0.3 Food_Frozen_Corn + 0.1 Food_Grapes + 0.2 Food_Ham,Sliced,Extralean
 + 2.5 Food_Hamburger_W_Toppings + 2.3 Food_Hotdog,_Plain
 + 0.4 Food_Kielbasa,Prk + 0.3 Food_Kiwifruit,Raw,Fresh
 + 0.1 Food_Lettuce,Iceberg,Raw + Food_Macaroni,Ckd
 + 4.7 Food_Malt_O_Meal,Choc + 1.5 Food_New_E_Clamchwd,W_Mlk
 + 2.8 Food_Neweng_Clamchwd + 1.6 Food_Oatmeal + 0.5 Food_Oatmeal_Cookies
 + 0.1 Food_Oranges + 0.6 Food_Peanut_Butter + 0.3 Food_Peppers,_Sweet,_Raw
 + 0.9 Food_Pizza_W_Pepperoni + 0.7 Food_Poached_Eggs
 + 0.8 Food_Popcorn,Air_Popped + 0.4 Food_Pork + 0.5 Food_Potato_Chips,Bbqflvr
 + 4.3 Food_Potatoes,_Baked + 1.2 Food_Pretzels
 + 16.8 Food_Raisin_Brn,_Kellg'S + 1.8 Food_Rice_Krispies
 + 1.8 Food_Roasted_Chicken + 0.7 Food_Sardines_in_Oil
 + 0.7 Food_Scrambled_Eggs + 0.1 Food_Skim_Milk + 2.3 Food_Spaghetti_W__Sauce
 + 4.5 Food_Special_K + 2.1 Food_Splt_Pea&Hamsoup + 2.4 Food_Taco
 + 6.2 Food_Tofu + 0.6 Food_Tomato,Red,Ripe,Raw + 3.5 Food_Tomato_Soup
 + 0.4 Food_Tortilla_Chip + 2.2 Food_Vegetbeef_Soup + 0.7 Food_Wheat_Bread
 + 0.8 Food_White_Bread + 0.9 Food_White_Rice + 0.5 Food_White_Tuna_in_Water
 <= 40
MaxProtein_g: 8.1 Food_2%_Lowfat_Milk + 8 Food_3.3%_Fat,Whole_Milk
 + 0.3 Food_Apple,Raw,W_Skin + 0.5 Food_Apple_Pie + 3 Food_Bagels
 + 1.2 Food_Banana + 7.9 Food_Beanbacn_Soup,W_Watr + 3.9 Food_Bologna,Turkey
 + 1.4 Food_Cap'N_Crunch + 0.6 Food_Carrots,Raw + 0.3 Food_Celery,_Raw
 + 7 Food_Cheddar_Cheese + 4.3 Food_Cheerios + 7.9 Food_Chicknoodl_Soup
 + 0.9 Food_Chocolate_Chip_Cookies + 2.3 Food_Corn_Flks,_Kellogg'S
 + 3.4 Food_Couscous + 6.1 Food_Crm_Mshrm_Soup,W_Mlk
 + 5.4 Food_Frankfurter,_Beef + 8 Food_Frozen_Broccoli + 2.5 Food_Frozen_Corn
 + 0.2 Food_Grapes + 5.5 Food_Ham,Sliced,Extralean
 + 13.6 Food_Hamburger_W_Toppings + 10.4 Food_Hotdog,_Plain
 + 3.4 Food_Kielbasa,Prk + 0.8 Food_Kiwifruit,Raw,Fresh
 + 0.2 Food_Lettuce,Iceberg,Raw + 3.3 Food_Macaroni,Ckd
 + 17.3 Food_Malt_O_Meal,Choc + 9.5 Food_New_E_Clamchwd,W_Mlk
 + 10.9 Food_Neweng_Clamchwd + 6.1 Food_Oatmeal + 1.1 Food_Oatmeal_Cookies
 + 1.2 Food_Oranges + 7.7 Food_Peanut_Butter + 0.7 Food_Peppers,_Sweet,_Raw
 + 10.1 Food_Pizza_W_Pepperoni + 6.2 Food_Poached_Eggs
 + 3.4 Food_Popcorn,Air_Popped + 13.8 Food_Pork
 + 2.2 Food_Potato_Chips,Bbqflvr + 3.7 Food_Potatoes,_Baked
 + 2.6 Food_Pretzels + 4 Food_Raisin_Brn,_Kellg'S + 1.9 Food_Rice_Krispies
 + 42.2 Food_Roasted_Chicken + 5.9 Food_Sardines_in_Oil
 + 6.7 Food_Scrambled_Eggs + 8.4 Food_Skim_Milk + 8.2 Food_Spaghetti_W__Sauce
 + 5.6 Food_Special_K + 11.1 Food_Splt_Pea&Hamsoup + 20.7 Food_Taco
 + 9.4 Food_Tofu + Food_Tomato,Red,Ripe,Raw + 4.1 Food_Tomato_Soup
 + 2 Food_Tortilla_Chip + 11.2 Food_Vegetbeef_Soup + 2.2 Food_Wheat_Bread
 + 2.3 Food_White_Bread + 2.1 Food_White_Rice + 22.7 Food_White_Tuna_in_Water
 <= 100
MaxSodium_mg: 121.8 Food_2%_Lowfat_Milk + 119.6 Food_3.3%_Fat,Whole_Milk
 + 75.4 Food_Apple_Pie + 151.4 Food_Bagels + 1.1 Food_Banana
 + 951.3 Food_Beanbacn_Soup,W_Watr + 248.9 Food_Bologna,Turkey
 + 41.3 Food_Butter,Regular + 213.3 Food_Cap'N_Crunch + 19.2 Food_Carrots,Raw
 + 34.8 Food_Celery,_Raw + 173.7 Food_Cheddar_Cheese + 307.6 Food_Cheerios
 + 1862.2 Food_Chicknoodl_Soup + 57.8 Food_Chocolate_Chip_Cookies
 + 290.5 Food_Corn_Flks,_Kellogg'S + 4.5 Food_Couscous
 + 1076.3 Food_Crm_Mshrm_Soup,W_Mlk + 461.7 Food_Frankfurter,_Beef
 + 68.2 Food_Frozen_Broccoli + 2.5 Food_Frozen_Corn + 0.5 Food_Grapes
 + 405.1 Food_Ham,Sliced,Extralean + 563.9 Food_Hamburger_W_Toppings
 + 670.3 Food_Hotdog,_Plain + 279.8 Food_Kielbasa,Prk
 + 3.8 Food_Kiwifruit,Raw,Fresh + 1.8 Food_Lettuce,Iceberg,Raw
 + 0.7 Food_Macaroni,Ckd + 16.5 Food_Malt_O_Meal,Choc
 + 992 Food_New_E_Clamchwd,W_Mlk + 1864.9 Food_Neweng_Clamchwd
 + 2.3 Food_Oatmeal + 68.9 Food_Oatmeal_Cookies + 155.5 Food_Peanut_Butter
 + 1.5 Food_Peppers,_Sweet,_Raw + 267 Food_Pizza_W_Pepperoni
 + 140 Food_Poached_Eggs + 1.1 Food_Popcorn,Air_Popped + 38.4 Food_Pork
 + 212.6 Food_Potato_Chips,Bbqflvr + 15.2 Food_Potatoes,_Baked
 + 486.2 Food_Pretzels + 204.4 Food_Raisin_Brn,_Kellg'S
 + 340.8 Food_Rice_Krispies + 125.6 Food_Roasted_Chicken
 + 121.2 Food_Sardines_in_Oil + 168 Food_Scrambled_Eggs + 126.2 Food_Skim_Milk
 + 1237.1 Food_Spaghetti_W__Sauce + 265.5 Food_Special_K
 + 964.8 Food_Splt_Pea&Hamsoup + 802 Food_Taco + 8.1 Food_Tofu
 + 11.1 Food_Tomato,Red,Ripe,Raw + 1744.4 Food_Tomato_Soup
 + 149.7 Food_Tortilla_Chip + 1915.1 Food_Vegetbeef_Soup
 + 134.5 Food_Wheat_Bread + 132.5 Food_White_Bread + 0.8 Food_White_Rice
 + 333.2 Food_White_Tuna_in_Water <= 2000
MaxTotal_Fat_g: 4.7 Food_2%_Lowfat_Milk + 8.1 Food_3.3%_Fat,Whole_Milk
 + 0.5 Food_Apple,Raw,W_Skin + 3.1 Food_Apple_Pie + 0.5 Food_Bagels
 + 0.5 Food_Banana + 5.9 Food_Beanbacn_Soup,W_Watr + 4.3 Food_Bologna,Turkey
 + 4.1 Food_Butter,Regular + 2.6 Food_Cap'N_Crunch + 0.1 Food_Carrots,Raw
 + 0.1 Food_Celery,_Raw + 9.3 Food_Cheddar_Cheese + 1.8 Food_Cheerios
 + 4.6 Food_Chicknoodl_Soup + 4.5 Food_Chocolate_Chip_Cookies
 + 0.1 Food_Corn_Flks,_Kellogg'S + 0.1 Food_Couscous
 + 13.6 Food_Crm_Mshrm_Soup,W_Mlk + 12.8 Food_Frankfurter,_Beef
 + 0.8 Food_Frozen_Broccoli + 0.6 Food_Frozen_Corn + 0.1 Food_Grapes
 + 1.4 Food_Ham,Sliced,Extralean + 10.2 Food_Hamburger_W_Toppings
 + 14.5 Food_Hotdog,_Plain + 7.1 Food_Kielbasa,Prk
 + 0.3 Food_Kiwifruit,Raw,Fresh + 0.5 Food_Macaroni,Ckd
 + 1.5 Food_Malt_O_Meal,Choc + 6.6 Food_New_E_Clamchwd,W_Mlk
 + 5 Food_Neweng_Clamchwd + 2.3 Food_Oatmeal + 3.3 Food_Oatmeal_Cookies
 + 0.2 Food_Oranges + 16 Food_Peanut_Butter + 0.1 Food_Peppers,_Sweet,_Raw
 + 7 Food_Pizza_W_Pepperoni + 5 Food_Poached_Eggs
 + 1.2 Food_Popcorn,Air_Popped + 72.2 Food_Pork
 + 9.2 Food_Potato_Chips,Bbqflvr + 0.2 Food_Potatoes,_Baked + Food_Pretzels
 + 0.7 Food_Raisin_Brn,_Kellg'S + 0.2 Food_Rice_Krispies
 + 10.8 Food_Roasted_Chicken + 2.7 Food_Sardines_in_Oil
 + 7.3 Food_Scrambled_Eggs + 0.4 Food_Skim_Milk + 12.3 Food_Spaghetti_W__Sauce
 + 0.1 Food_Special_K + 4 Food_Splt_Pea&Hamsoup + 20.6 Food_Taco
 + 5.5 Food_Tofu + 0.4 Food_Tomato,Red,Ripe,Raw + 3.8 Food_Tomato_Soup
 + 7.4 Food_Tortilla_Chip + 3.8 Food_Vegetbeef_Soup + Food_Wheat_Bread
 + Food_White_Bread + 0.2 Food_White_Rice + 2.1 Food_White_Tuna_in_Water <= 70
MaxVit_A_IU: 500.2 Food_2%_Lowfat_Milk + 307.4 Food_3.3%_Fat,Whole_Milk
 + 73.1 Food_Apple,Raw,W_Skin + 35.2 Food_Apple_Pie + 92.3 Food_Banana
 + 888 Food_Beanbacn_Soup,W_Watr + 152.9 Food_Butter,Regular
 + 40.6 Food_Cap'N_Crunch + 15471 Food_Carrots,Raw + 53.6 Food_Celery,_Raw
 + 296.5 Food_Cheddar_Cheese + 1252.2 Food_Cheerios
 + 1308.7 Food_Chicknoodl_Soup + 101.8 Food_Chocolate_Chip_Cookies
 + 1252.2 Food_Corn_Flks,_Kellogg'S + 153.8 Food_Crm_Mshrm_Soup,W_Mlk
 + 5867.4 Food_Frozen_Broccoli + 106.6 Food_Frozen_Corn + 24 Food_Grapes
 + 126.3 Food_Hamburger_W_Toppings + 133 Food_Kiwifruit,Raw,Fresh
 + 66 Food_Lettuce,Iceberg,Raw + 163.7 Food_New_E_Clamchwd,W_Mlk
 + 20.1 Food_Neweng_Clamchwd + 37.4 Food_Oatmeal + 2.9 Food_Oatmeal_Cookies
 + 268.6 Food_Oranges + 467.7 Food_Peppers,_Sweet,_Raw
 + 281.9 Food_Pizza_W_Pepperoni + 316 Food_Poached_Eggs
 + 55.6 Food_Popcorn,Air_Popped + 14.7 Food_Pork
 + 61.5 Food_Potato_Chips,Bbqflvr + 1250.2 Food_Raisin_Brn,_Kellg'S
 + 1252.2 Food_Rice_Krispies + 77.4 Food_Roasted_Chicken
 + 53.8 Food_Sardines_in_Oil + 409.2 Food_Scrambled_Eggs
 + 499.8 Food_Skim_Milk + 3055.2 Food_Spaghetti_W__Sauce
 + 1252.2 Food_Special_K + 4872 Food_Splt_Pea&Hamsoup + 855 Food_Taco
 + 98.6 Food_Tofu + 766.3 Food_Tomato,Red,Ripe,Raw + 1393 Food_Tomato_Soup
 + 55.6 Food_Tortilla_Chip + 3785.1 Food_Vegetbeef_Soup
 + 68 Food_White_Tuna_in_Water <= 10000
MaxVit_C_IU: 2.3 Food_2%_Lowfat_Milk + 2.3 Food_3.3%_Fat,Whole_Milk
 + 7.9 Food_Apple,Raw,W_Skin + 0.9 Food_Apple_Pie + 10.4 Food_Banana
 + 1.5 Food_Beanbacn_Soup,W_Watr + 5.1 Food_Carrots,Raw + 2.8 Food_Celery,_Raw
 + 15.1 Food_Cheerios + 15.1 Food_Corn_Flks,_Kellogg'S
 + 2.2 Food_Crm_Mshrm_Soup,W_Mlk + 10.8 Food_Frankfurter,_Beef
 + 160.2 Food_Frozen_Broccoli + 5.2 Food_Frozen_Corn + Food_Grapes
 + 7.4 Food_Ham,Sliced,Extralean + 2.6 Food_Hamburger_W_Toppings
 + 0.1 Food_Hotdog,_Plain + 5.5 Food_Kielbasa,Prk
 + 74.5 Food_Kiwifruit,Raw,Fresh + 0.8 Food_Lettuce,Iceberg,Raw
 + 3.5 Food_New_E_Clamchwd,W_Mlk + 4.8 Food_Neweng_Clamchwd
 + 0.1 Food_Oatmeal_Cookies + 69.7 Food_Oranges
 + 66.1 Food_Peppers,_Sweet,_Raw + 1.6 Food_Pizza_W_Pepperoni
 + 9.6 Food_Potato_Chips,Bbqflvr + 15.6 Food_Potatoes,_Baked
 + 15.1 Food_Rice_Krispies + 0.1 Food_Scrambled_Eggs + 2.4 Food_Skim_Milk
 + 27.9 Food_Spaghetti_W__Sauce + 15.1 Food_Special_K
 + 7 Food_Splt_Pea&Hamsoup + 2.2 Food_Taco + 0.1 Food_Tofu
 + 23.5 Food_Tomato,Red,Ripe,Raw + 133 Food_Tomato_Soup
 + 4.8 Food_Vegetbeef_Soup <= 5000
MinCalcium_mg: 296.7 Food_2%_Lowfat_Milk + 291.3 Food_3.3%_Fat,Whole_Milk
 + 9.7 Food_Apple,Raw,W_Skin + 3.1 Food_Apple_Pie + 21 Food_Bagels
 + 6.8 Food_Banana + 81 Food_Beanbacn_Soup,W_Watr + 23.8 Food_Bologna,Turkey
 + 1.2 Food_Butter,Regular + 4.8 Food_Cap'N_Crunch + 14.9 Food_Carrots,Raw
 + 16 Food_Celery,_Raw + 202 Food_Cheddar_Cheese + 48.6 Food_Cheerios
 + 27.1 Food_Chicknoodl_Soup + 6.2 Food_Chocolate_Chip_Cookies
 + 0.9 Food_Corn_Flks,_Kellogg'S + 7.2 Food_Couscous
 + 178.6 Food_Crm_Mshrm_Soup,W_Mlk + 9 Food_Frankfurter,_Beef
 + 159 Food_Frozen_Broccoli + 3.3 Food_Frozen_Corn + 3.4 Food_Grapes
 + 2 Food_Ham,Sliced,Extralean + 51.4 Food_Hamburger_W_Toppings
 + 23.5 Food_Hotdog,_Plain + 11.4 Food_Kielbasa,Prk
 + 19.8 Food_Kiwifruit,Raw,Fresh + 3.8 Food_Lettuce,Iceberg,Raw
 + 4.9 Food_Macaroni,Ckd + 23.1 Food_Malt_O_Meal,Choc
 + 186 Food_New_E_Clamchwd,W_Mlk + 82.8 Food_Neweng_Clamchwd
 + 18.7 Food_Oatmeal + 6.7 Food_Oatmeal_Cookies + 52.4 Food_Oranges
 + 13.1 Food_Peanut_Butter + 6.7 Food_Peppers,_Sweet,_Raw
 + 64.6 Food_Pizza_W_Pepperoni + 24.5 Food_Poached_Eggs
 + 2.8 Food_Popcorn,Air_Popped + 59.9 Food_Pork
 + 14.2 Food_Potato_Chips,Bbqflvr + 22.7 Food_Potatoes,_Baked
 + 10.2 Food_Pretzels + 12.9 Food_Raisin_Brn,_Kellg'S + 4 Food_Rice_Krispies
 + 21.9 Food_Roasted_Chicken + 91.7 Food_Sardines_in_Oil
 + 42.6 Food_Scrambled_Eggs + 302.3 Food_Skim_Milk
 + 80.2 Food_Spaghetti_W__Sauce + 8.2 Food_Special_K
 + 33.6 Food_Splt_Pea&Hamsoup + 220.6 Food_Taco + 121.8 Food_Tofu
 + 6.2 Food_Tomato,Red,Ripe,Raw + 27.6 Food_Tomato_Soup
 + 43.7 Food_Tortilla_Chip + 32.6 Food_Vegetbeef_Soup + 10.8 Food_Wheat_Bread
 + 26.2 Food_White_Bread + 7.9 Food_White_Rice + 3.4 Food_White_Tuna_in_Water
 >= 700
MinCalories: 121.2 Food_2%_Lowfat_Milk + 149.9 Food_3.3%_Fat,Whole_Milk
 + 81.4 Food_Apple,Raw,W_Skin + 67.2 Food_Apple_Pie + 78 Food_Bagels
 + 104.9 Food_Banana + 172 Food_Beanbacn_Soup,W_Watr
 + 56.4 Food_Bologna,Turkey + 35.8 Food_Butter,Regular
 + 119.6 Food_Cap'N_Crunch + 23.7 Food_Carrots,Raw + 6.4 Food_Celery,_Raw
 + 112.7 Food_Cheddar_Cheese + 111 Food_Cheerios + 150.1 Food_Chicknoodl_Soup
 + 78.1 Food_Chocolate_Chip_Cookies + 110.5 Food_Corn_Flks,_Kellogg'S
 + 100.8 Food_Couscous + 203.4 Food_Crm_Mshrm_Soup,W_Mlk
 + 141.8 Food_Frankfurter,_Beef + 73.8 Food_Frozen_Broccoli
 + 72.2 Food_Frozen_Corn + 15.1 Food_Grapes + 37.1 Food_Ham,Sliced,Extralean
 + 275 Food_Hamburger_W_Toppings + 242.1 Food_Hotdog,_Plain
 + 80.6 Food_Kielbasa,Prk + 46.4 Food_Kiwifruit,Raw,Fresh
 + 2.6 Food_Lettuce,Iceberg,Raw + 98.7 Food_Macaroni,Ckd
 + 607.2 Food_Malt_O_Meal,Choc + 163.7 Food_New_E_Clamchwd,W_Mlk
 + 175.7 Food_Neweng_Clamchwd + 145.1 Food_Oatmeal + 81 Food_Oatmeal_Cookies
 + 61.6 Food_Oranges + 188.5 Food_Peanut_Butter + 20 Food_Peppers,_Sweet,_Raw
 + 181 Food_Pizza_W_Pepperoni + 74.5 Food_Poached_Eggs
 + 108.3 Food_Popcorn,Air_Popped + 710.8 Food_Pork
 + 139.2 Food_Potato_Chips,Bbqflvr + 171.5 Food_Potatoes,_Baked
 + 108 Food_Pretzels + 115.1 Food_Raisin_Brn,_Kellg'S
 + 112.2 Food_Rice_Krispies + 277.4 Food_Roasted_Chicken
 + 49.9 Food_Sardines_in_Oil + 99.6 Food_Scrambled_Eggs + 85.5 Food_Skim_Milk
 + 358.2 Food_Spaghetti_W__Sauce + 110.8 Food_Special_K
 + 184.8 Food_Splt_Pea&Hamsoup + 369.4 Food_Taco + 88.2 Food_Tofu
 + 25.8 Food_Tomato,Red,Ripe,Raw + 170.7 Food_Tomato_Soup
 + 142 Food_Tortilla_Chip + 158.1 Food_Vegetbeef_Soup + 65 Food_Wheat_Bread
 + 65 Food_White_Bread + 102.7 Food_White_Rice
 + 115.6 Food_White_Tuna_in_Water >= 1500
MinCarbohydrates_g: 11.7 Food_2%_Lowfat_Milk + 11.4 Food_3.3%_Fat,Whole_Milk
 + 21 Food_Apple,Raw,W_Skin + 9.6 Food_Apple_Pie + 15.1 Food_Bagels
 + 26.7 Food_Banana + 22.8 Food_Beanbacn_Soup,W_Watr + 0.3 Food_Bologna,Turkey
 + 23 Food_Cap'N_Crunch + 5.6 Food_Carrots,Raw + 1.5 Food_Celery,_Raw
 + 0.4 Food_Cheddar_Cheese + 19.6 Food_Cheerios + 18.7 Food_Chicknoodl_Soup
 + 9.3 Food_Chocolate_Chip_Cookies + 24.5 Food_Corn_Flks,_Kellogg'S
 + 20.9 Food_Couscous + 15 Food_Crm_Mshrm_Soup,W_Mlk
 + 0.8 Food_Frankfurter,_Beef + 13.6 Food_Frozen_Broccoli
 + 17.1 Food_Frozen_Corn + 4.1 Food_Grapes + 0.3 Food_Ham,Sliced,Extralean
 + 32.7 Food_Hamburger_W_Toppings + 18 Food_Hotdog,_Plain
 + 0.6 Food_Kielbasa,Prk + 11.3 Food_Kiwifruit,Raw,Fresh
 + 0.4 Food_Lettuce,Iceberg,Raw + 19.8 Food_Macaroni,Ckd
 + 128.2 Food_Malt_O_Meal,Choc + 16.6 Food_New_E_Clamchwd,W_Mlk
 + 21.8 Food_Neweng_Clamchwd + 25.3 Food_Oatmeal + 12.4 Food_Oatmeal_Cookies
 + 15.4 Food_Oranges + 6.9 Food_Peanut_Butter + 4.8 Food_Peppers,_Sweet,_Raw
 + 19.9 Food_Pizza_W_Pepperoni + 0.6 Food_Poached_Eggs
 + 22.1 Food_Popcorn,Air_Popped + 15 Food_Potato_Chips,Bbqflvr
 + 39.9 Food_Potatoes,_Baked + 22.5 Food_Pretzels
 + 27.9 Food_Raisin_Brn,_Kellg'S + 24.8 Food_Rice_Krispies
 + 1.3 Food_Scrambled_Eggs + 11.9 Food_Skim_Milk
 + 58.3 Food_Spaghetti_W__Sauce + 21.3 Food_Special_K
 + 26.8 Food_Splt_Pea&Hamsoup + 26.7 Food_Taco + 2.2 Food_Tofu
 + 5.7 Food_Tomato,Red,Ripe,Raw + 33.2 Food_Tomato_Soup
 + 17.8 Food_Tortilla_Chip + 20.4 Food_Vegetbeef_Soup + 12.4 Food_Wheat_Bread
 + 11.8 Food_White_Bread + 22.3 Food_White_Rice >= 130
MinCholesterol_mg: 18.3 Food_2%_Lowfat_Milk + 33.2 Food_3.3%_Fat,Whole_Milk
 + 2.5 Food_Beanbacn_Soup,W_Watr + 28.1 Food_Bologna,Turkey
 + 10.9 Food_Butter,Regular + 29.4 Food_Cheddar_Cheese
 + 12.3 Food_Chicknoodl_Soup + 5.1 Food_Chocolate_Chip_Cookies
 + 19.8 Food_Crm_Mshrm_Soup,W_Mlk + 27.4 Food_Frankfurter,_Beef
 + 13.3 Food_Ham,Sliced,Extralean + 42.8 Food_Hamburger_W_Toppings
 + 44.1 Food_Hotdog,_Plain + 17.4 Food_Kielbasa,Prk
 + 22.3 Food_New_E_Clamchwd,W_Mlk + 10 Food_Neweng_Clamchwd
 + 14.2 Food_Pizza_W_Pepperoni + 211.5 Food_Poached_Eggs + 105.1 Food_Pork
 + 129.9 Food_Roasted_Chicken + 34.1 Food_Sardines_in_Oil
 + 211.2 Food_Scrambled_Eggs + 4.4 Food_Skim_Milk + 7.2 Food_Splt_Pea&Hamsoup
 + 56.4 Food_Taco + 10 Food_Vegetbeef_Soup + 35.7 Food_White_Tuna_in_Water
 >= 30
MinDietary_Fiber_g: 3.7 Food_Apple,Raw,W_Skin + 0.5 Food_Apple_Pie
 + 0.6 Food_Bagels + 2.7 Food_Banana + 8.6 Food_Beanbacn_Soup,W_Watr
 + 0.5 Food_Cap'N_Crunch + 1.6 Food_Carrots,Raw + 0.7 Food_Celery,_Raw
 + 2 Food_Cheerios + 1.5 Food_Chicknoodl_Soup + 0.7 Food_Corn_Flks,_Kellogg'S
 + 1.3 Food_Couscous + 0.5 Food_Crm_Mshrm_Soup,W_Mlk
 + 8.5 Food_Frozen_Broccoli + 2 Food_Frozen_Corn + 0.2 Food_Grapes
 + 2.6 Food_Kiwifruit,Raw,Fresh + 0.3 Food_Lettuce,Iceberg,Raw
 + 0.9 Food_Macaroni,Ckd + 1.5 Food_New_E_Clamchwd,W_Mlk
 + 1.5 Food_Neweng_Clamchwd + 4 Food_Oatmeal + 0.6 Food_Oatmeal_Cookies
 + 3.1 Food_Oranges + 2.1 Food_Peanut_Butter + 1.3 Food_Peppers,_Sweet,_Raw
 + 4.3 Food_Popcorn,Air_Popped + 1.2 Food_Potato_Chips,Bbqflvr
 + 3.2 Food_Potatoes,_Baked + 0.9 Food_Pretzels + 4 Food_Raisin_Brn,_Kellg'S
 + 0.4 Food_Rice_Krispies + 11.6 Food_Spaghetti_W__Sauce + 0.7 Food_Special_K
 + 4.1 Food_Splt_Pea&Hamsoup + 1.4 Food_Tofu + 1.4 Food_Tomato,Red,Ripe,Raw
 + Food_Tomato_Soup + 1.8 Food_Tortilla_Chip + 4 Food_Vegetbeef_Soup
 + 1.3 Food_Wheat_Bread + 1.1 Food_White_Bread + 0.3 Food_White_Rice >= 125
MinIron_mg: 0.1 Food_2%_Lowfat_Milk + 0.1 Food_3.3%_Fat,Whole_Milk
 + 0.2 Food_Apple,Raw,W_Skin + 0.1 Food_Apple_Pie + Food_Bagels
 + 0.4 Food_Banana + 2 Food_Beanbacn_Soup,W_Watr + 0.4 Food_Bologna,Turkey
 + 7.5 Food_Cap'N_Crunch + 0.3 Food_Carrots,Raw + 0.2 Food_Celery,_Raw
 + 0.2 Food_Cheddar_Cheese + 4.5 Food_Cheerios + 1.5 Food_Chicknoodl_Soup
 + 0.4 Food_Chocolate_Chip_Cookies + 1.8 Food_Corn_Flks,_Kellogg'S
 + 0.3 Food_Couscous + 0.6 Food_Crm_Mshrm_Soup,W_Mlk
 + 0.6 Food_Frankfurter,_Beef + 2.3 Food_Frozen_Broccoli
 + 0.3 Food_Frozen_Corn + 0.1 Food_Grapes + 0.2 Food_Ham,Sliced,Extralean
 + 2.5 Food_Hamburger_W_Toppings + 2.3 Food_Hotdog,_Plain
 + 0.4 Food_Kielbasa,Prk + 0.3 Food_Kiwifruit,Raw,Fresh
 + 0.1 Food_Lettuce,Iceberg,Raw + Food_Macaroni,Ckd
 + 4.7 Food_Malt_O_Meal,Choc + 1.5 Food_New_E_Clamchwd,W_Mlk
 + 2.8 Food_Neweng_Clamchwd + 1.6 Food_Oatmeal + 0.5 Food_Oatmeal_Cookies
 + 0.1 Food_Oranges + 0.6 Food_Peanut_Butter + 0.3 Food_Peppers,_Sweet,_Raw
 + 0.9 Food_Pizza_W_Pepperoni + 0.7 Food_Poached_Eggs
 + 0.8 Food_Popcorn,Air_Popped + 0.4 Food_Pork + 0.5 Food_Potato_Chips,Bbqflvr
 + 4.3 Food_Potatoes,_Baked + 1.2 Food_Pretzels
 + 16.8 Food_Raisin_Brn,_Kellg'S + 1.8 Food_Rice_Krispies
 + 1.8 Food_Roasted_Chicken + 0.7 Food_Sardines_in_Oil
 + 0.7 Food_Scrambled_Eggs + 0.1 Food_Skim_Milk + 2.3 Food_Spaghetti_W__Sauce
 + 4.5 Food_Special_K + 2.1 Food_Splt_Pea&Hamsoup + 2.4 Food_Taco
 + 6.2 Food_Tofu + 0.6 Food_Tomato,Red,Ripe,Raw + 3.5 Food_Tomato_Soup
 + 0.4 Food_Tortilla_Chip + 2.2 Food_Vegetbeef_Soup + 0.7 Food_Wheat_Bread
 + 0.8 Food_White_Bread + 0.9 Food_White_Rice + 0.5 Food_White_Tuna_in_Water
 >= 10
MinProtein_g: 8.1 Food_2%_Lowfat_Milk + 8 Food_3.3%_Fat,Whole_Milk
 + 0.3 Food_Apple,Raw,W_Skin + 0.5 Food_Apple_Pie + 3 Food_Bagels
 + 1.2 Food_Banana + 7.9 Food_Beanbacn_Soup,W_Watr + 3.9 Food_Bologna,Turkey
 + 1.4 Food_Cap'N_Crunch + 0.6 Food_Carrots,Raw + 0.3 Food_Celery,_Raw
 + 7 Food_Cheddar_Cheese + 4.3 Food_Cheerios + 7.9 Food_Chicknoodl_Soup
 + 0.9 Food_Chocolate_Chip_Cookies + 2.3 Food_Corn_Flks,_Kellogg'S
 + 3.4 Food_Couscous + 6.1 Food_Crm_Mshrm_Soup,W_Mlk
 + 5.4 Food_Frankfurter,_Beef + 8 Food_Frozen_Broccoli + 2.5 Food_Frozen_Corn
 + 0.2 Food_Grapes + 5.5 Food_Ham,Sliced,Extralean
 + 13.6 Food_Hamburger_W_Toppings + 10.4 Food_Hotdog,_Plain
 + 3.4 Food_Kielbasa,Prk + 0.8 Food_Kiwifruit,Raw,Fresh
 + 0.2 Food_Lettuce,Iceberg,Raw + 3.3 Food_Macaroni,Ckd
 + 17.3 Food_Malt_O_Meal,Choc + 9.5 Food_New_E_Clamchwd,W_Mlk
 + 10.9 Food_Neweng_Clamchwd + 6.1 Food_Oatmeal + 1.1 Food_Oatmeal_Cookies
 + 1.2 Food_Oranges + 7.7 Food_Peanut_Butter + 0.7 Food_Peppers,_Sweet,_Raw
 + 10.1 Food_Pizza_W_Pepperoni + 6.2 Food_Poached_Eggs
 + 3.4 Food_Popcorn,Air_Popped + 13.8 Food_Pork
 + 2.2 Food_Potato_Chips,Bbqflvr + 3.7 Food_Potatoes,_Baked
 + 2.6 Food_Pretzels + 4 Food_Raisin_Brn,_Kellg'S + 1.9 Food_Rice_Krispies
 + 42.2 Food_Roasted_Chicken + 5.9 Food_Sardines_in_Oil
 + 6.7 Food_Scrambled_Eggs + 8.4 Food_Skim_Milk + 8.2 Food_Spaghetti_W__Sauce
 + 5.6 Food_Special_K + 11.1 Food_Splt_Pea&Hamsoup + 20.7 Food_Taco
 + 9.4 Food_Tofu + Food_Tomato,Red,Ripe,Raw + 4.1 Food_Tomato_Soup
 + 2 Food_Tortilla_Chip + 11.2 Food_Vegetbeef_Soup + 2.2 Food_Wheat_Bread
 + 2.3 Food_White_Bread + 2.1 Food_White_Rice + 22.7 Food_White_Tuna_in_Water
 >= 60
MinSodium_mg: 121.8 Food_2%_Lowfat_Milk + 119.6 Food_3.3%_Fat,Whole_Milk
 + 75.4 Food_Apple_Pie + 151.4 Food_Bagels + 1.1 Food_Banana
 + 951.3 Food_Beanbacn_Soup,W_Watr + 248.9 Food_Bologna,Turkey
 + 41.3 Food_Butter,Regular + 213.3 Food_Cap'N_Crunch + 19.2 Food_Carrots,Raw
 + 34.8 Food_Celery,_Raw + 173.7 Food_Cheddar_Cheese + 307.6 Food_Cheerios
 + 1862.2 Food_Chicknoodl_Soup + 57.8 Food_Chocolate_Chip_Cookies
 + 290.5 Food_Corn_Flks,_Kellogg'S + 4.5 Food_Couscous
 + 1076.3 Food_Crm_Mshrm_Soup,W_Mlk + 461.7 Food_Frankfurter,_Beef
 + 68.2 Food_Frozen_Broccoli + 2.5 Food_Frozen_Corn + 0.5 Food_Grapes
 + 405.1 Food_Ham,Sliced,Extralean + 563.9 Food_Hamburger_W_Toppings
 + 670.3 Food_Hotdog,_Plain + 279.8 Food_Kielbasa,Prk
 + 3.8 Food_Kiwifruit,Raw,Fresh + 1.8 Food_Lettuce,Iceberg,Raw
 + 0.7 Food_Macaroni,Ckd + 16.5 Food_Malt_O_Meal,Choc
 + 992 Food_New_E_Clamchwd,W_Mlk + 1864.9 Food_Neweng_Clamchwd
 + 2.3 Food_Oatmeal + 68.9 Food_Oatmeal_Cookies + 155.5 Food_Peanut_Butter
 + 1.5 Food_Peppers,_Sweet,_Raw + 267 Food_Pizza_W_Pepperoni
 + 140 Food_Poached_Eggs + 1.1 Food_Popcorn,Air_Popped + 38.4 Food_Pork
 + 212.6 Food_Potato_Chips,Bbqflvr + 15.2 Food_Potatoes,_Baked
 + 486.2 Food_Pretzels + 204.4 Food_Raisin_Brn,_Kellg'S
 + 340.8 Food_Rice_Krispies + 125.6 Food_Roasted_Chicken
 + 121.2 Food_Sardines_in_Oil + 168 Food_Scrambled_Eggs + 126.2 Food_Skim_Milk
 + 1237.1 Food_Spaghetti_W__Sauce + 265.5 Food_Special_K
 + 964.8 Food_Splt_Pea&Hamsoup + 802 Food_Taco + 8.1 Food_Tofu
 + 11.1 Food_Tomato,Red,Ripe,Raw + 1744.4 Food_Tomato_Soup
 + 149.7 Food_Tortilla_Chip + 1915.1 Food_Vegetbeef_Soup
 + 134.5 Food_Wheat_Bread + 132.5 Food_White_Bread + 0.8 Food_White_Rice
 + 333.2 Food_White_Tuna_in_Water >= 800
MinTotal_Fat_g: 4.7 Food_2%_Lowfat_Milk + 8.1 Food_3.3%_Fat,Whole_Milk
 + 0.5 Food_Apple,Raw,W_Skin + 3.1 Food_Apple_Pie + 0.5 Food_Bagels
 + 0.5 Food_Banana + 5.9 Food_Beanbacn_Soup,W_Watr + 4.3 Food_Bologna,Turkey
 + 4.1 Food_Butter,Regular + 2.6 Food_Cap'N_Crunch + 0.1 Food_Carrots,Raw
 + 0.1 Food_Celery,_Raw + 9.3 Food_Cheddar_Cheese + 1.8 Food_Cheerios
 + 4.6 Food_Chicknoodl_Soup + 4.5 Food_Chocolate_Chip_Cookies
 + 0.1 Food_Corn_Flks,_Kellogg'S + 0.1 Food_Couscous
 + 13.6 Food_Crm_Mshrm_Soup,W_Mlk + 12.8 Food_Frankfurter,_Beef
 + 0.8 Food_Frozen_Broccoli + 0.6 Food_Frozen_Corn + 0.1 Food_Grapes
 + 1.4 Food_Ham,Sliced,Extralean + 10.2 Food_Hamburger_W_Toppings
 + 14.5 Food_Hotdog,_Plain + 7.1 Food_Kielbasa,Prk
 + 0.3 Food_Kiwifruit,Raw,Fresh + 0.5 Food_Macaroni,Ckd
 + 1.5 Food_Malt_O_Meal,Choc + 6.6 Food_New_E_Clamchwd,W_Mlk
 + 5 Food_Neweng_Clamchwd + 2.3 Food_Oatmeal + 3.3 Food_Oatmeal_Cookies
 + 0.2 Food_Oranges + 16 Food_Peanut_Butter + 0.1 Food_Peppers,_Sweet,_Raw
 + 7 Food_Pizza_W_Pepperoni + 5 Food_Poached_Eggs
 + 1.2 Food_Popcorn,Air_Popped + 72.2 Food_Pork
 + 9.2 Food_Potato_Chips,Bbqflvr + 0.2 Food_Potatoes,_Baked + Food_Pretzels
 + 0.7 Food_Raisin_Brn,_Kellg'S + 0.2 Food_Rice_Krispies
 + 10.8 Food_Roasted_Chicken + 2.7 Food_Sardines_in_Oil
 + 7.3 Food_Scrambled_Eggs + 0.4 Food_Skim_Milk + 12.3 Food_Spaghetti_W__Sauce
 + 0.1 Food_Special_K + 4 Food_Splt_Pea&Hamsoup + 20.6 Food_Taco
 + 5.5 Food_Tofu + 0.4 Food_Tomato,Red,Ripe,Raw + 3.8 Food_Tomato_Soup
 + 7.4 Food_Tortilla_Chip + 3.8 Food_Vegetbeef_Soup + Food_Wheat_Bread
 + Food_White_Bread + 0.2 Food_White_Rice + 2.1 Food_White_Tuna_in_Water >= 20
MinVit_A_IU: 500.2 Food_2%_Lowfat_Milk + 307.4 Food_3.3%_Fat,Whole_Milk
 + 73.1 Food_Apple,Raw,W_Skin + 35.2 Food_Apple_Pie + 92.3 Food_Banana
 + 888 Food_Beanbacn_Soup,W_Watr + 152.9 Food_Butter,Regular
 + 40.6 Food_Cap'N_Crunch + 15471 Food_Carrots,Raw + 53.6 Food_Celery,_Raw
 + 296.5 Food_Cheddar_Cheese + 1252.2 Food_Cheerios
 + 1308.7 Food_Chicknoodl_Soup + 101.8 Food_Chocolate_Chip_Cookies
 + 1252.2 Food_Corn_Flks,_Kellogg'S + 153.8 Food_Crm_Mshrm_Soup,W_Mlk
 + 5867.4 Food_Frozen_Broccoli + 106.6 Food_Frozen_Corn + 24 Food_Grapes
 + 126.3 Food_Hamburger_W_Toppings + 133 Food_Kiwifruit,Raw,Fresh
 + 66 Food_Lettuce,Iceberg,Raw + 163.7 Food_New_E_Clamchwd,W_Mlk
 + 20.1 Food_Neweng_Clamchwd + 37.4 Food_Oatmeal + 2.9 Food_Oatmeal_Cookies
 + 268.6 Food_Oranges + 467.7 Food_Peppers,_Sweet,_Raw
 + 281.9 Food_Pizza_W_Pepperoni + 316 Food_Poached_Eggs
 + 55.6 Food_Popcorn,Air_Popped + 14.7 Food_Pork
 + 61.5 Food_Potato_Chips,Bbqflvr + 1250.2 Food_Raisin_Brn,_Kellg'S
 + 1252.2 Food_Rice_Krispies + 77.4 Food_Roasted_Chicken
 + 53.8 Food_Sardines_in_Oil + 409.2 Food_Scrambled_Eggs
 + 499.8 Food_Skim_Milk + 3055.2 Food_Spaghetti_W__Sauce
 + 1252.2 Food_Special_K + 4872 Food_Splt_Pea&Hamsoup + 855 Food_Taco
 + 98.6 Food_Tofu + 766.3 Food_Tomato,Red,Ripe,Raw + 1393 Food_Tomato_Soup
 + 55.6 Food_Tortilla_Chip + 3785.1 Food_Vegetbeef_Soup
 + 68 Food_White_Tuna_in_Water >= 1000
MinVit_C_IU: 2.3 Food_2%_Lowfat_Milk + 2.3 Food_3.3%_Fat,Whole_Milk
 + 7.9 Food_Apple,Raw,W_Skin + 0.9 Food_Apple_Pie + 10.4 Food_Banana
 + 1.5 Food_Beanbacn_Soup,W_Watr + 5.1 Food_Carrots,Raw + 2.8 Food_Celery,_Raw
 + 15.1 Food_Cheerios + 15.1 Food_Corn_Flks,_Kellogg'S
 + 2.2 Food_Crm_Mshrm_Soup,W_Mlk + 10.8 Food_Frankfurter,_Beef
 + 160.2 Food_Frozen_Broccoli + 5.2 Food_Frozen_Corn + Food_Grapes
 + 7.4 Food_Ham,Sliced,Extralean + 2.6 Food_Hamburger_W_Toppings
 + 0.1 Food_Hotdog,_Plain + 5.5 Food_Kielbasa,Prk
 + 74.5 Food_Kiwifruit,Raw,Fresh + 0.8 Food_Lettuce,Iceberg,Raw
 + 3.5 Food_New_E_Clamchwd,W_Mlk + 4.8 Food_Neweng_Clamchwd
 + 0.1 Food_Oatmeal_Cookies + 69.7 Food_Oranges
 + 66.1 Food_Peppers,_Sweet,_Raw + 1.6 Food_Pizza_W_Pepperoni
 + 9.6 Food_Potato_Chips,Bbqflvr + 15.6 Food_Potatoes,_Baked
 + 15.1 Food_Rice_Krispies + 0.1 Food_Scrambled_Eggs + 2.4 Food_Skim_Milk
 + 27.9 Food_Spaghetti_W__Sauce + 15.1 Food_Special_K
 + 7 Food_Splt_Pea&Hamsoup + 2.2 Food_Taco + 0.1 Food_Tofu
 + 23.5 Food_Tomato,Red,Ripe,Raw + 133 Food_Tomato_Soup
 + 4.8 Food_Vegetbeef_Soup >= 400
enough_2%_Lowfat_Milk_requested: Food_2%_Lowfat_Milk
 - 0.1 isSelected_2%_Lowfat_Milk >= 0
enough_3.3%_Fat,Whole_Milk_requested: Food_3.3%_Fat,Whole_Milk
 - 0.1 isSelected_3.3%_Fat,Whole_Milk >= 0
enough_Apple,Raw,W/Skin_requested: Food_Apple,Raw,W_Skin
 - 0.1 isSelected_Apple,Raw,W_Skin >= 0
enough_Apple_Pie_requested: Food_Apple_Pie - 0.1 isSelected_Apple_Pie >= 0
enough_Bagels_requested: Food_Bagels - 0.1 isSelected_Bagels >= 0
enough_Banana_requested: Food_Banana - 0.1 isSelected_Banana >= 0
enough_Beanbacn_Soup,W/Watr_requested: Food_Beanbacn_Soup,W_Watr
 - 0.1 isSelected_Beanbacn_Soup,W_Watr >= 0
enough_Bologna,Turkey_requested: Food_Bologna,Turkey
 - 0.1 isSelected_Bologna,Turkey >= 0
enough_Butter,Regular_requested: Food_Butter,Regular
 - 0.1 isSelected_Butter,Regular >= 0
enough_Cap'N_Crunch_requested: Food_Cap'N_Crunch - 0.1 isSelected_Cap'N_Crunch
 >= 0
enough_Carrots,Raw_requested: Food_Carrots,Raw - 0.1 isSelected_Carrots,Raw
 >= 0
enough_Celery,_Raw_requested: Food_Celery,_Raw - 0.1 isSelected_Celery,_Raw
 >= 0
enough_Cheddar_Cheese_requested: Food_Cheddar_Cheese
 - 0.1 isSelected_Cheddar_Cheese >= 0
enough_Cheerios_requested: Food_Cheerios - 0.1 isSelected_Cheerios >= 0
enough_Chicknoodl_Soup_requested: Food_Chicknoodl_Soup
 - 0.1 isSelected_Chicknoodl_Soup >= 0
enough_Chocolate_Chip_Cookies_requested: Food_Chocolate_Chip_Cookies
 - 0.1 isSelected_Chocolate_Chip_Cookies >= 0
enough_Corn_Flks,_Kellogg'S_requested: Food_Corn_Flks,_Kellogg'S
 - 0.1 isSelected_Corn_Flks,_Kellogg'S >= 0
enough_Couscous_requested: Food_Couscous - 0.1 isSelected_Couscous >= 0
enough_Crm_Mshrm_Soup,W/Mlk_requested: Food_Crm_Mshrm_Soup,W_Mlk
 - 0.1 isSelected_Crm_Mshrm_Soup,W_Mlk >= 0
enough_Frankfurter,_Beef_requested: Food_Frankfurter,_Beef
 - 0.1 isSelected_Frankfurter,_Beef >= 0
enough_Frozen_Broccoli_requested: Food_Frozen_Broccoli
 - 0.1 isSelected_Frozen_Broccoli >= 0
enough_Frozen_Corn_requested: Food_Frozen_Corn - 0.1 isSelected_Frozen_Corn
 >= 0
enough_Grapes_requested: Food_Grapes - 0.1 isSelected_Grapes >= 0
enough_Ham,Sliced,Extralean_requested: Food_Ham,Sliced,Extralean
 - 0.1 isSelected_Ham,Sliced,Extralean >= 0
enough_Hamburger_W/Toppings_requested: Food_Hamburger_W_Toppings
 - 0.1 isSelected_Hamburger_W_Toppings >= 0
enough_Hotdog,_Plain_requested: Food_Hotdog,_Plain
 - 0.1 isSelected_Hotdog,_Plain >= 0
enough_Kielbasa,Prk_requested: Food_Kielbasa,Prk - 0.1 isSelected_Kielbasa,Prk
 >= 0
enough_Kiwifruit,Raw,Fresh_requested: Food_Kiwifruit,Raw,Fresh
 - 0.1 isSelected_Kiwifruit,Raw,Fresh >= 0
enough_Lettuce,Iceberg,Raw_requested: Food_Lettuce,Iceberg,Raw
 - 0.1 isSelected_Lettuce,Iceberg,Raw >= 0
enough_Macaroni,Ckd_requested: Food_Macaroni,Ckd - 0.1 isSelected_Macaroni,Ckd
 >= 0
enough_Malt_O_Meal,Choc_requested: Food_Malt_O_Meal,Choc
 - 0.1 isSelected_Malt_O_Meal,Choc >= 0
enough_New_E_Clamchwd,W/Mlk_requested: Food_New_E_Clamchwd,W_Mlk
 - 0.1 isSelected_New_E_Clamchwd,W_Mlk >= 0
enough_Neweng_Clamchwd_requested: Food_Neweng_Clamchwd
 - 0.1 isSelected_Neweng_Clamchwd >= 0
enough_Oatmeal_Cookies_requested: Food_Oatmeal_Cookies
 - 0.1 isSelected_Oatmeal_Cookies >= 0
enough_Oatmeal_requested: Food_Oatmeal - 0.1 isSelected_Oatmeal >= 0
enough_Oranges_requested: Food_Oranges - 0.1 isSelected_Oranges >= 0
enough_Peanut_Butter_requested: Food_Peanut_Butter
 - 0.1 isSelected_Peanut_Butter >= 0
enough_Peppers,_Sweet,_Raw_requested: Food_Peppers,_Sweet,_Raw
 - 0.1 isSelected_Peppers,_Sweet,_Raw >= 0
enough_Pizza_W/Pepperoni_requested: Food_Pizza_W_Pepperoni
 - 0.1 isSelected_Pizza_W_Pepperoni >= 0
enough_Poached_Eggs_requested: Food_Poached_Eggs - 0.1 isSelected_Poached_Eggs
 >= 0
enough_Popcorn,Air_Popped_requested: Food_Popcorn,Air_Popped
 - 0.1 isSelected_Popcorn,Air_Popped >= 0
enough_Pork_requested: Food_Pork - 0.1 isSelected_Pork >= 0
enough_Potato_Chips,Bbqflvr_requested: Food_Potato_Chips,Bbqflvr
 - 0.1 isSelected_Potato_Chips,Bbqflvr >= 0
enough_Potatoes,_Baked_requested: Food_Potatoes,_Baked
 - 0.1 isSelected_Potatoes,_Baked >= 0
enough_Pretzels_requested: Food_Pretzels - 0.1 isSelected_Pretzels >= 0
enough_Raisin_Brn,_Kellg'S_requested: Food_Raisin_Brn,_Kellg'S
 - 0.1 isSelected_Raisin_Brn,_Kellg'S >= 0
enough_Rice_Krispies_requested: Food_Rice_Krispies
 - 0.1 isSelected_Rice_Krispies >= 0
enough_Roasted_Chicken_requested: Food_Roasted_Chicken
 - 0.1 isSelected_Roasted_Chicken >= 0
enough_Sardines_in_Oil_requested: Food_Sardines_in_Oil
 - 0.1 isSelected_Sardines_in_Oil >= 0
enough_Scrambled_Eggs_requested: Food_Scrambled_Eggs
 - 0.1 isSelected_Scrambled_Eggs >= 0
enough_Skim_Milk_requested: Food_Skim_Milk - 0.1 isSelected_Skim_Milk >= 0
enough_Spaghetti_W/_Sauce_requested: Food_Spaghetti_W__Sauce
 - 0.1 isSelected_Spaghetti_W__Sauce >= 0
enough_Special_K_requested: Food_Special_K - 0.1 isSelected_Special_K >= 0
enough_Splt_Pea&Hamsoup_requested: Food_Splt_Pea&Hamsoup
 - 0.1 isSelected_Splt_Pea&Hamsoup >= 0
enough_Taco_requested: Food_Taco - 0.1 isSelected_Taco >= 0
enough_Tofu_requested: Food_Tofu - 0.1 isSelected_Tofu >= 0
enough_Tomato,Red,Ripe,Raw_requested: Food_Tomato,Red,Ripe,Raw
 - 0.1 isSelected_Tomato,Red,Ripe,Raw >= 0
enough_Tomato_Soup_requested: Food_Tomato_Soup - 0.1 isSelected_Tomato_Soup
 >= 0
enough_Tortilla_Chip_requested: Food_Tortilla_Chip
 - 0.1 isSelected_Tortilla_Chip >= 0
enough_Vegetbeef_Soup_requested: Food_Vegetbeef_Soup
 - 0.1 isSelected_Vegetbeef_Soup >= 0
enough_Wheat_Bread_requested: Food_Wheat_Bread - 0.1 isSelected_Wheat_Bread
 >= 0
enough_White_Bread_requested: Food_White_Bread - 0.1 isSelected_White_Bread
 >= 0
enough_White_Rice_requested: Food_White_Rice - 0.1 isSelected_White_Rice >= 0
enough_White_Tuna_in_Water_requested: Food_White_Tuna_in_Water
 - 0.1 isSelected_White_Tuna_in_Water >= 0
not_too_much2%_Lowfat_Milk: 121.2 Food_2%_Lowfat_Milk
 - 2500 isSelected_2%_Lowfat_Milk <= 0
not_too_much3.3%_Fat,Whole_Milk: 149.9 Food_3.3%_Fat,Whole_Milk
 - 2500 isSelected_3.3%_Fat,Whole_Milk <= 0
not_too_muchApple,Raw,W/Skin: 81.4 Food_Apple,Raw,W_Skin
 - 2500 isSelected_Apple,Raw,W_Skin <= 0
not_too_muchApple_Pie: 67.2 Food_Apple_Pie - 2500 isSelected_Apple_Pie <= 0
not_too_muchBagels: 78 Food_Bagels - 2500 isSelected_Bagels <= 0
not_too_muchBanana: 104.9 Food_Banana - 2500 isSelected_Banana <= 0
not_too_muchBeanbacn_Soup,W/Watr: 172 Food_Beanbacn_Soup,W_Watr
 - 2500 isSelected_Beanbacn_Soup,W_Watr <= 0
not_too_muchBologna,Turkey: 56.4 Food_Bologna,Turkey
 - 2500 isSelected_Bologna,Turkey <= 0
not_too_muchButter,Regular: 35.8 Food_Butter,Regular
 - 2500 isSelected_Butter,Regular <= 0
not_too_muchCap'N_Crunch: 119.6 Food_Cap'N_Crunch
 - 2500 isSelected_Cap'N_Crunch <= 0
not_too_muchCarrots,Raw: 23.7 Food_Carrots,Raw - 2500 isSelected_Carrots,Raw
 <= 0
not_too_muchCelery,_Raw: 6.4 Food_Celery,_Raw - 2500 isSelected_Celery,_Raw
 <= 0
not_too_muchCheddar_Cheese: 112.7 Food_Cheddar_Cheese
 - 2500 isSelected_Cheddar_Cheese <= 0
not_too_muchCheerios: 111 Food_Cheerios - 2500 isSelected_Cheerios <= 0
not_too_muchChicknoodl_Soup: 150.1 Food_Chicknoodl_Soup
 - 2500 isSelected_Chicknoodl_Soup <= 0
not_too_muchChocolate_Chip_Cookies: 78.1 Food_Chocolate_Chip_Cookies
 - 2500 isSelected_Chocolate_Chip_Cookies <= 0
not_too_muchCorn_Flks,_Kellogg'S: 110.5 Food_Corn_Flks,_Kellogg'S
 - 2500 isSelected_Corn_Flks,_Kellogg'S <= 0
not_too_muchCouscous: 100.8 Food_Couscous - 2500 isSelected_Couscous <= 0
not_too_muchCrm_Mshrm_Soup,W/Mlk: 203.4 Food_Crm_Mshrm_Soup,W_Mlk
 - 2500 isSelected_Crm_Mshrm_Soup,W_Mlk <= 0
not_too_muchFrankfurter,_Beef: 141.8 Food_Frankfurter,_Beef
 - 2500 isSelected_Frankfurter,_Beef <= 0
not_too_muchFrozen_Broccoli: 73.8 Food_Frozen_Broccoli
 - 2500 isSelected_Frozen_Broccoli <= 0
not_too_muchFrozen_Corn: 72.2 Food_Frozen_Corn - 2500 isSelected_Frozen_Corn
 <= 0
not_too_muchGrapes: 15.1 Food_Grapes - 2500 isSelected_Grapes <= 0
not_too_muchHam,Sliced,Extralean: 37.1 Food_Ham,Sliced,Extralean
 - 2500 isSelected_Ham,Sliced,Extralean <= 0
not_too_muchHamburger_W/Toppings: 275 Food_Hamburger_W_Toppings
 - 2500 isSelected_Hamburger_W_Toppings <= 0
not_too_muchHotdog,_Plain: 242.1 Food_Hotdog,_Plain
 - 2500 isSelected_Hotdog,_Plain <= 0
not_too_muchKielbasa,Prk: 80.6 Food_Kielbasa,Prk
 - 2500 isSelected_Kielbasa,Prk <= 0
not_too_muchKiwifruit,Raw,Fresh: 46.4 Food_Kiwifruit,Raw,Fresh
 - 2500 isSelected_Kiwifruit,Raw,Fresh <= 0
not_too_muchLettuce,Iceberg,Raw: 2.6 Food_Lettuce,Iceberg,Raw
 - 2500 isSelected_Lettuce,Iceberg,Raw <= 0
not_too_muchMacaroni,Ckd: 98.7 Food_Macaroni,Ckd
 - 2500 isSelected_Macaroni,Ckd <= 0
not_too_muchMalt_O_Meal,Choc: 607.2 Food_Malt_O_Meal,Choc
 - 2500 isSelected_Malt_O_Meal,Choc <= 0
not_too_muchNew_E_Clamchwd,W/Mlk: 163.7 Food_New_E_Clamchwd,W_Mlk
 - 2500 isSelected_New_E_Clamchwd,W_Mlk <= 0
not_too_muchNeweng_Clamchwd: 175.7 Food_Neweng_Clamchwd
 - 2500 isSelected_Neweng_Clamchwd <= 0
not_too_muchOatmeal: 145.1 Food_Oatmeal - 2500 isSelected_Oatmeal <= 0
not_too_muchOatmeal_Cookies: 81 Food_Oatmeal_Cookies
 - 2500 isSelected_Oatmeal_Cookies <= 0
not_too_muchOranges: 61.6 Food_Oranges - 2500 isSelected_Oranges <= 0
not_too_muchPeanut_Butter: 188.5 Food_Peanut_Butter
 - 2500 isSelected_Peanut_Butter <= 0
not_too_muchPeppers,_Sweet,_Raw: 20 Food_Peppers,_Sweet,_Raw
 - 2500 isSelected_Peppers,_Sweet,_Raw <= 0
not_too_muchPizza_W/Pepperoni: 181 Food_Pizza_W_Pepperoni
 - 2500 isSelected_Pizza_W_Pepperoni <= 0
not_too_muchPoached_Eggs: 74.5 Food_Poached_Eggs
 - 2500 isSelected_Poached_Eggs <= 0
not_too_muchPopcorn,Air_Popped: 108.3 Food_Popcorn,Air_Popped
 - 2500 isSelected_Popcorn,Air_Popped <= 0
not_too_muchPork: 710.8 Food_Pork - 2500 isSelected_Pork <= 0
not_too_muchPotato_Chips,Bbqflvr: 139.2 Food_Potato_Chips,Bbqflvr
 - 2500 isSelected_Potato_Chips,Bbqflvr <= 0
not_too_muchPotatoes,_Baked: 171.5 Food_Potatoes,_Baked
 - 2500 isSelected_Potatoes,_Baked <= 0
not_too_muchPretzels: 108 Food_Pretzels - 2500 isSelected_Pretzels <= 0
not_too_muchRaisin_Brn,_Kellg'S: 115.1 Food_Raisin_Brn,_Kellg'S
 - 2500 isSelected_Raisin_Brn,_Kellg'S <= 0
not_too_muchRice_Krispies: 112.2 Food_Rice_Krispies
 - 2500 isSelected_Rice_Krispies <= 0
not_too_muchRoasted_Chicken: 277.4 Food_Roasted_Chicken
 - 2500 isSelected_Roasted_Chicken <= 0
not_too_muchSardines_in_Oil: 49.9 Food_Sardines_in_Oil
 - 2500 isSelected_Sardines_in_Oil <= 0
not_too_muchScrambled_Eggs: 99.6 Food_Scrambled_Eggs
 - 2500 isSelected_Scrambled_Eggs <= 0
not_too_muchSkim_Milk: 85.5 Food_Skim_Milk - 2500 isSelected_Skim_Milk <= 0
not_too_muchSpaghetti_W/_Sauce: 358.2 Food_Spaghetti_W__Sauce
 - 2500 isSelected_Spaghetti_W__Sauce <= 0
not_too_muchSpecial_K: 110.8 Food_Special_K - 2500 isSelected_Special_K <= 0
not_too_muchSplt_Pea&Hamsoup: 184.8 Food_Splt_Pea&Hamsoup
 - 2500 isSelected_Splt_Pea&Hamsoup <= 0
not_too_muchTaco: 369.4 Food_Taco - 2500 isSelected_Taco <= 0
not_too_muchTofu: 88.2 Food_Tofu - 2500 isSelected_Tofu <= 0
not_too_muchTomato,Red,Ripe,Raw: 25.8 Food_Tomato,Red,Ripe,Raw
 - 2500 isSelected_Tomato,Red,Ripe,Raw <= 0
not_too_muchTomato_Soup: 170.7 Food_Tomato_Soup - 2500 isSelected_Tomato_Soup
 <= 0
not_too_muchTortilla_Chip: 142 Food_Tortilla_Chip
 - 2500 isSelected_Tortilla_Chip <= 0
not_too_muchVegetbeef_Soup: 158.1 Food_Vegetbeef_Soup
 - 2500 isSelected_Vegetbeef_Soup <= 0
not_too_muchWheat_Bread: 65 Food_Wheat_Bread - 2500 isSelected_Wheat_Bread
 <= 0
not_too_muchWhite_Bread: 65 Food_White_Bread - 2500 isSelected_White_Bread
 <= 0
not_too_muchWhite_Rice: 102.7 Food_White_Rice - 2500 isSelected_White_Rice
 <= 0
not_too_muchWhite_Tuna_in_Water: 115.6 Food_White_Tuna_in_Water
 - 2500 isSelected_White_Tuna_in_Water <= 0
Binaries
isSelected_2%_Lowfat_Milk
isSelected_3.3%_Fat,Whole_Milk
isSelected_Apple,Raw,W_Skin
isSelected_Apple_Pie
isSelected_Bagels
isSelected_Banana
isSelected_Beanbacn_Soup,W_Watr
isSelected_Bologna,Turkey
isSelected_Butter,Regular
isSelected_Cap'N_Crunch
isSelected_Carrots,Raw
isSelected_Celery,_Raw
isSelected_Cheddar_Cheese
isSelected_Cheerios
isSelected_Chicknoodl_Soup
isSelected_Chocolate_Chip_Cookies
isSelected_Corn_Flks,_Kellogg'S
isSelected_Couscous
isSelected_Crm_Mshrm_Soup,W_Mlk
isSelected_Frankfurter,_Beef
isSelected_Frozen_Broccoli
isSelected_Frozen_Corn
isSelected_Grapes
isSelected_Ham,Sliced,Extralean
isSelected_Hamburger_W_Toppings
isSelected_Hotdog,_Plain
isSelected_Kielbasa,Prk
isSelected_Kiwifruit,Raw,Fresh
isSelected_Lettuce,Iceberg,Raw
isSelected_Macaroni,Ckd
isSelected_Malt_O_Meal,Choc
isSelected_New_E_Clamchwd,W_Mlk
isSelected_Neweng_Clamchwd
isSelected_Oatmeal
isSelected_Oatmeal_Cookies
isSelected_Oranges
isSelected_Peanut_Butter
isSelected_Peppers,_Sweet,_Raw
isSelected_Pizza_W_Pepperoni
isSelected_Poached_Eggs
isSelected_Popcorn,Air_Popped
isSelected_Pork
isSelected_Potato_Chips,Bbqflvr
isSelected_Potatoes,_Baked
isSelected_Pretzels
isSelected_Raisin_Brn,_Kellg'S
isSelected_Rice_Krispies
isSelected_Roasted_Chicken
isSelected_Sardines_in_Oil
isSelected_Scrambled_Eggs
isSelected_Skim_Milk
isSelected_Spaghetti_W__Sauce
isSelected_Special_K
isSelected_Splt_Pea&Hamsoup
isSelected_Taco
isSelected_Tofu
isSelected_Tomato,Red,Ripe,Raw
isSelected_Tomato_Soup
isSelected_Tortilla_Chip
isSelected_Vegetbeef_Soup
isSelected_Wheat_Bread
isSelected_White_Bread
isSelected_White_Rice
isSelected_White_Tuna_in_Water
End
