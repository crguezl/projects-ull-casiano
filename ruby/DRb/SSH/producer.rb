require 'drb/drb'

File.open('DRbhw.proc', 'w') { |f| f.puts $$ }

DRb.start_service
queue = DRbObject.new_with_uri('druby://localhost:61675')

10.times do |n|
  sleep(rand)
  queue.push(n)
end
