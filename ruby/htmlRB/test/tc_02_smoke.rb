require 'test/unit'
require "html"

class TestHTML < Test::Unit::TestCase
  def test_attr
    q= HTML.new {  
      head "chuchum", :dir => "chazam", :lang => "spanish"  
    }

    expected = "<head lang = \"spanish\" dir = \"chazam\">\nchuchum\n</head>"

    qs = q.to_s
    assert_match  /dir = "chazam"/, qs
    assert_match  /lang = "spanish"/, qs
  end

  def test_attr2
    q= HTML.new {  
        html {
          head(:dir => "chazam", :lang => "spanish") { title "My wonderful home page" }
          body do
            h1 "Welcome to my home page!", :class => "chuchu", :lang => "senegalese"
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
    qs = q.to_s
    assert_match  /dir = "chazam"/, qs
    assert_match  /lang = "spanish"/, qs
    assert_match  /class = "chuchu"/, qs
    assert_match  /lang = "senegalese"/, qs
  end
end
