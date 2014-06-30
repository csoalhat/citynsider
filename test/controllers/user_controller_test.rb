require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get map" do
    get :map
    assert_response :success
  end

  test "should get friendship" do
    get :friendship
    assert_response :success
  end

  test "should get map" do
    get :map
    assert_response :success
  end

  test "should get favorite" do
    get :favorite
    assert_response :success
  end

  test "should get place" do
    get :place
    assert_response :success
  end

end
