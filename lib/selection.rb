class Selection

  def initialize(food)
    @food = food
    @current_order = []
    @order_total = 0
  end

  def select_order
    select_items
    check_price
    return { current_order: @current_order, order_total: @order_total }
  end

  private

  def select_items
    loop do
      selection = gets.chomp.downcase
      break if selection == 'stop'
      check_items(selection)
      puts 'next item (type "stop" to complete order)'
    end
  end

  def check_price
    puts 'Input expected price'
    expected_price = gets.chomp.to_f
    raise 'order not placed, incorrect amount' if expected_price != @order_total
  end

  def check_items(selection)
    price = @food.items[selection]
    return puts 'item not recognised' if price.nil?
    puts 'input quantity:'
    quantity = gets.chomp
    @current_order << quantity + ' * ' + selection.capitalize
    @order_total += price * quantity.to_i
  end

end
