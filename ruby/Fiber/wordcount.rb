#encoding: utf-8
#Rodríguez León
C = 10
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
      if (c % C) == 0 
        Fiber.yield "\n"
      else
        Fiber.yield " "
      end
    end
  end
end

testfile = ARGV.shift || $0 
regexp =  Regexp.new(ARGV.shift  || '\p{Alpha}\p{Alnum}*', Regexp::IGNORECASE)
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
