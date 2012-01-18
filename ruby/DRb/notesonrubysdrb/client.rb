require "drb"
require "drb/observer"

sleep_time = ARGV[0].to_i
worker = DRbObject.new(nil, "druby://127.0.0.1:1337")
val = worker.run(sleep_time)
puts "test val: #{val}"
