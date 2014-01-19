require 'test_helper'

class VacationPeriodsControllerTest < ActionController::TestCase
  setup do
    @vacation_period = vacation_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacation_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacation_period" do
    assert_difference('VacationPeriod.count') do
      post :create, vacation_period: { description: @vacation_period.description, end_date: @vacation_period.end_date, start_date: @vacation_period.start_date, state: @vacation_period.state, vacation_periodable_id: @vacation_period.vacation_periodable_id, vacation_periodable_type: @vacation_period.vacation_periodable_type, vacation_type_id: @vacation_period.vacation_type_id }
    end

    assert_redirected_to vacation_period_path(assigns(:vacation_period))
  end

  test "should show vacation_period" do
    get :show, id: @vacation_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacation_period
    assert_response :success
  end

  test "should update vacation_period" do
    patch :update, id: @vacation_period, vacation_period: { description: @vacation_period.description, end_date: @vacation_period.end_date, start_date: @vacation_period.start_date, state: @vacation_period.state, vacation_periodable_id: @vacation_period.vacation_periodable_id, vacation_periodable_type: @vacation_period.vacation_periodable_type, vacation_type_id: @vacation_period.vacation_type_id }
    assert_redirected_to vacation_period_path(assigns(:vacation_period))
  end

  test "should destroy vacation_period" do
    assert_difference('VacationPeriod.count', -1) do
      delete :destroy, id: @vacation_period
    end

    assert_redirected_to vacation_periods_path
  end
end
