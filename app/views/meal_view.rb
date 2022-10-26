class MealView 
  def ask_user_for(word)
    puts "#{word.capitalize}?"
    print "> "
    gets.chomp
  end

  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} (#{meal.price} euros)"
    end
  end
end