require 'drb'

class HelloWorldServer
  def say_hello
    'Hello world!'
  end
end

File.open('DRbhw.proc', 'w') { |f| f.puts $$ }

serverip = File.open('MyIP', 'r').gets.chomp

#address = "druby://imac-de-casiano-rodriguez-leon.local:61676"
#address = "druby://127.0.0.1:61676"
address = "druby://#{serverip}:61676"
DRb.start_service(address, HelloWorldServer.new)
DRb.thread.join
