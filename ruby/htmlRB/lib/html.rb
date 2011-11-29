=begin rdoc
* HTML tags are implemented using method_missing. 
  Here is an example of use:

    q= HTML.new {  
      html {
        head(:dir => "chazam", :lang => "spanish") { title "My wonderful home page" }
        body do
          h1 "Welcome to my home page!", :class => "chuchu", :lang => "spanish"
          b "My hobbies:"
          ul do
            li "Juggling"
            li "Knitting"
            li { i "Sleeping" } 
            li "Metaprogramming"
          end #ul
        end # body
      }
    }

  Args are:

  1. A string
  2. Optionally a Hash

  or

  1. The optional hash
  2. A block specifying the text to be bracketed

* The <tt>page</tt> attribute contains an array with the paragraphs
  of the <tt>HTML</tt> page
=end rdoc
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
      text = @page.pop.to_s
    else
      text = args.shift.to_s || "\n"
    end
    tagattr = build_attr(args.shift) 
    text = "<#{tag}#{tagattr}>\n#{text}\n</#{tag}>"
    @page[-1].push text
    text
  end

  def to_s
    @page.join("\n")
  end
end

