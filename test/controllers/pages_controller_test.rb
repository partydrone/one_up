require "test_helper"

describe PagesController do
  it "gets the home page" do
    get root_path
    must_respond_with :success
  end
end
