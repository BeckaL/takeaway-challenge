
require_relative 'menu'
require_relative 'SMS'
require_relative 'selection'

require 'date'

class Order

  attr_reader :current_order, :order_total

  def initialize(menu = Menu, sms = SMS, selection = Selection)
    @food = menu.new
    @sms = sms.new
    @selection = selection.new(@food)
  end

  def place_order
    puts 'Select your items - type "stop" when your order is complete'
    @food.display
    choice = @selection.select_order
    @sms.send(choice[:current_order], choice[:order_total])
  end

end

my_order = Order.new
my_order.place_order
