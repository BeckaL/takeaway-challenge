class TextBody

  def format_text(food, price)
    items = "\nHere's your order:\n" + food.join("\n")
    total_price = "\nOrder Total: £#{price}"
    time = "\nApproximate delivery time: #{delivery_time}"
    return items + total_price + time
  end

  private

  def delivery_time
    in_one_hour = Time.now + 60 * 60
    return in_one_hour.strftime('%H:%M')
  end

end
