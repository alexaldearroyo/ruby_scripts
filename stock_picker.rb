def stock_picker(prices)
  return nil if prices.length < 2

  min_price = prices[0]
  max_profit = prices[1] - prices[0]
  buy_day = 0
  sell_day = 1

  prices.each_with_index do |price, index|
    # Skip the first day since we initialized min_price and max_profit using the first two days
    next if index == 0

    # Check if we can get a better profit by buying at the last 'min_price' and selling at the current price
    potential_profit = price - min_price
    if potential_profit > max_profit
      max_profit = potential_profit
      sell_day = index
    end

    # Update min_price if the current price is lower
    if price < min_price
      min_price = price
      buy_day = index
      # Since we're setting a new potential buying day, reset the selling day
      sell_day = -1
    end
  end

  # If max_profit is negative or zero, it means it's better not to make any transaction
  return [buy_day, sell_day] unless max_profit <= 0
  nil
end
