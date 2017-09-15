def fibonacci(n)
  fibo_arr = [0, 1]
  (2..n).each do |i|
    item = fibo_arr[i - 1] + fibo_arr[i - 2]
    fibo_arr << item
  end
  fibo_arr
end
puts fibonacci(10)
