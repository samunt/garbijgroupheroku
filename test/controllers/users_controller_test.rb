require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  test "should get show" do
    get :show,  id: users(:one).id
    # get :show, params: { id: users(:one).id }
    # get :show, users: "one"
    assert_response :success
  end

end
