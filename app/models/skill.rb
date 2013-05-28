class Skill < ActiveRecord::Base
  attr_accessible :name
  
  has_many :sub_skills
  has_many :armor_skills
  
  def getSubSkillForValue(value) 
  	return_sub_skill = nil
  	
	self.sub_skills.each do |sub_skill|
		if (sub_skill.skill_value > 0 && value >= sub_skill.skill_value)
			return_sub_skill = sub_skill
		elsif (sub_skill.skill_value < 0 && value <= sub_skill.skill_value)
			return_sub_skill = sub_skill
		end
	end
	
	return return_sub_skill
  end
  
end
