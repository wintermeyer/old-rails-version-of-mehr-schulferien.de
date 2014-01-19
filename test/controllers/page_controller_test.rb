require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get developer" do
    get :developer
    assert_response :success
  end

  test "should get api" do
    get :api
    assert_response :success
  end

end
