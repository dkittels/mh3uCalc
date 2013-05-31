class Build < ActiveRecord::Base
  belongs_to :position_0, :class_name => "Equipment", :foreign_key => "position_0_id"
  belongs_to :position_1, :class_name => "Equipment", :foreign_key => "position_1_id"
  belongs_to :position_2, :class_name => "Equipment", :foreign_key => "position_2_id"
  belongs_to :position_3, :class_name => "Equipment", :foreign_key => "position_3_id"
  belongs_to :position_4, :class_name => "Equipment", :foreign_key => "position_4_id"
  belongs_to :position_5, :class_name => "Equipment", :foreign_key => "position_5_id"
  belongs_to :user
  belongs_to :talisman
  attr_accessible :description, :generated_description, :name, :position_0, :position_1, :position_2, :position_3, :position_4, :position_5, :talisman, :user

  def hasOpenings?
    return true if getOpenings.length > 0
    return false
  end
  
  def getOpenings
  	openings = Array.new
  	openings << 1 if position_1 == nil
  	openings << 2 if position_2 == nil
  	openings << 3 if position_3 == nil
  	openings << 4 if position_4 == nil
  	openings << 5 if position_5 == nil
  	return openings
  end
  
  def skills
	@skills
  end
  
  def sub_skills
  	@sub_skills
  end
  
  def determineSkills
  	skills_hash = getSkillsHash
  	@skills = {}
  	
  	skills_hash.each do |(key,value)|
  		@skills[ Skill.find(key) ] = value
  	end
  
  	@sub_skills = []
  	
  	@skills.each do |(skill,value)|
  		sub_skill = skill.getSubSkillForValue(value)
  		if sub_skill != nil
  			@sub_skills << sub_skill
  		end  		
  	end
  end
  
  # DOES NOT return skills object
  # returns a hash of skill_id => value
  def getSkillsHash
    skills_hash = {}
    
  	skills_hash = Build.mergeSkills(skills_hash, self.position_0.getSkillValues) if self.position_0 != nil
  	skills_hash = Build.mergeSkills(skills_hash, self.position_1.getSkillValues) if self.position_1 != nil
  	skills_hash = Build.mergeSkills(skills_hash, self.position_2.getSkillValues) if self.position_2 != nil
  	skills_hash = Build.mergeSkills(skills_hash, self.position_3.getSkillValues) if self.position_3 != nil
  	skills_hash = Build.mergeSkills(skills_hash, self.position_4.getSkillValues) if self.position_4 != nil
  	skills_hash = Build.mergeSkills(skills_hash, self.position_5.getSkillValues) if self.position_5 != nil
  	skills_hash = Build.mergeSkills(skills_hash, self.talisman.getSkillValues) if self.talisman != nil

	return skills_hash
  end
  
  def self.mergeSkills( source_hash, merge_hash )
    merge_hash.each do |(key,value)|
    	if (source_hash[key] == nil) 
	    	source_hash[key] = value
	    else
	    	source_hash[key] = source_hash[key] + value
	    end
    end
    return source_hash
  end
  
  def makeGeneratedDescription
  	self.determineSkills
  	
  	self.generated_description = '<strong>Skills</strong><br/>'
  	
  	@sub_skills.each do |sub_skill|
  		self.generated_description = "#{self.generated_description}#{sub_skill.name}<BR/>"
  	end
  	
	self.generated_description = "#{self.generated_description}<BR/><strong>Skill Values</strong><BR/>"
	
	@skills.each do |(skill,value)|
  		self.generated_description = "#{self.generated_description}#{skill.name}: #{value}<BR/>"	
	end 
	
	logger.debug("GENERATED DESCRIPTION: #{self.generated_description}")
  end
  
end
