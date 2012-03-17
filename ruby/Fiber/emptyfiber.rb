require 'fiber'
you = Fiber.new do |x| Fiber.yield x*x; Fiber.yield x+2; 1;  end
p you.resume(8)
p you.resume
p you.resume
p you.resume(7)

