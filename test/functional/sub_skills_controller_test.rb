require 'test_helper'

class SubSkillsControllerTest < ActionController::TestCase
  setup do
    @sub_skill = sub_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_skill" do
    assert_difference('SubSkill.count') do
      post :create, sub_skill: { name: @sub_skill.name, parent_sub_skill: @sub_skill.parent_sub_skill, skill_value: @sub_skill.skill_value }
    end

    assert_redirected_to sub_skill_path(assigns(:sub_skill))
  end

  test "should show sub_skill" do
    get :show, id: @sub_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_skill
    assert_response :success
  end

  test "should update sub_skill" do
    put :update, id: @sub_skill, sub_skill: { name: @sub_skill.name, parent_sub_skill: @sub_skill.parent_sub_skill, skill_value: @sub_skill.skill_value }
    assert_redirected_to sub_skill_path(assigns(:sub_skill))
  end

  test "should destroy sub_skill" do
    assert_difference('SubSkill.count', -1) do
      delete :destroy, id: @sub_skill
    end

    assert_redirected_to sub_skills_path
  end
end
