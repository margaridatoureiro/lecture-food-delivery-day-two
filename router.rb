# frozen_string_literal: true

class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    puts 'Welcome to the Food Delivery!'
    puts '           --           '

    while @running
    @employee = @sessions_controller.sign_in
      while @employee
        if @employee.manager?
          display_manager_tasks
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_rider_tasks
          action = gets.chomp.to_i
          print `clear`
          route_rider_action(action)
        end
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then sign_out
    when 6 then stop
    else
      puts 'Please press 1, 2, 3, 4, 5 or 6'
    end
  end

  def route_rider_action(action)
    case action
    when 1 then "TODO: Mark one of my orders as delivered"
    when 2 then "TODO: List all undelivered orders"
    when 3 then sign_out
    when 4 then stop
    else
      puts 'Please press 1, 2, 3 o 4'
    end
  end

  def stop
    @employee = nil
    @running = false
  end

  def sign_out
    @employee = nil
  end

  def display_manager_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1 - List all meals'
    puts '2 - Create a new meal'
    puts '3 - List all customers'
    puts '4 - Create a new customer'
    puts '5 - Sign out'
    puts '6 - Stop and exit the program'
  end

  def display_rider_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1 - Mark one of my orders as delivered'
    puts '2 - List all my undelivered orders'
    puts '3 - Sign out'
    puts '4 - Stop and exit the program'
  end
  
end