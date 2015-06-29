require 'test_helper'

class ExtraActivitiesControllerTest < ActionController::TestCase
  setup do
    @extra_activity = extra_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extra_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extra_activity" do
    assert_difference('ExtraActivity.count') do
      post :create, extra_activity: { area_of_interest: @extra_activity.area_of_interest, extra_curricular: @extra_activity.extra_curricular, hobby: @extra_activity.hobby, responsibilty: @extra_activity.responsibilty }
    end

    assert_redirected_to extra_activity_path(assigns(:extra_activity))
  end

  test "should show extra_activity" do
    get :show, id: @extra_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @extra_activity
    assert_response :success
  end

  test "should update extra_activity" do
    patch :update, id: @extra_activity, extra_activity: { area_of_interest: @extra_activity.area_of_interest, extra_curricular: @extra_activity.extra_curricular, hobby: @extra_activity.hobby, responsibilty: @extra_activity.responsibilty }
    assert_redirected_to extra_activity_path(assigns(:extra_activity))
  end

  test "should destroy extra_activity" do
    assert_difference('ExtraActivity.count', -1) do
      delete :destroy, id: @extra_activity
    end

    assert_redirected_to extra_activities_path
  end
end
