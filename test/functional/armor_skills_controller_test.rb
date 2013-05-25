require 'test_helper'

class ArmorSkillsControllerTest < ActionController::TestCase
  setup do
    @armor_skill = armor_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:armor_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create armor_skill" do
    assert_difference('ArmorSkill.count') do
      post :create, armor_skill: { value: @armor_skill.value }
    end

    assert_redirected_to armor_skill_path(assigns(:armor_skill))
  end

  test "should show armor_skill" do
    get :show, id: @armor_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @armor_skill
    assert_response :success
  end

  test "should update armor_skill" do
    put :update, id: @armor_skill, armor_skill: { value: @armor_skill.value }
    assert_redirected_to armor_skill_path(assigns(:armor_skill))
  end

  test "should destroy armor_skill" do
    assert_difference('ArmorSkill.count', -1) do
      delete :destroy, id: @armor_skill
    end

    assert_redirected_to armor_skills_path
  end
end
