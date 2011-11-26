class HTML
  attr_accessor :page

  def initialize(&block)
    @page = [[]]
    instance_eval &block
  end

  def build_attr(attributes)
      return '' if attributes.nil? or  attributes.empty?
      attributes.inject("") { |s,x| s += %{ #{x[0]} = "#{x[1]}"} } 
  end

  def method_missing(tag, *args)
    if block_given?
      @page.push []
      yield 
      text = @page.pop.join(' ')
      tagattr = build_attr(args.shift) 
    else
      text = args.shift.to_s || "\n"
      tagattr = build_attr(args.shift) 
    end
    text = "<#{tag}#{tagattr}>\n#{text}\n</#{tag}>"
    @page[-1].push text
    text
  end

  def to_s
    @page.join("\n")
  end
end

