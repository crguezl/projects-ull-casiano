def scanner(testfile, regexp) 
  Fiber.new {
    File.foreach(testfile) { |line|
      line.scan(regexp) do |word|
        Fiber.yield word.downcase
      end
    }
  }
end

def counter_sep
  c = 0
  Fiber.new do
    loop do
      c += 1
      if (c % 10) == 0 
        Fiber.yield "\n"
      else
        Fiber.yield " "
      end
    end
  end
end

testfile = ARGV.shift || $0 
regexp =  ARGV.shift  || /[a-zA-Z_]\w+/
words = scanner(testfile, regexp)
counts = Hash.new(0)
while word = words.resume
  counts[word] += 1
end
sep = counter_sep
counts.keys.sort.each do |w|
  print "#{w}: #{counts[w]}#{sep.resume}"
end
puts
