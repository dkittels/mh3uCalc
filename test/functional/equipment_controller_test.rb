require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { dragon_res: @equipment.dragon_res, fire_res: @equipment.fire_res, ice_res: @equipment.ice_res, in_game: @equipment.in_game, max_defense: @equipment.max_defense, name: @equipment.name, position: @equipment.position, slots: @equipment.slots, thunder_res: @equipment.thunder_res, water_res: @equipment.water_res }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response :success
  end

  test "should update equipment" do
    put :update, id: @equipment, equipment: { dragon_res: @equipment.dragon_res, fire_res: @equipment.fire_res, ice_res: @equipment.ice_res, in_game: @equipment.in_game, max_defense: @equipment.max_defense, name: @equipment.name, position: @equipment.position, slots: @equipment.slots, thunder_res: @equipment.thunder_res, water_res: @equipment.water_res }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end
