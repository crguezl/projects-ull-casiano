require "drb/drb"
require "thread"

File.open("#{ENV['HOME']}/DRbSSH/DRbhw.proc", 'w') { |f| f.puts $$ }

queue = SizedQueue.new(5)
DRb.start_service('druby://localhost:61675', queue)
DRb.thread.join
