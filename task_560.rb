# Два натуральних числа називають дружніми,
# якщо кожне з них дорівнює сумі всіх дільників
# другого, крім самого цього числа.
# Знайти всі пари дружніх чисел в діапазоні від 200 до 300

def amicables(a, b)
  result = ''
  #number_range = (a..b).to_a

  count_divisors = lambda do |range, number|
    range.inject { |sum, el| (number % el).zero? ? sum + el : sum }
  end

  number_range = (a..b).to_a.each do |item|
    item_divisors = count_divisors.call((1..item / 2), item)
    next if number_range.count(item_divisors).zero? || item == item_divisors

    relative = number_range.find { |el| el == item_divisors }
    relative_divisors = count_divisors.call((1..relative / 2), relative)
    next if relative_divisors != item

    result << "#{item} and #{relative} are amicable numbers. \n"
    number_range.reject! { |n| n == item || n == relative }
  end

  result
end
puts amicables(20, 300)
