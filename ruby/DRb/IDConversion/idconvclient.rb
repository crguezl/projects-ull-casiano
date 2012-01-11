require "drb"

s = DRbObject.new_with_uri("druby://127.0.0.1:61676")

puts s.inspect

h = s.say_hello

puts h.inspect
