require 'test_helper'

class ReligionsControllerTest < ActionController::TestCase
  setup do
    @religion = religions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:religions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create religion" do
    assert_difference('Religion.count') do
      post :create, religion: { name: @religion.name, slug: @religion.slug }
    end

    assert_redirected_to religion_path(assigns(:religion))
  end

  test "should show religion" do
    get :show, id: @religion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @religion
    assert_response :success
  end

  test "should update religion" do
    patch :update, id: @religion, religion: { name: @religion.name, slug: @religion.slug }
    assert_redirected_to religion_path(assigns(:religion))
  end

  test "should destroy religion" do
    assert_difference('Religion.count', -1) do
      delete :destroy, id: @religion
    end

    assert_redirected_to religions_path
  end
end
