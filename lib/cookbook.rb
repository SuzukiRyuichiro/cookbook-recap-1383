require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def create(recipe) # expect this to be an instance of Recipe
    @recipes << recipe
    save_csv
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  def all
    @recipes
  end

  private

  def load_csv
    # open the csv file
    CSV.foreach(@csv_file_path) do |row|
      # look at each row in csv
      # instanciate recipe with name and description in each row
      name = row[0]
      description = row[1]
      # put the insatnce into @recipes
      @recipes << Recipe.new(name, description)
    end
  end

  def save_csv
    # look at each recipe in @recipes
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        # write the name and description in a CSV row
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
