def squared_numbers(n)
  result = []
  4.times do
    result << Math.sqrt(n).floor
    n -= Math.sqrt(n).floor**2
  end
  result
end

puts squared_numbers()
