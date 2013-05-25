class SubSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :sub_skill, :foreign_key => 'parent_sub_skill_id'
  attr_accessible :name, :parent_sub_skill_id, :skill_value, :skill
end
