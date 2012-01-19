require "drb/drb"
require "monitor"

DRb.start_service

File.open("logger.proc", 'w') { |f| f.puts $$; $stderr.puts $$ }
dict = DRbObject.new_with_uri("druby://localhost:23456")

class SimpleLogger
  include MonitorMixin

  def initialize(stream = $stderr)
    super
    @stream = stream
  end

  def log(s)
    s = "#{Time.now}: #{s}"
    synchronize do
      @stream.puts s
    end
  end

end

logger = SimpleLogger.new
dict['logger'] = logger
dict['logger info'] = "SimpleLogger is here."
sleep
