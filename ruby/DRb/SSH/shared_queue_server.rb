require "drb/drb"
require "thread"

File.open('DRbSSH/DRbhw.proc', 'w') { |f| f.puts $$ }

queue = SizedQueue.new(5)
DRb.start_service('druby://localhost:61676', queue)
DRb.thread.join
