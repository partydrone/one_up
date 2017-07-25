require "test_helper"

describe Identity do
  let(:identity) { Identity.new(provider: 'discord', uid: '1234567890', user_id: users(:one).id) }

  it "must be valid" do
    value(identity).must_be :valid?
  end
end
