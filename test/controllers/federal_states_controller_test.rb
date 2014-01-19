require 'test_helper'

class FederalStatesControllerTest < ActionController::TestCase
  setup do
    @federal_state = federal_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:federal_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create federal_state" do
    assert_difference('FederalState.count') do
      post :create, federal_state: { country_id: @federal_state.country_id, name: @federal_state.name, slug: @federal_state.slug }
    end

    assert_redirected_to federal_state_path(assigns(:federal_state))
  end

  test "should show federal_state" do
    get :show, id: @federal_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @federal_state
    assert_response :success
  end

  test "should update federal_state" do
    patch :update, id: @federal_state, federal_state: { country_id: @federal_state.country_id, name: @federal_state.name, slug: @federal_state.slug }
    assert_redirected_to federal_state_path(assigns(:federal_state))
  end

  test "should destroy federal_state" do
    assert_difference('FederalState.count', -1) do
      delete :destroy, id: @federal_state
    end

    assert_redirected_to federal_states_path
  end
end
