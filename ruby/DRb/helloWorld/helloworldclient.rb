require 'drb'

#                      "druby://127.0.0.1:61676"
server = DRbObject.new('druby://127.0.0.1:61676')

puts server.say_hello
