require 'drb'
require 'user1'

class UserServer

 attr_accessor :users

 def initialize
   self.users = []
   5.times do |i|
     user = User.new
     user.id = i+1
     user.username = "user#{user.id}"
     self.users << user
   end
 end

 def find(id)
   self.users[id-1]
 end
end

File.open('pid.proc', 'w') { |f| f.puts $$ }

DRb.start_service("druby://localhost:61676", UserServer.new)
DRb.thread.join

