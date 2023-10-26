class View
  def ask_for_name
    # print the question
    puts "What is the name of the recipe??"
    # get user input
    gets.chomp
  end

  def ask_for_description
    # print the question
    puts "What is the description of the recipe??"
    # get user input
    gets.chomp
  end

  def display_all(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}: #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for_index # this should return an index (integer)
    puts "Give us the number"
    gets.chomp.to_i - 1
  end
end
