class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, qty)
    @ingredients_required[ingredient] += qty
  end

  def ingredients
    @ingredients_required.keys
  end
end
