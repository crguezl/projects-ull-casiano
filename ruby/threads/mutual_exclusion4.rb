class ExchangeRates
  def update_from_online_feed
    10
  end

  def convert(codeamount)
    "20$"
  end
end

rate_mutex = Mutex.new
exchange_rates = ExchangeRates.new

Thread.new do
  loop do
    #sleep 3600
    rate_mutex.synchronize do
      exchange_rates.update_from_online_feed
    end
  end
end
loop do
  print "Enter currency code and amount: "
  line = gets
  break if line =~ /^\s*$/
  if rate_mutex.try_lock
    begin
      puts exchange_rates.convert(line)
    ensure
      rate_mutex.unlock
    end
  else
    puts "Sorry, rates being updated. Try later"
  end
end
