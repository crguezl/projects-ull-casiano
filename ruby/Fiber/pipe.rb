def evens
  Fiber.new do
    value = 0
    loop do
      Fiber.yield value
      value += 2
    end
  end
end

def multiples_of_three(source)
  Fiber.new do
    loop do
      next_value = source.resume
      Fiber.yield next_value if next_value % 3 == 0
    end
  end
end

def consumer(source)
  Fiber.new do
    10.times do
      next_value = source.resume
      puts next_value
    end
  end
end

#consumer(evens).resume
consumer(multiples_of_three(evens)).resume
