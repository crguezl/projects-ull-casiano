require "rinda/ring"

DRb.start_service
ring_server = Rinda::RingFinger.primary
service = ring_server.read([:hello_world_service, nil, nil, nil])
server = service[2]

puts server.say_hello
puts service.inspect
