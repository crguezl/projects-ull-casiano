require 'rinda/ring'

class HelloWorldServer
  include DRbUndumped

  def say_hello
    "Hello world!"
  end
end

DRb.start_service
ring_server = Rinda::RingFinger.primary
ring_server.write([:hello_world_service, 
                  :HelloWorldServer,
                  HelloWorldServer.new,
                  'I like to say hi!'],
                  Rinda::SimpleRenewer.new)
DRb.thread.join
