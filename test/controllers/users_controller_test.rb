require "test_helper"

describe UsersController do
  it "should get new" do
    get new_user_path
    value(response).must_be :success?
  end

  it "should get edit" do
    get edit_user_path(users(:one))
    value(response).must_be :success?
  end

end
