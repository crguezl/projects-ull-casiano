require "test/unit"
require "shoulda"

require_relative "../lib/anagram/options"

class TestOptions < Test::Unit::TestCase
  context "specifying a dictionary" do
    should "return default" do
      opts = Anagram::Options.new(["someword"])
      assert_equal Anagram::Options::DEFAULT_DICTIONARY, opts.dictionary
    end
  end
end
