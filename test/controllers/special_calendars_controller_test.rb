require 'test_helper'

class SpecialCalendarsControllerTest < ActionController::TestCase
  test "should get inverse" do
    get :inverse
    assert_response :success
  end

  test "should get bridging_days" do
    get :bridging_days
    assert_response :success
  end

end
