require 'test_helper'

class CalculationsControllerTest < ActionController::TestCase
  test "should get emi" do
    get :emi
    assert_response :success
  end

end
