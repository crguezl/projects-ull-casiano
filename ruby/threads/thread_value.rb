threads = []
x = ARGV.shift || 4
threads << t = Thread.new do
  x*x
end

v = t.value
puts v
threads.each &:join
