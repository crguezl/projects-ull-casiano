require 'monitor.rb'

buf = []
buf.extend(MonitorMixin)  # singleton with Monitor attributes
empty_cond = buf.new_cond

# consumer
Thread.start do
  loop do
    buf.synchronize do
      empty_cond.wait_while { buf.empty? }
      print "received:\n<#{buf.shift}>" 
    end
  end
end

# producer
while line = ARGF.gets
  buf.synchronize do
    buf.push(line)
    empty_cond.signal
  end
end
