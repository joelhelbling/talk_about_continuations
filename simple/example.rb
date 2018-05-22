hepburn = Fiber.new do
  puts "first Hepburn (rb)"
  Fiber.yield
  puts "second Hepburn (rb)"
end

bogart = Fiber.new do
  puts "first Bogart (rb)"
  Fiber.yield
  puts "second Bogart (rb)"
end

hepburn.resume
bogart.resume
hepburn.resume
bogart.resume
