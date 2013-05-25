class Skill < ActiveRecord::Base
  attr_accessible :name
  
  has_many :sub_skills
  has_many :armor_skills
end
