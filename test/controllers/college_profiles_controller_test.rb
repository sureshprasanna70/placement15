require 'test_helper'

class CollegeProfilesControllerTest < ActionController::TestCase
  setup do
    @college_profile = college_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:college_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create college_profile" do
    assert_difference('CollegeProfile.count') do
      post :create, college_profile: { branch: @college_profile.branch, cgpa: @college_profile.cgpa, college: @college_profile.college, degree: @college_profile.degree, level: @college_profile.level, semester: @college_profile.semester }
    end

    assert_redirected_to college_profile_path(assigns(:college_profile))
  end

  test "should show college_profile" do
    get :show, id: @college_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @college_profile
    assert_response :success
  end

  test "should update college_profile" do
    patch :update, id: @college_profile, college_profile: { branch: @college_profile.branch, cgpa: @college_profile.cgpa, college: @college_profile.college, degree: @college_profile.degree, level: @college_profile.level, semester: @college_profile.semester }
    assert_redirected_to college_profile_path(assigns(:college_profile))
  end

  test "should destroy college_profile" do
    assert_difference('CollegeProfile.count', -1) do
      delete :destroy, id: @college_profile
    end

    assert_redirected_to college_profiles_path
  end
end
