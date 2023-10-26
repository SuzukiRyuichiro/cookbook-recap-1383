require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook # cookbook instance with .all, .destroy, etc
    @view = View.new
  end

  def add
    # ask the view to get the name
    name = @view.ask_for_name
    # ask the view to get the desc
    description = @view.ask_for_description
    # make a new instance of Recipe
    new_recipe = Recipe.new(name, description)
    # ask the cookbook to create the recipe
    @cookbook.create(new_recipe)
  end

  def list
    display_recipes
  end

  def remove
    # display all the recipes
    display_recipes
    # ask the view to get the index to destroy
    index = @view.ask_for_index
    # cookbook to destroy the recipe in said index
    @cookbook.destroy(index)
  end

  private

  def display_recipes
    # cookbook to give all the recipe
    recipes = @cookbook.all
    # ask the view to display them nicely
    @view.display_all(recipes)
  end
end
