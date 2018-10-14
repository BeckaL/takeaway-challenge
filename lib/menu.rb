class Menu

  # TODO: format prices so two decimals shown if float
  # TODO: load menu from csv?

  attr_reader :items

  def initialize

    @items = {
            "chilli paneer" => 5,
            "daal" => 4.5,
            "rice" => 1.5
           }
  end

  def display
    menu_lines = @items.map { |dish, price| "#{dish}: #{format_price(price)}" }
    puts menu_lines.join("\n")
  end

  private

  def format_price(price)
    "£%.2f" % price
  end

end
