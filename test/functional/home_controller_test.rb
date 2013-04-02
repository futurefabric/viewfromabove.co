require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get max_id" do
    get :max_id
    assert_response :success
  end

end
