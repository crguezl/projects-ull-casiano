require 'monitor'

numbers = []
numbers.extend(MonitorMixin)
number_added = numbers.new_cond

# Reporter thread
consumer = Thread.new do
  4.times do
    numbers.synchronize do
      number_added.wait_while { numbers.empty? }
      puts numbers.shift
    end
  end
end

# Prime number generator thread
generator = Thread.new do
  p = 1
  4.times do
    numbers.synchronize do
      numbers << (p = p*2)
      number_added.signal
    end
  end
end

generator.join
consumer.join
