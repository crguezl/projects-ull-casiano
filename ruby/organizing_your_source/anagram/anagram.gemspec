#require "rake/gempackagetask"
 
spec = Gem::Specification.new do |s|
  s.name = 'anagram'
  s.version = '0.0.1' # PKG_VERSION
  s.date = "2012-02-21"
  s.summary = "Makes anagrams of a word."
  s.description = <<-EOF
anagram is an executable that gives you the anagrams
of a given word
EOF
  s.authors     = ["Casiano Rodriguez"]
  s.email       = 'casiano.rodriguez.leon@gmail.com'
  s.files = Dir['**/**'] # PKG_FILES
  s.homepage    =
  s.platform = Gem::Platform::RUBY
  s.requirements << 'none'
  s.require_path = 'lib'
  s.autorequire = 'rake'
end


#Rake::GemPackageTask.new(spec) do |pkg|
#  pkg.need_zip = true
#  pkg.need_tar = true
#end
