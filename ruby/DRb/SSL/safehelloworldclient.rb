#!/usr/bin/env ruby

require 'drb'
require 'drb/ssl'

there = "drbssl://localhost:3456"

config = {
  :SSLVerifyMode => OpenSSL::SSL::VERIFY_PEER,
  :SSLCACertificateFile => "CA/cacert.pem",
  :SSLPrivateKey =>
    OpenSSL::PKey::RSA.new(File.read("hello-client/hello-client_keypair.pem")),
  :SSLCertificate =>
    OpenSSL::X509::Certificate.new(File.read("hello-client/cert_hello-client.pem")),
}

DRb.start_service nil, nil, config
h = DRbObject.new nil, there

while line = gets
  puts h.hello(line.chomp)
end

