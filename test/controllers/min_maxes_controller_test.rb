require 'test_helper'

class MinMaxesControllerTest < ActionController::TestCase
  setup do
    @min_max = min_maxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:min_maxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create min_max" do
    assert_difference('MinMax.count') do
      post :create, min_max: { number_of_vacation_days: @min_max.number_of_vacation_days, slug: @min_max.slug }
    end

    assert_redirected_to min_max_path(assigns(:min_max))
  end

  test "should show min_max" do
    get :show, id: @min_max
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @min_max
    assert_response :success
  end

  test "should update min_max" do
    patch :update, id: @min_max, min_max: { number_of_vacation_days: @min_max.number_of_vacation_days, slug: @min_max.slug }
    assert_redirected_to min_max_path(assigns(:min_max))
  end

  test "should destroy min_max" do
    assert_difference('MinMax.count', -1) do
      delete :destroy, id: @min_max
    end

    assert_redirected_to min_maxes_path
  end
end
