# http://www.pauldix.net/2007/07/notes-on-rubys-.html
require 'drb'
require 'drb/observer'
class Worker
  def initialize
    @test = 0
  end
  
  def run(sleep_val)
    sleep(sleep_val)
    @test += 1
    return @test
  end
end
worker = Worker.new
DRb.start_service("druby://127.0.0.1:1337", worker)
DRb.thread.join
