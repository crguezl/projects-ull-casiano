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
end
