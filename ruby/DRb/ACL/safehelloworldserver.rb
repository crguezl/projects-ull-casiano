require 'drb'

class HelloWorldServer
  def say_hello
    'Hello world!'
  end
end

$SAFE = 1
File.open('DRbhw.proc', 'w') do |f|
  f.puts $$
end
#address = "druby://imac-de-casiano-rodriguez-leon.local:61676"

serverip = File.open('MyIP', 'r').gets.chomp
address = "druby://#{serverip}:61676"
DRb.start_service(address, obj=HelloWorldServer.new)
puts "Process #{$$}: Server running at #{address} serving #{obj}"
DRb.thread.join
