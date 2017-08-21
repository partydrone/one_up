require "test_helper"

describe InvitationsController do
  it "should get new" do
    get invitations_new_url
    value(response).must_be :success?
  end

end
