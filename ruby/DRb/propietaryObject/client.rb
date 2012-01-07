require 'drb'

user_server = DRbObject.new_with_uri("druby://localhost:61676")

user = user_server.find(1)

puts "user: #{user.inspect}"

puts "Original username: #{user.username}"

user.username = 'bobsmith'

puts user.save

user = user_server.find(1)

puts "username now is: #{user.username}"
