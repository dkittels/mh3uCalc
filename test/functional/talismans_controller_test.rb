require 'test_helper'

class TalismansControllerTest < ActionController::TestCase
  setup do
    @talisman = talismans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:talismans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create talisman" do
    assert_difference('Talisman.count') do
      post :create, talisman: { alias: @talisman.alias, name: @talisman.name, rarity: @talisman.rarity, slots: @talisman.slots }
    end

    assert_redirected_to talisman_path(assigns(:talisman))
  end

  test "should show talisman" do
    get :show, id: @talisman
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @talisman
    assert_response :success
  end

  test "should update talisman" do
    put :update, id: @talisman, talisman: { alias: @talisman.alias, name: @talisman.name, rarity: @talisman.rarity, slots: @talisman.slots }
    assert_redirected_to talisman_path(assigns(:talisman))
  end

  test "should destroy talisman" do
    assert_difference('Talisman.count', -1) do
      delete :destroy, id: @talisman
    end

    assert_redirected_to talismans_path
  end
end
