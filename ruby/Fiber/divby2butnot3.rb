twos = Fiber.new do
  num = 2
  loop do
    Fiber.yield(num) unless num % 3 == 0
    num+=2
  end
end


10.times { puts twos.resume }
