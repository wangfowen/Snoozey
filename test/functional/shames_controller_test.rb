require 'test_helper'

class ShamesControllerTest < ActionController::TestCase
  setup do
    @shame = shames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shame" do
    assert_difference('Shame.count') do
      post :create, shame: @shame.attributes
    end

    assert_redirected_to shame_path(assigns(:shame))
  end

  test "should show shame" do
    get :show, id: @shame.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shame.to_param
    assert_response :success
  end

  test "should update shame" do
    put :update, id: @shame.to_param, shame: @shame.attributes
    assert_redirected_to shame_path(assigns(:shame))
  end

  test "should destroy shame" do
    assert_difference('Shame.count', -1) do
      delete :destroy, id: @shame.to_param
    end

    assert_redirected_to shames_path
  end
end
