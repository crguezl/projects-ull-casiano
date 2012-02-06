#require "rake/gempackagetask"
 
Gem::Specification.new do |s|
  s.name = "hola_casiano"
  s.version = "0.0.1"
  s.date = "2012-02-03"
  s.summary     = "Hola!"
  s.description = "A simple hello world gem"
  s.authors     = ["Casiano Rodriguez"]
  s.email       = 'casiano.rodriguez.leon@gmail.com'
  s.files       = ["lib/hola_casiano.rb", "lib/hola_casiano/translator.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola_casiano'

end

#Rake::GemPackageTask.new(spec) do |pkg|
#  pkg.need_zip = true
#  pkg.need_tar = true
#end
