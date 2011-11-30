$:.unshift 'lib/'
require 'rake/testtask'

task :t => FileList['test/tc*.rb'] do |t|
  puts "Running tests"
  t.prerequisites.each do |r|
    puts "Tests in #{r}"
    require r
  end
end

# rake test TEST=just_one_file.rb     # run just one test file.
# rake test TESTOPTS="-v"             # run in verbose mode
Rake::TestTask.new do |t|
  # t.libs: List of directories to be added to $LOAD_PATH. (default is ‘lib’)
  t.libs << "test" 
  t.pattern = 'test/tc*.rb' # or t.test_files = FileList['test/tc*.rb'] 
  t.warning = true
  t.verbose = true # verbose test output. (default is false)
end
