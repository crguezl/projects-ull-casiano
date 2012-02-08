require 'fiber'
you = Fiber.new do
  Fiber.yield "potato"
  Fiber.yield "tomato"
end
puts "I say potato"
puts "You say #{you.resume}"
puts "I say tomato"
puts "You say #{you.resume}"
