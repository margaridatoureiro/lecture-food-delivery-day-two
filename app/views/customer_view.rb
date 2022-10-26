class CustomerView 
  def ask_user_for(word)
    puts "#{word.capitalize}?"
    print "> "
    gets.chomp
  end

  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} (lives in: #{customer.address})"
    end
  end
end