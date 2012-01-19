require 'drb'
require 'drb/ssl'


config = {
  :SSLVerifyMode        => OpenSSL::SSL::VERIFY_PEER,
  :SSLCACertificateFile => "CA/cacert.pem"
}
#                      "druby://127.0.0.1:61676"
DRb.start_service(nil, nil, config)

#address = "druby://imac-de-casiano-rodriguez-leon.local:61676"
address = "drbssl://localhost:61676"
server = DRbObject.new_with_uri(address)

puts server.inspect
puts server.say_hello
