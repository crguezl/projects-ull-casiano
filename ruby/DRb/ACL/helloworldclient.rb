require 'drb'

#                      "druby://127.0.0.1:61676"
# druby://imac-de-casiano-rodriguez-leon.local:49357
DRb.start_service

#address = "druby://imac-de-casiano-rodriguez-leon.local:61676"
myip = `ifconfig en0 inet`.match(/(?:(?:\d{,3}\.)+\d{,3})/)[0]
address = "druby://#{myip}:61676"
server = DRbObject.new_with_uri(address)

puts server.inspect
puts server.say_hello
