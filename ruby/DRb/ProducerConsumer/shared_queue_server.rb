require "drb/drb"
require "thread"

File.open('DRbhw.proc', 'w') { |f| f.puts $$ }

queue = SizedQueue.new(10)
DRb.start_service('druby://localhost:9999', queue)
DRb.thread.join
