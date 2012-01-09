require 'drb'
require 'drb/acl'

#$SAFE = 1
class HelloWorldServer
  def say_hello
    'Hello world!'
  end
end

File.open('DRbhw.proc', 'w') { |f| f.puts $$ }

myip = File.open('MyIP', 'r').readlines.map { |ip| ["allow",  ip.chomp] }.flatten
serverip = myip[1]

puts "<#{myip.inspect}>"

acl = ACL.new(%w{deny all }+ myip)
puts acl.inspect
DRb.install_acl(acl)

address = "druby://#{serverip}:61676"
puts address
DRb.start_service(address, obj=HelloWorldServer.new)
puts "Process #{$$}: Server running at #{address} serving #{obj}"
DRb.thread.join
