require 'test_helper'

class WorkstatusesControllerTest < ActionController::TestCase
  setup do
    @workstatus = workstatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workstatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workstatus" do
    assert_difference('Workstatus.count') do
      post :create, workstatus: { numrange: @workstatus.numrange, workstatus: @workstatus.workstatus }
    end

    assert_redirected_to workstatus_path(assigns(:workstatus))
  end

  test "should show workstatus" do
    get :show, id: @workstatus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workstatus
    assert_response :success
  end

  test "should update workstatus" do
    patch :update, id: @workstatus, workstatus: { numrange: @workstatus.numrange, workstatus: @workstatus.workstatus }
    assert_redirected_to workstatus_path(assigns(:workstatus))
  end

  test "should destroy workstatus" do
    assert_difference('Workstatus.count', -1) do
      delete :destroy, id: @workstatus
    end

    assert_redirected_to workstatuses_path
  end
end
