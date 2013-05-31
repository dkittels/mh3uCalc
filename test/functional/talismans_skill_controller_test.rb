require 'test_helper'

class TalismansSkillControllerTest < ActionController::TestCase
  setup do
    @talismans_skill = talismans_skill(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:talismans_skill)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create talismans_skill" do
    assert_difference('TalismanSkill.count') do
      post :create, talismans_skill: { value: @talismans_skill.value }
    end

    assert_redirected_to talismans_skill_path(assigns(:talismans_skill))
  end

  test "should show talismans_skill" do
    get :show, id: @talismans_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @talismans_skill
    assert_response :success
  end

  test "should update talismans_skill" do
    put :update, id: @talismans_skill, talismans_skill: { value: @talismans_skill.value }
    assert_redirected_to talismans_skill_path(assigns(:talismans_skill))
  end

  test "should destroy talismans_skill" do
    assert_difference('TalismanSkill.count', -1) do
      delete :destroy, id: @talismans_skill
    end

    assert_redirected_to talismans_skill_path
  end
end
