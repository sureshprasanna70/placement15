require 'test_helper'

class AcademicDetailsControllerTest < ActionController::TestCase
  setup do
    @academic_detail = academic_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academic_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create academic_detail" do
    assert_difference('AcademicDetail.count') do
      post :create, academic_detail: { course: @academic_detail.course, examination_authority: @academic_detail.examination_authority, institution: @academic_detail.institution, pass_year: @academic_detail.pass_year, percentage: @academic_detail.percentage }
    end

    assert_redirected_to academic_detail_path(assigns(:academic_detail))
  end

  test "should show academic_detail" do
    get :show, id: @academic_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @academic_detail
    assert_response :success
  end

  test "should update academic_detail" do
    patch :update, id: @academic_detail, academic_detail: { course: @academic_detail.course, examination_authority: @academic_detail.examination_authority, institution: @academic_detail.institution, pass_year: @academic_detail.pass_year, percentage: @academic_detail.percentage }
    assert_redirected_to academic_detail_path(assigns(:academic_detail))
  end

  test "should destroy academic_detail" do
    assert_difference('AcademicDetail.count', -1) do
      delete :destroy, id: @academic_detail
    end

    assert_redirected_to academic_details_path
  end
end
