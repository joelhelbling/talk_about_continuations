fib = Fiber.new do
  n1, n2 = 0, 1
  while true do
    (n1 + n2).tap do |n3|
      Fiber.yield n3
      n1, n2 = n2, n3
    end
  end
end

10.times do
  puts fib.resume
end
