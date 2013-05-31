class TalismanSkill < ActiveRecord::Base
  belongs_to :talisman
  belongs_to :skill
  attr_accessible :value, :skill
end
