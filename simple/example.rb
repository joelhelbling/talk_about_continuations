foo = Fiber.new do
  puts "first foo"
  Fiber.yield
  puts "second foo"
end

bar = Fiber.new do
  puts "first bar"
  Fiber.yield
  puts "second bar"
end

foo.resume
bar.resume
foo.resume
bar.resume
