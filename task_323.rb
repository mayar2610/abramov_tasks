# Дано натуральне число n.
# Знайти всі натуральні числа, меньші за n
# і взаємно прості з ним.

puts 'Please, enter a number: '
n = gets.chomp.to_i

def relative_prime(n)
  relative_primes = []
  n_divisors = (1..n / 2).select { |item| (n % item).zero? && item > 1 }

  (2...n).each do |number|
    n_divisors.each do |divisor|
      break if (number % divisor).zero?
      relative_primes << number
    end
  end
  relative_primes.uniq!
  "List of relative primes to number #{n}: #{relative_primes.join(', ')}"
end
