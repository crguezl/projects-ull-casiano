def inc(n)
 n += 1
end

sum = 0
mutex = Mutex.new
threads = (1..10).map {
  Thread.new do 
    10_000.times do 
      #sum += 1
      mutex.lock
        sum = inc(sum)
      mutex.unlock
    end
  end
}

threads.each(&:join)
p sum
