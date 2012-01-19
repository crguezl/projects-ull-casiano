require 'drb'

#address = "druby://localhost:61676"
address = "drbssl://localhost:61676"
server = DRbObject.new_with_uri(address)

puts server.say_hello
