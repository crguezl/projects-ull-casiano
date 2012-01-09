require 'drb'
require "drb/acl"

class HelloWorldServer
  def say_hello
    'Hello world!'
  end
end

$SAFE = 1
File.open('DRbhw.proc', 'w').puts $$

#address = "druby://imac-de-casiano-rodriguez-leon.local:61676"

acl = ACL.new(%w{deny all allow 10.213.5.59 allow 193.145.105.252})
puts acl.inspect

DRb.install_acl(acl)

serverip = "193.145.105.252"
address = "druby://#{serverip}:61676"
DRb.start_service(address, obj=HelloWorldServer.new)
puts "Process #{$$}: Server running at #{address} serving #{obj}"
DRb.thread.join
