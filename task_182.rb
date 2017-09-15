
# Дано натуральне число n, цілі числа a(1),....,a(n).
# Знайти кількість і суму тих членів даної послідовності,
# які діляться на 5 і не діляться на 7
def division_check(n)
  count = 0
  sum = 0
  (1..n).each do |i|
    if (i % 5).zero? && i % 7 != 0
      count += 1
      sum += i
    end
  end
  "Count: #{count}. Amount: #{sum}"
end