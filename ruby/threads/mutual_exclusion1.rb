def inc(n)
 n += 1
end

sum = 0
threads = (1..10).map {
  Thread.new do 
    10_000.times do 
      #sum += 1
      sum = inc(sum)
    end
  end
}

threads.each(&:join)
p sum
