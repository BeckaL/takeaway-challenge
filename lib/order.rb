require_relative 'menu'
require_relative 'SMS'
require 'date'

class Order

  attr_reader :current_order, :order_total

  def initialize(menu = Menu, sms = SMS, selection = SELECTION)
    @food = menu.new
    @current_order = []
    @order_total = 0
    @text = sms.new
    @selection = selection.new
  end

  def place_order
    puts 'Select your items - type "stop" when your order is complete'
    @food.display
    select_items
    check_price
    @text.send(format_text)
  end

  private

  def delivery_time
    in_one_hour = Time.now + 60 * 60
    return in_one_hour.strftime('%H:%M')
  end

  def format_text
    items = "\nHere's your order:\n" + @current_order.join("\n")
    items += "\n£#{order_total}"
    time = "\nApproximate delivery time: #{get_time}"
    return items + time
  end

  def select_items
    loop do
      selection = gets.chomp.downcase
      break if selection == 'stop'
      check_items(selection)
    end
  end

  def check_price
    puts 'input expected price'
    expected_price = gets.chomp.to_f
    raise 'order not placed, incorrect amount' if expected_price != @order_total
  end

  def check_items(selection)
    price = @food.items[selection]
    return puts 'item not recognised' if price.nil?
    @current_order << selection
    @order_total += price
  end

end

my_order = Order.new
my_order.place_order
