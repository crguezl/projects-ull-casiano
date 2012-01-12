require 'drb'

class HelloWorldServer
  def say_hello
    'Hello world!'
  end
end

File.open('DRbhw.proc', 'w') do |f|
  f.puts $$
end
#address = "druby://imac-de-casiano-rodriguez-leon.local:61675"
address = "druby://localhost:61676"
DRb.start_service(address, obj=HelloWorldServer.new)
puts "Process #{$$}: Server running at #{address} serving #{obj}"
DRb.thread.join
