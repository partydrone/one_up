require "test_helper"

describe Registration do
  let(:registration) { Registration.new }

  it "must be valid" do
    value(registration).must_be :valid?
  end
end
