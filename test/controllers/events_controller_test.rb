require "test_helper"

describe EventsController do
  it "should get index" do
    get events_path
    value(response).must_be :success?
  end

  it "should get show" do
    get event_path(events(:one))
    value(response).must_be :success?
  end

  it "should get new" do
    get new_event_path
    value(response).must_be :success?
  end

  it "should get edit" do
    get edit_event_path(events(:one))
    value(response).must_be :success?
  end

end
