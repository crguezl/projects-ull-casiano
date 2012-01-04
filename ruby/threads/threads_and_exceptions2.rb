threads = []
4.times do |i|
  threads[i] = Thread.new(i) { |k|
    raise "#{k}: Boom!!!!!!!!!!!!!!!" if k == 2
    print "#{k} working ...\n"
  }
end
puts "threads.length = #{threads.length}"
threads.each { |t|
  begin
    t.join
  rescue RuntimeError => e
    puts "Failed thread #{t}. Exception message: <<#{e.message}>>"
  end
}
