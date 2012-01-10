require 'drb'
require 'drb/ssl'

$SAFE=1

class HelloWorldServer
  def say_hello
    'Hello world!'
  end
end

File.open('DRbhw.proc', 'w') do |f|
  f.puts $$
end

private_key = OpenSSL::PKey::RSA.new(File.read("hello-server/hello-server_keypair.pem"))
certificate = OpenSSL::X509::Certificate.new(File.read("hello-server/cert_hello-server.pem"))

config = { :SSLPrivateKey => private_key, :SSLCertificate => certificate }
#address = "druby://imac-de-casiano-rodriguez-leon.local:61676"
address = "drbssl://localhost:61676"
DRb.start_service(address, obj=HelloWorldServer.new, config)
puts "Process #{$$}: Server running at #{address} serving #{obj}"
DRb.thread.join
