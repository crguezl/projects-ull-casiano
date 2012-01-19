require 'monitor'
# In concurrent programming, a monitor is an object 
# or module intended to be used safely by more than 
# one thread. The defining characteristic of a monitor 
# is that its methods are executed with mutual exclusion. 

nums = []
nums.extend(MonitorMixin) # nums is now a monitor

#Conceptually a condition variable is a queue of threads, associated
#with a monitor, on which a thread may wait for some condition to
#become true. Thus each condition variable c is associated with an
#assertion Pc. While a thread is waiting on a condition variable,
#that thread is not considered to occupy the monitor, and so other
#threads may enter the monitor to change the monitor's state. In
#most types of monitors, these other threads may signal the condition
#variable c to indicate that assertion Pc is true in the current
#state.

#Thus there are two main operations on condition variables:

#   wait c is called by a thread that needs to wait until the
#   assertion Pc is true before proceeding. While the thread is
#   waiting, it does not occupy the monitor.  

#   signal c (sometimes written as notify c) is called by a 
#   thread to indicate that the assertion Pc is true.

number_added = nums.new_cond

# Reporter thread
consumer = Thread.new do
  4.times do
    nums.synchronize do
      number_added.wait_while { nums.empty? }
      puts nums.shift
    end
  end
end

# Prime number generator thread
generator = Thread.new do
  p = 1
  4.times do
    nums.synchronize do
      nums << (p = p*2)
      number_added.signal
    end
  end
end

generator.join
consumer.join
