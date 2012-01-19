require 'drb'

class Hello
  include DRbUndumped

  def to_s
    "Hello World!"
  end
end

class HelloWorldServer
  def say_hello
    h = Hello.new
    puts "Id of the object #{h.object_id}"
    h
  end
end

File.open('DRbhw.proc', 'w') do |f|
  f.puts $$
end

DRb.start_service('druby://127.0.0.1:61676',HelloWorldServer.new)

DRb.thread.join()
