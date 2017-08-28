require "test_helper"

describe Participation do
  let(:participation) { Participation.new }

  it "must be valid" do
    value(participation).must_be :valid?
  end
end
