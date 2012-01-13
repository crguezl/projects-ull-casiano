require "drb/drb"
require "thread"

File.open('DRbhw.proc', 'w') { |f| f.puts $$ }

queue = SizedQueue.new(10)
DRb.start_service('druby://localhost:61676', queue)
DRb.thread.join
