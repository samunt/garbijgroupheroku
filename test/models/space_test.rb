require 'test_helper'

class SpaceTest < ActiveSupport::TestCase
   test "makes new space" do
     space1234 = Space.new
     assert true
   end
end
