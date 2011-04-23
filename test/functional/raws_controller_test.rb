require 'test_helper'

class RawsControllerTest < ActionController::TestCase
  setup do
    @raw = raws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raw" do
    assert_difference('Raw.count') do
      post :create, :raw => @raw.attributes
    end

    assert_redirected_to raw_path(assigns(:raw))
  end

  test "should show raw" do
    get :show, :id => @raw.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @raw.to_param
    assert_response :success
  end

  test "should update raw" do
    put :update, :id => @raw.to_param, :raw => @raw.attributes
    assert_redirected_to raw_path(assigns(:raw))
  end

  test "should destroy raw" do
    assert_difference('Raw.count', -1) do
      delete :destroy, :id => @raw.to_param
    end

    assert_redirected_to raws_path
  end
end
