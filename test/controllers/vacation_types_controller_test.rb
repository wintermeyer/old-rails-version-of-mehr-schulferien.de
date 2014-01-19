require 'test_helper'

class VacationTypesControllerTest < ActionController::TestCase
  setup do
    @vacation_type = vacation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacation_type" do
    assert_difference('VacationType.count') do
      post :create, vacation_type: { name: @vacation_type.name, slug: @vacation_type.slug }
    end

    assert_redirected_to vacation_type_path(assigns(:vacation_type))
  end

  test "should show vacation_type" do
    get :show, id: @vacation_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacation_type
    assert_response :success
  end

  test "should update vacation_type" do
    patch :update, id: @vacation_type, vacation_type: { name: @vacation_type.name, slug: @vacation_type.slug }
    assert_redirected_to vacation_type_path(assigns(:vacation_type))
  end

  test "should destroy vacation_type" do
    assert_difference('VacationType.count', -1) do
      delete :destroy, id: @vacation_type
    end

    assert_redirected_to vacation_types_path
  end
end
