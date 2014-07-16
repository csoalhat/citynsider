require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
<<<<<<< HEAD
      post :create, profile: {  }
=======
      post :create, profile: { city: @profile.city, description: @profile.description, name: @profile.name, photo: @profile.photo, public: @profile.public, user_id: @profile.user_id }
>>>>>>> af718d06b7796068f5d4375c5428c5812847d38e
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
<<<<<<< HEAD
    patch :update, id: @profile, profile: {  }
=======
    patch :update, id: @profile, profile: { city: @profile.city, description: @profile.description, name: @profile.name, photo: @profile.photo, public: @profile.public, user_id: @profile.user_id }
>>>>>>> af718d06b7796068f5d4375c5428c5812847d38e
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
