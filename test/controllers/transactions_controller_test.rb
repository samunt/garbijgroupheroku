require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end
  #
  test "should get show" do
    #get :show, params: {id:transactions(:one).id}
    get :show, transactions: "one"
    assert_response :success
  end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should get create" do
  #   data_hash = Hash.new
  #   data_hash= {
  #     buy_space_id: 3,
  #     sell_space_id: 2,
  #     total_fee: 4,
  #     transaction_date: "June",
  #     quantity: 1,
  #     space_id: 1
  #   }
  #   params = {
  #     :transaction => data_hash
  #   }
  #   get :create, params
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end
  #
  # test "should get delete" do
  #   get :delete
  #   assert_response :success
  # end

end
