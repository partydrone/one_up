require "test_helper"

describe IdentityService do
  let(:identity_service) { IdentityService.new(provider: 'discord', uid: '1234567890', user_id: users(:one).id) }

  it "must be valid" do
    value(identity_service).must_be :valid?
  end
end
