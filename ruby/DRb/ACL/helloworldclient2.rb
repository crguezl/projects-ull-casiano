require 'drb'

#                      "druby://127.0.0.1:61676"
# druby://imac-de-casiano-rodriguez-leon.local:49357
DRb.start_service

#address = "druby://imac-de-casiano-rodriguez-leon.local:61676"
address = "druby://localhost:61676"
hwserver = DRbObject.new_with_uri(address)

puts hwserver.say_hello
