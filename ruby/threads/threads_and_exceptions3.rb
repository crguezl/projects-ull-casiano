Thread.abort_on_exception = true
threads = []
4.times do |i|
  threads[i] = Thread.new(i) { |k|
    raise "Boom!!!!!!!!!!!!!!!" if k == 2
    print "#{k} working ...\n"
  }
end
puts "threads.length = #{threads.length}"
threads.each { |t| t.join }
