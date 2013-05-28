class Equipment < ActiveRecord::Base
  belongs_to :armor_set
  has_many :builds, :foreign_key => :position_1
  has_many :builds, :foreign_key => :position_2
  has_many :builds, :foreign_key => :position_3
  has_many :builds, :foreign_key => :position_4
  has_many :builds, :foreign_key => :position_5  
  attr_accessible :price, :blademaster, :gunner, :armor_set, :dragon_res, :fire_res, :ice_res, 
  	:in_game, :max_defense, :name, :position, :slots, :thunder_res, :water_res, :rarity
  
  has_many :armor_skill
  accepts_nested_attributes_for :armor_skill
  
  def getSkillValues
	skill_hash = {}
  	self.armor_skill.each do |armor_skill|
  		skill_hash[armor_skill.skill.id] = armor_skill.value
  	end
  	return skill_hash
  end
  
  def skill_string
  	return_string = ''
  	
  	self.armor_skill.each do |armor_skill|
  		return_string = "#{return_string} #{armor_skill.skill.name}: #{armor_skill.value},"
  	end
  	
  	return return_string
  end
end
