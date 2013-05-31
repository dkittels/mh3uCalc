class Talisman < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :rarity, :slots, :user
  attr_accessor :skill_1, :skill_1_value, :skill_2, :skill_2_value
  
  has_many :builds, :foreign_key => :talisman_id 
  has_many :talisman_skill
  accepts_nested_attributes_for :talisman_skill

  def getSkillValues
	skill_hash = {}
  	self.talisman_skill.each do |talisman_skill|
  		skill_hash[talisman_skill.skill.id] = talisman_skill.value
  	end
  	return skill_hash
  end

end
