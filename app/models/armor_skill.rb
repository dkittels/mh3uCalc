class ArmorSkill < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :skill
  attr_accessible :value
end
