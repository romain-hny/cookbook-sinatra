require 'csv'
require_relative 'recipe'

# repository
class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(csv_file_path) do |each_recipe|
      recipe = Recipe.new({ name: each_recipe[0], description: each_recipe[1] })
      @recipes << recipe
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    modify_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    modify_csv
  end

  def remove_all
    @recipes = []
    modify_csv
  end

  def recipe_done(index)
    recipe_to_mark = @recipes[index]
    recipe_to_mark.done = "true"
    modify_csv
  end

  private

  def modify_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end

# CSV.open(filepath, "wb") do |csv|
#   csv << ["First Name", "Last Name", "Instrument"]
#   csv << ["John", "Lennon", "Guitar"]
#   csv << ["Paul", "McCartney", "Bass Guitar"]
#   # ...
# end
