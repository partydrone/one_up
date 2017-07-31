require "test_helper"

describe RegistrationsController do
  let(:registration) { registrations(:one) }

  it "gets edit" do
    get edit_registration_path(registration)
    value(response).must_be :success?
  end

end
