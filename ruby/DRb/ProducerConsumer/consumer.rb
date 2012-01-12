require 'drb/drb'

DRb.start_service
queue = DRbObject.new_with_uri('druby://localhost:9999')

10.times do |n|
  sleep(rand)
  puts queue.pop
end

