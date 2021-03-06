require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  setup do
    @favorite = favorites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite" do
    assert_difference('Favorite.count') do
<<<<<<< HEAD
      post :create, favorite: {  }
=======
      post :create, favorite: { coordinates: @favorite.coordinates, description: @favorite.description, name: @favorite.name, profile_id: @favorite.profile_id }
>>>>>>> af718d06b7796068f5d4375c5428c5812847d38e
    end

    assert_redirected_to favorite_path(assigns(:favorite))
  end

  test "should show favorite" do
    get :show, id: @favorite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite
    assert_response :success
  end

  test "should update favorite" do
<<<<<<< HEAD
    patch :update, id: @favorite, favorite: {  }
=======
    patch :update, id: @favorite, favorite: { coordinates: @favorite.coordinates, description: @favorite.description, name: @favorite.name, profile_id: @favorite.profile_id }
>>>>>>> af718d06b7796068f5d4375c5428c5812847d38e
    assert_redirected_to favorite_path(assigns(:favorite))
  end

  test "should destroy favorite" do
    assert_difference('Favorite.count', -1) do
      delete :destroy, id: @favorite
    end

    assert_redirected_to favorites_path
  end
end
