require 'test_helper'

class PersonalProfilesControllerTest < ActionController::TestCase
  setup do
    @personal_profile = personal_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_profile" do
    assert_difference('PersonalProfile.count') do
      post :create, personal_profile: { age: @personal_profile.age, dob: @personal_profile.dob, gender: @personal_profile.gender, guardian_name: @personal_profile.guardian_name, guardian_occupation: @personal_profile.guardian_occupation, height: @personal_profile.height, mother_tongue: @personal_profile.mother_tongue, nationality: @personal_profile.nationality, weight: @personal_profile.weight }
    end

    assert_redirected_to personal_profile_path(assigns(:personal_profile))
  end

  test "should show personal_profile" do
    get :show, id: @personal_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_profile
    assert_response :success
  end

  test "should update personal_profile" do
    patch :update, id: @personal_profile, personal_profile: { age: @personal_profile.age, dob: @personal_profile.dob, gender: @personal_profile.gender, guardian_name: @personal_profile.guardian_name, guardian_occupation: @personal_profile.guardian_occupation, height: @personal_profile.height, mother_tongue: @personal_profile.mother_tongue, nationality: @personal_profile.nationality, weight: @personal_profile.weight }
    assert_redirected_to personal_profile_path(assigns(:personal_profile))
  end

  test "should destroy personal_profile" do
    assert_difference('PersonalProfile.count', -1) do
      delete :destroy, id: @personal_profile
    end

    assert_redirected_to personal_profiles_path
  end
end
