require 'drb/drb'

File.open("DRbhw.proc", 'w') { |f| f.puts $$ }
DRb.start_service('druby://localhost:23456', Hash.new())
DRb.thread.join()
