require 'drb/drb'

File.open('DRbhw.proc', 'a') { |f| f.puts $$ }

DRb.start_service
queue = DRbObject.new_with_uri('druby://localhost:9000')

10.times do |n|
  sleep(rand)
  queue.push(n)
end
DRb.thread.join
