require 'test_helper'

class GrepsControllerTest < ActionController::TestCase
  setup do
    @grep = greps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:greps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grep" do
    assert_difference('Grep.count') do
      post :create, :grep => @grep.attributes
    end

    assert_redirected_to grep_path(assigns(:grep))
  end

  test "should show grep" do
    get :show, :id => @grep.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @grep.to_param
    assert_response :success
  end

  test "should update grep" do
    put :update, :id => @grep.to_param, :grep => @grep.attributes
    assert_redirected_to grep_path(assigns(:grep))
  end

  test "should destroy grep" do
    assert_difference('Grep.count', -1) do
      delete :destroy, :id => @grep.to_param
    end

    assert_redirected_to greps_path
  end
end
