require 'drb'

DRb.start_service

address = "druby://localhost:61675"
server = DRbObject.new_with_uri(address)

puts server.inspect
puts server.say_hello
