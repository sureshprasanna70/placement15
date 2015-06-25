require 'test_helper'

class SemesterMarksControllerTest < ActionController::TestCase
  setup do
    @semester_mark = semester_marks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:semester_marks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semester_mark" do
    assert_difference('SemesterMark.count') do
      post :create, semester_mark: { gpa: @semester_mark.gpa, pass_year: @semester_mark.pass_year, semester: @semester_mark.semester }
    end

    assert_redirected_to semester_mark_path(assigns(:semester_mark))
  end

  test "should show semester_mark" do
    get :show, id: @semester_mark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @semester_mark
    assert_response :success
  end

  test "should update semester_mark" do
    patch :update, id: @semester_mark, semester_mark: { gpa: @semester_mark.gpa, pass_year: @semester_mark.pass_year, semester: @semester_mark.semester }
    assert_redirected_to semester_mark_path(assigns(:semester_mark))
  end

  test "should destroy semester_mark" do
    assert_difference('SemesterMark.count', -1) do
      delete :destroy, id: @semester_mark
    end

    assert_redirected_to semester_marks_path
  end
end
