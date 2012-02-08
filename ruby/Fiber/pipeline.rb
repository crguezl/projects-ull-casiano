class PipelineElement
  attr_accessor :source, :task, :fiber

  def initialize(task, s = nil)
    @source = s
    @task = task
    if @source 
      @fiber = Fiber.new do
        while value = @source.resume
          #do something with value
          # 'nil' will end the process
          @task.call(value)
        end
      end
    else    # first element in the pipeline
      @fiber = Fiber.new do
        @task.call
      end
    end # if
  end

  def |(nextproc)
    nextproc.source = self
    nextproc
  end

  def resume 
    @fiber.resume
  end
end

evens = PipelineElement.new(
          lambda do
            value = 0
            loop do
              Fiber.yield value
              value += 2
            end
          end
        )
           
mult3 = PipelineElement.new(
          lambda do |value|
             Fiber.yield value if value % 3 == 0
          end,
          evens
        )
           
10.times do
   puts mult3.resume
end

10.times do
   puts (evens | mult3).resume
end
