require 'test_helper'

describe ApplicationHelper do
  describe "#full_title" do
    it "formats a title without an argument" do
      full_title.must_equal 'One Up'
    end

    it "formats a title with an empty argument" do
      full_title('').must_equal 'One Up'
    end

    it "formats a title with an argument" do
      full_title('Edit User').must_equal 'One Up - Edit User'
    end
  end
end
