require 'test_helper'

class MonthsControllerTest < ActionController::TestCase
  setup do
    @month = months(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:months)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create month" do
    assert_difference('Month.count') do
      post :create, month: { slug: @month.slug, value: @month.value, year_id: @month.year_id }
    end

    assert_redirected_to month_path(assigns(:month))
  end

  test "should show month" do
    get :show, id: @month
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @month
    assert_response :success
  end

  test "should update month" do
    patch :update, id: @month, month: { slug: @month.slug, value: @month.value, year_id: @month.year_id }
    assert_redirected_to month_path(assigns(:month))
  end

  test "should destroy month" do
    assert_difference('Month.count', -1) do
      delete :destroy, id: @month
    end

    assert_redirected_to months_path
  end
end
