require 'drb'

class HelloWorldServer
  def say_hello
    'Hello world!'
  end
end

puts $$
address = "druby://imac-de-casiano-rodriguez-leon.local:61676"
DRb.start_service(address, HelloWorldServer.new)
DRb.thread.join
