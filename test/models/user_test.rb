require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #  test "makes new user" do
  #    user121 = User.new
  #    user121.first_name = "Jon"
  #    user121.last_name = "doe"
  #    user121.email = "jd@testing.net"
  #    user121.password = "test"
  #    user121.password_confirmation = "test"
  #    user121.phone = "4165557777"
  #    user121.credit_card_number = "1234567891234567"
  #    user121.credit_card_month = "06"
  #    user121.credit_card_year = "2018"
  #    user121.credit_card_verification_value = "444"
  #    assert user121.save
  #  end

   test "should get show" do
     #get :show, params: {id:transactions(:one).id}
     get :show, users: "one"
     assert_response :success
   end
end
