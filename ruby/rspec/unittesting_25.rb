#require "tennis_scorer"
require "unittesting_26"

describe TennisScorer, "basic scoring" do
  it "should start with a score of 0-0" do
    ts = TennisScorer.new
    ts.score.should == "0-0"
  end

  it "should be 15-0 if the server wins a point" do
    ts = TennisScorer.new
    ts.give_point_to(:server)
    ts.score.should == "15-0"
  end


  it "should be 0-15 if the receiver wins a point"
  it "should be 15-15 after they both win a point"
end
