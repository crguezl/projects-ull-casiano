#!/usr/bin/env ruby

require 'drb'
require 'drb/ssl'

File.open('DRbhw.proc', 'w') do |f|
  f.puts $$
end

here = "drbssl://localhost:3456"

class HelloWorld
  include DRbUndumped
  
  def hello(name)
    "Hello, #{name}."
  end
end

config = {
  :SSLVerifyMode => OpenSSL::SSL::VERIFY_PEER |
                           OpenSSL::SSL::VERIFY_FAIL_IF_NO_PEER_CERT,
  :SSLPrivateKey =>
    OpenSSL::PKey::RSA.new(File.read("hello-server/hello-server_keypair.pem")),
  :SSLCertificate =>
    OpenSSL::X509::Certificate.new(File.read("hello-server/cert_hello-server.pem")),
  :SSLCACertificateFile => "CA/cacert.pem",
}

DRb.start_service here, HelloWorld.new, config
puts DRb.uri
DRb.thread.join

