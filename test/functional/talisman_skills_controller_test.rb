require 'test_helper'

class TalismanSkillsControllerTest < ActionController::TestCase
  setup do
    @talisman_skill = talisman_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:talisman_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create talisman_skill" do
    assert_difference('TalismanSkill.count') do
      post :create, talisman_skill: { value: @talisman_skill.value }
    end

    assert_redirected_to talisman_skill_path(assigns(:talisman_skill))
  end

  test "should show talisman_skill" do
    get :show, id: @talisman_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @talisman_skill
    assert_response :success
  end

  test "should update talisman_skill" do
    put :update, id: @talisman_skill, talisman_skill: { value: @talisman_skill.value }
    assert_redirected_to talisman_skill_path(assigns(:talisman_skill))
  end

  test "should destroy talisman_skill" do
    assert_difference('TalismanSkill.count', -1) do
      delete :destroy, id: @talisman_skill
    end

    assert_redirected_to talisman_skills_path
  end
end
