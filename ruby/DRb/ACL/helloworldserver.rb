require 'drb'
require 'drb/acl'

#$SAFE = 1
class HelloWorldServer
  def say_hello
    'Hello world!'
  end
end

File.open('DRbhw.proc', 'w') { |f| f.puts $$ }

myip = ''
File.open('MyIP', 'r') { |f| myip = f.gets.chomp! }
puts "<#{myip}>"
acl = ACL.new(%w{deny all allow }+ [ myip ])
DRb.install_acl(acl)

address = "druby://#{myip}:61676"
puts address
DRb.start_service(address, obj=HelloWorldServer.new)
puts "Process #{$$}: Server running at #{address} serving #{obj}"
DRb.thread.join
