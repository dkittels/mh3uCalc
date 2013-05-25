require 'test_helper'

class ArmorSetsControllerTest < ActionController::TestCase
  setup do
    @armor_set = armor_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:armor_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create armor_set" do
    assert_difference('ArmorSet.count') do
      post :create, armor_set: { name: @armor_set.name }
    end

    assert_redirected_to armor_set_path(assigns(:armor_set))
  end

  test "should show armor_set" do
    get :show, id: @armor_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @armor_set
    assert_response :success
  end

  test "should update armor_set" do
    put :update, id: @armor_set, armor_set: { name: @armor_set.name }
    assert_redirected_to armor_set_path(assigns(:armor_set))
  end

  test "should destroy armor_set" do
    assert_difference('ArmorSet.count', -1) do
      delete :destroy, id: @armor_set
    end

    assert_redirected_to armor_sets_path
  end
end
