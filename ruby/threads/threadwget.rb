require 'net/http'

pages = %w{nereida.deioc.ull.es www.ull.es www.google.com}
threads = [] # Array containing the threads
for p in pages
  threads << Thread.new(p) do |url|
    www = Net::HTTP.new(url, 80)
    h = www.get('/')
    print "Got #{url}. Resp:\n#{h.message}\n"
    puts h
  end
end
threads.each { |t| t.join }
  
