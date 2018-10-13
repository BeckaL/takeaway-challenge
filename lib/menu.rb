class Menu

  def initialize
    @items = {
            "Chilli paneer" => 5,
            "Daal" => 4.5,
            "Rice" => 1.5
           }
  end

  def display
    @items.map { |dish, price| "#{dish}: #{format_price(price)}" }.join("\n")
  end

  private

  def format_price(price)
    "£%.2f" % price
  end

end
