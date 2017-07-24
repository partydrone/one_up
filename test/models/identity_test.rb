require "test_helper"

describe Identity do
  let(:identity) { Identity.new }

  it "must be valid" do
    value(identity).must_be :valid?
  end
end
