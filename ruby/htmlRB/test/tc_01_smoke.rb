require 'test/unit'
require "html"

class TestHTML < Test::Unit::TestCase
  def test_simplepage
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

    puts q.inspect

    expected = <<'EXPECTEDHTMLPAGE'
<html>
<head dir = "chazam" lang = "spanish">
<title>
My wonderful home page
</title>
</head> <body>
<h1 class = "chuchu" lang = "spanish">
Welcome to my home page!
</h1> <b>
My hobbies:
</b> <ul>
<li>
Juggling
</li> <li>
Knitting
</li> <li>
<i>
Sleeping
</i>
</li> <li>
Metaprogramming
</li>
</ul> 
</body>
</html>
EXPECTEDHTMLPAGE
    qtrim = q.to_s.gsub(/\s+/,'')
    etrim = expected.gsub(/\s+/,'')

    assert_equal aqtrim, aetrim
  end
end
