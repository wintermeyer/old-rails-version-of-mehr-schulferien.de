require 'test_helper'

class SchoolTypesControllerTest < ActionController::TestCase
  setup do
    @school_type = school_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_type" do
    assert_difference('SchoolType.count') do
      post :create, school_type: { name: @school_type.name }
    end

    assert_redirected_to school_type_path(assigns(:school_type))
  end

  test "should show school_type" do
    get :show, id: @school_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_type
    assert_response :success
  end

  test "should update school_type" do
    patch :update, id: @school_type, school_type: { name: @school_type.name }
    assert_redirected_to school_type_path(assigns(:school_type))
  end

  test "should destroy school_type" do
    assert_difference('SchoolType.count', -1) do
      delete :destroy, id: @school_type
    end

    assert_redirected_to school_types_path
  end
end
