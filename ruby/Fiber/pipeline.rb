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
          end,
        )
           
mult = []
[3, 5].each_with_index  do |k, i| 
  mult[i] = PipelineElement.new(
    lambda do |value|
       Fiber.yield value if value % k == 0
    end,
    evens
  )
end
           
10.times do
   puts mult[1].resume
end

10.times do
   puts (evens | mult[0] | mult[1]).resume
end
