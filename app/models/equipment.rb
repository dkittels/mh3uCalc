class Equipment < ActiveRecord::Base
  belongs_to :armor_set
  attr_accessible :price, :blademaster, :gunner, :armor_set, :dragon_res, :fire_res, :ice_res, :in_game, :max_defense, :name, :position, :slots, :thunder_res, :water_res, :rarity
  
  has_many :armor_skill
  accepts_nested_attributes_for :armor_skill
end
