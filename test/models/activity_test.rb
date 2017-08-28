require "test_helper"

describe Activity do
  let(:activity) { Activity.new }

  it "must be valid" do
    value(activity).must_be :valid?
  end
end
