#!/usr/bin/ruby -w
# http://eric_rollins.home.mindspring.com/ParallelRuby.html

# parallel.rb
# Simple example of parallel processing using distributed ruby (DRb)
# Eric Rollins 2006

# In normal usage start supervisor on one machine using argument "super"
# Start N workers on various machines using argument portnum.
# Workers are listed in global variable $workers, below.

# Supervisor first reads filenames from source directory into queue.
# Creates one thread per worker.
# Each thread repeatedly reads next filename from queue, reads file contents,
#   sends contents via blocking RPC using DRb to worker, and writes response
#   to new file.

# Demonstration task is simple file content substitutions.

require 'thread'
require 'drb'

usage = "usage:  parallel.rb portnumber\n" +
  "  Performs parallel string substitution on directory of test files\n" +
  "  portnum == super for supervisor\n" +
  "  portnum == 0     for test with no workers"

#----------------------------------------------------------------------
def init_supervisor
  # Machine name and port number of worker processes.
  $workers = ["pavilion:9000", "pavilion:9001", "ratchet:9000", "ratchet:9001", "localhost:9000"]

  $source_dir = "/home/erollins/paralleltest/source"
  $dest_dir = "/home/erollins/paralleltest/dest"

  # Thread-safe queue.
  $queue = Queue.new

  Dir.foreach($source_dir){|filename|
    next if filename == "."
    next if filename == ".."
    $queue.enq filename
  }

  $workers.size.times {
    $queue.enq :END_OF_WORK
  }
end

#----------------------------------------------------------------------
# Simple dummy task of file substitutions.
def process_text text
  newtext = text.gsub(/if/, 'IF')

  30.times { |i|
    newtext.gsub!(/for/, 'FOR')
    newtext.gsub!(/while/, 'WHILE')
    newtext.gsub!(/switch/, 'SWITCH')
    newtext.gsub!(/case/, 'CASE')
    newtext.gsub!(/goto/, 'GOTO')
    newtext.gsub!(/struct/, 'STRUCT')
    newtext.gsub!(/int/, 'INT')
    newtext.gsub!(/char/, 'CHAR')
    newtext.gsub!(/return/, 'RETURN')
  }

  return newtext
end

#----------------------------------------------------------------------
# Single process test case.
def no_workers
  loop do
    filename = $queue.deq
    break if filename == :END_OF_WORK
    text = IO.read($source_dir + "/" + filename)
    revised_text = process_text text
  
    File.open($dest_dir + "/" + filename,"w+"){|file|
      file.write revised_text
    }

    #  puts filename
  end
end

#----------------------------------------------------------------------
def run_supervisor_threads
  threads = []
  DRb.start_service
  
  for w in $workers
    threads << Thread.new(w) do |worker|
      puts "started worker #{worker}"
      remote_worker = DRbObject.new(nil, 'druby://' + worker)
      count = 0

      loop do
        filename = $queue.deq
        break if filename == :END_OF_WORK
        text = IO.read($source_dir + "/" + filename)
        # TODO : can this request time out on failure, so it can be requeued?
        revised_text = remote_worker.process text
  
        File.open($dest_dir + "/" + filename,"w+"){|file|
          file.write revised_text
        }
        
        count = count + 1
      end
      puts "finished worker #{worker} : #{count} files"
    end
  end

  threads.each {|thr| thr.join }
end

#----------------------------------------------------------------------
class WorkerServer
  def process text
    return process_text(text)
  end
end

def start_worker port_number
  server = WorkerServer.new
  DRb.start_service('druby://:' + port_number, server)
  DRb.thread.join
end

#----------------------------------------------------------------------
if ARGV.size != 1
  puts usage
elsif ARGV[0] == "0"
  init_supervisor()
  no_workers()
elsif ARGV[0] == "super"
  init_supervisor()
  run_supervisor_threads()
else
  start_worker ARGV[0]
end
