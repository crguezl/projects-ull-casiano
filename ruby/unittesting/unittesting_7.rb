$: << "code"
#require 'unittesting_1'
require 'unittesting_5'
require 'test/unit'
class TestRoman < MiniTest::Unit::TestCase
  NUMBERS = []
  def test_simple
    NUMBERS.each do |a,r|
      assert_equal(r, Roman.new(a).to_s)
    end
  end
end
