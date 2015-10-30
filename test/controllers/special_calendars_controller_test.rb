require 'test_helper'

class SpecialCalendarsControllerTest < ActionController::TestCase
  test "should get inverse" do
    get :inverse
    assert_response :success
  end

  test "should get brueckentage" do
    get :brueckentage
    assert_response :success
  end

end
