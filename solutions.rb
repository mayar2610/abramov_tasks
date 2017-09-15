module Solutions
  
  def division_check(*args)
    n = args[0].to_i
    result = *(1..n)
    result.reject! { |elem| elem % 5 != 0 || (elem % 7).zero? }
    ">>> Count: #{result.size}. Sum: #{result.sum}"
  end

  def relative_prime(*args)
    n = args[0].to_i
    relative_primes = *(2...n)
    n_divisors = get_divisors((2..n / 2), n)

    n_divisors.map do |divider|
      relative_primes.reject! { |el| (el % divider).zero? || (n % el).zero? }
    end
    ">>> List of relative primes to number #{n}: #{relative_primes.join(', ')}"
  end

  def amicable_numbers(a = 200, b = 300)
    number_range = *(a..b)
    number_range.map do |item|
      item_divs = get_divisors((1..item / 2), item).sum
      next if number_range.count(item_divs).zero? || item == item_divs

      relative = number_range.find { |el| el == item_divs }
      relative_divs = get_divisors((1..relative / 2), relative).sum
      next if relative_divs != item
      number_range.reject! { |n| n == item || n == relative }
      print ">>> #{item} and #{relative} are amicable numbers."
    end
  end
 
  def squared_numbers(n)
    result = []
    3.times do
      result << Math.sqrt(n).floor
      n -= Math.sqrt(n).floor**2
    end
    result
  end

  private

  def get_divisors(range, number)
    range.select { |item| (number % item).zero? }
  end
end
