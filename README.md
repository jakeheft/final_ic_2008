## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

NOTE: In order to earn points, methods must be tested appropriately and implemented per the interaction pattern.

## Iteration 1 - Ingredient and Pantry

```markdown
There are **4** Possible Points in Iteration 1:
1. Ingredient Creation - including all attr_readers
2. Pantry Creation - including all attr_readers
3. Pantry #stock_check
4. Pantry #restock
```

Use TDD to build an `Ingredient` and a `Pantry` class that respond to the interaction pattern below:

  ```ruby
  require './lib/ingredient'
  # => true

require './lib/pantry'
# => true

ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
# => #<Ingredient:0x007fe6041273d8...>

ingredient1.name
# => "Cheese"

ingredient1.unit
# => "oz"

ingredient1.calories
# => 50

ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
# => #<Ingredient:0x007fd88582ed98...>

pantry = Pantry.new
# => #<Pantry:0x007fd8858863b8...>

pantry.stock
# => {}

pantry.stock_check(ingredient1)
# => 0

pantry.restock(ingredient1, 5)

pantry.restock(ingredient1, 10)

pantry.stock_check(ingredient1)
# => 15

pantry.restock(ingredient2, 7)

pantry.stock_check(ingredient2)
# => 7
```

## Iteration 2 - Recipe and CookBook

```markdown
There are **4** possible points in Iteration 2:
1. Recipe and CookBook Creation - including all attr_readers
2. Recipe #add_ingredient
3. Recipe #ingredients
4. CookBook #add_recipe
```

Use TDD to build a `Recipe` and a `CookBook` class that respond to the following interaction pattern.

For the `add_ingredient` method, the first argument is an Ingredient, and the second argument is the amount of the ingredient required for the Recipe.

The `total_calories` method should sum the calories of each ingredient. The calories for each ingredient can be calculated by multiplying the `calories` attribute of the Ingredient by the amount of the ingredient required for the recipe.

```ruby
require './lib/ingredient'
# => true

require './lib/recipe'
# => true

 ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
# => #<Ingredient:0x007fe8438c7a70...>

 ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
# => #<Ingredient:0x007fe843857f40...>

recipe1 = Recipe.new("Mac and Cheese")
# => #<Recipe:0x007fe84383d000...>

recipe1.name
# => "Mac and Cheese"

recipe1.ingredients_required
# => {}

recipe1.add_ingredient(ingredient1, 2)

recipe1.add_ingredient(ingredient1, 4)

recipe1.add_ingredient(ingredient2, 8)

recipe1.ingredients_required
# => {#<Ingredient:0x00007fd7811553c8...> => 6, #<Ingredient:0x00007fd78110b0e8...> => 8}

recipe1.ingredients
# => [#<Ingredient:0x007fe8438c7a70...>, #<Ingredient:0x007fe843857f40...>]

recipe2 = Recipe.new("Cheese Burger")

cookbook = CookBook.new
# => #<CookBook:0x00007faae6a42228 @recipes=[]>

cookbook.add_recipe(recipe1)

cookbook.add_recipe(recipe2)

cookbook.recipes
# => [#<Recipe:0x00007faae69c9698...>, #<Recipe:0x00007faae692a110...>]
```

## Iteration 3

```markdown
There are **4** possible points in Iteration 3:
1. Recipe #total_calories
2. CookBook #ingredients
3. CookBook #highest_calorie_meal
4. Pantry #enough_ingredients_for
```

Use TDD to update your `Recipe`, `CookBook` and `Pantry` classes so that they respond to the following interaction pattern:

```ruby
require './lib/pantry'
# => true

require './lib/ingredient'
# => true

require './lib/recipe'
# => true

require './lib/cook_book'
# => true

pantry = Pantry.new
# => #<Pantry:0x007fd8858863b8...>

cookbook = CookBook.new
# => #<CookBook:0x00007faae6a42228 @recipes=[]>

ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
# => #<Ingredient:0x00007faae6a207e0...>

ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
# => #<Ingredient:0x00007faae69e3cf0...>

recipe1 = Recipe.new("Mac and Cheese")
# => #<Recipe:0x00007faae69c9698...>

recipe1.add_ingredient(ingredient1, 2)

recipe1.add_ingredient(ingredient2, 8)

ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
# => #<Ingredient:0x00007faae6950860...>

ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
# => #<Ingredient:0x00007faae694bb80...>

recipe2 = Recipe.new("Cheese Burger")
# => #<Recipe:0x00007faae692a110...>

recipe2.add_ingredient(ingredient1, 2)

recipe2.add_ingredient(ingredient3, 4)

recipe2.add_ingredient(ingredient4, 1)

recipe1.total_calories
# => 440

recipe2.total_calories
# => 675

cookbook.add_recipe(recipe1)

cookbook.add_recipe(recipe2)

cookbook.ingredients
# => ["Cheese", "Macaroni", "Ground Beef", "Bun"]

cookbook.highest_calorie_meal
# => #<Recipe:0x00007faae692a110...>

pantry.restock(ingredient1, 5)

pantry.restock(ingredient1, 10)

pantry.enough_ingredients_for?(recipe1)
# => false

pantry.restock(ingredient2, 7)

pantry.enough_ingredients_for?(recipe1)
# => false

pantry.restock(ingredient2, 1)

pantry.enough_ingredients_for?(recipe1)
# => true
```

## Iteration 4

```markdown
There are **2** possible points in iteration 4
1. CookBook #date
2. CookBook #summary
```

Use TDD to build a `CookBook` class that responds to the following interaction pattern.

For the `summary`, ingredients are listed in order of calories. This is the amount of calories that ingredient contributes to the total calories of the recipe, not the amount of calories per single unit of the ingredient.

```ruby
require './lib/cook_book'
# => true

require './lib/ingredient'
# => true

require './lib/recipe'
# => true

cookbook = CookBook.new
# => #<CookBook:0x00007faae6a42228 @recipes=[]>

# The 'date' method should return the date the cookbook is created as "mm-dd-yyyy"
cookbook.date
# => "04-22-2020"

ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
# => #<Ingredient:0x00007faae6a207e0...>

ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
# => #<Ingredient:0x00007faae69e3cf0...>

recipe1 = Recipe.new("Mac and Cheese")
# => #<Recipe:0x00007faae69c9698...>

recipe1.add_ingredient(ingredient1, 2)

recipe1.add_ingredient(ingredient2, 8)

ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
# => #<Ingredient:0x00007faae6950860...>

ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
# => #<Ingredient:0x00007faae694bb80...>

recipe2 = Recipe.new("Burger")
# => #<Recipe:0x00007faae692a110...>

recipe2.add_ingredient(ingredient3, 4)

recipe2.add_ingredient(ingredient4, 100)

cookbook.add_recipe(recipe1)

cookbook.add_recipe(recipe2)

cookbook.summary
# => [{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}]
```
