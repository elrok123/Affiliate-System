require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
