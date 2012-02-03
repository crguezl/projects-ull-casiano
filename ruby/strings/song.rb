Song = Struct.new(:file, :duration, :author, :title)
songs = []
File.foreach(ARGV.shift || 'song.txt') do |line|
  file, duration, author, title = line.split(/\s*\|\s*/)
  songs << Song.new(file, duration, author, title)
end
puts songs
