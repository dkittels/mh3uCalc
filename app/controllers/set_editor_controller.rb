class SetEditorController < ApplicationController
	before_filter :require_armor_set
	
	def require_armor_set
		if params[:armor_set]
			@armor_set = ArmorSet.find(params[:armor_set])
			session[:armor_set] = params[:armor_set]
		else
			if session[:armor_set]
				@armor_set = ArmorSet.find(session[:armor_set])
			else
				# No armor set, user shouldn't be here
			end
		end
	end
		
	def index
		@skills = Skill.all
	end

	def build_set

		equipment_1 = {
			'name' => params[:equip_name_1],
			'position' => 1,
			'slots' => params[:slots_1],
			'armor_set' => @armor_set,
			'fire_res' => params[:fire_res],
			'water_res' => params[:water_res],
			'thunder_res' => params[:thunder_res],
			'ice_res' => params[:ice_res],
			'dragon_res' => params[:dragon_res],
			'max_defense' => params[:max_defense],
			'in_game' => 1,
			'rarity' => params[:rarity],
			'blademaster' => '1',
			'gunner' => '1',
			'price' => params[:price]
		}
		@equip_1 = @armor_set.equipment.create(equipment_1)

		equipment_2 = {
			'name' => params[:equip_name_2],
			'position' => 2,
			'slots' => params[:slots_2],
			'armor_set' => @armor_set,
			'fire_res' => params[:fire_res],
			'water_res' => params[:water_res],
			'thunder_res' => params[:thunder_res],
			'ice_res' => params[:ice_res],
			'dragon_res' => params[:dragon_res],
			'max_defense' => params[:max_defense],
			'in_game' => 1,
			'rarity' => params[:rarity],
			'blademaster' => params[:blademaster],
			'gunner' => params[:gunner],
			'price' => params[:price]
		}
		@equip_2 = @armor_set.equipment.create(equipment_2)

		equipment_3 = {
			'name' => params[:equip_name_3],
			'position' => 3,
			'slots' => params[:slots_3],
			'armor_set' => @armor_set,
			'fire_res' => params[:fire_res],
			'water_res' => params[:water_res],
			'thunder_res' => params[:thunder_res],
			'ice_res' => params[:ice_res],
			'dragon_res' => params[:dragon_res],
			'max_defense' => params[:max_defense],
			'in_game' => 1,
			'rarity' => params[:rarity],
			'blademaster' => params[:blademaster],
			'gunner' => params[:gunner],
			'price' => params[:price]
		}
		@equip_3 = @armor_set.equipment.create(equipment_3)

		equipment_4 = {
			'name' => params[:equip_name_4],
			'position' => 4,
			'slots' => params[:slots_4],
			'armor_set' => @armor_set,
			'fire_res' => params[:fire_res],
			'water_res' => params[:water_res],
			'thunder_res' => params[:thunder_res],
			'ice_res' => params[:ice_res],
			'dragon_res' => params[:dragon_res],
			'max_defense' => params[:max_defense],
			'in_game' => 1,
			'rarity' => params[:rarity],
			'blademaster' => params[:blademaster],
			'gunner' => params[:gunner],
			'price' => params[:price]
		}
		@equip_4 = @armor_set.equipment.create(equipment_4)

		equipment_5 = {
			'name' => params[:equip_name_5],
			'position' => 5,
			'slots' => params[:slots_5],
			'armor_set' => @armor_set,
			'fire_res' => params[:fire_res],
			'water_res' => params[:water_res],
			'thunder_res' => params[:thunder_res],
			'ice_res' => params[:ice_res],
			'dragon_res' => params[:dragon_res],
			'max_defense' => params[:max_defense],
			'in_game' => 1,
			'rarity' => params[:rarity],
			'blademaster' => params[:blademaster],
			'gunner' => params[:gunner],
			'price' => params[:price]
		}
		@equip_5 = @armor_set.equipment.create(equipment_5)

		@skill_1, @skill_2, @skill_3, @skill_4, @skill_5 = nil, nil, nil, nil, nil
		
		if (params[:skill_1].to_i !=	 0)
			@skill_1 = Skill.find(params[:skill_1])
		end
		if (params[:skill_2].to_i != 0)
			@skill_2 = Skill.find(params[:skill_2])
		end
		if (params[:skill_3].to_i != 0)
			@skill_3 = Skill.find(params[:skill_3])
		end
		if (params[:skill_4].to_i != 0)
			@skill_4 = Skill.find(params[:skill_4])
		end
		if (params[:skill_5].to_i != 0)
			@skill_5 = Skill.find(params[:skill_5])
		end

		make_armor_skill(@equip_1, @skill_1, params[:skill_1_1])
		make_armor_skill(@equip_1, @skill_2, params[:skill_2_1])
		make_armor_skill(@equip_1, @skill_3, params[:skill_3_1])
		make_armor_skill(@equip_1, @skill_4, params[:skill_4_1])
		make_armor_skill(@equip_1, @skill_5, params[:skill_5_1])

		make_armor_skill(@equip_2, @skill_1, params[:skill_1_2])
		make_armor_skill(@equip_2, @skill_2, params[:skill_2_2])
		make_armor_skill(@equip_2, @skill_3, params[:skill_3_2])
		make_armor_skill(@equip_2, @skill_4, params[:skill_4_2])
		make_armor_skill(@equip_2, @skill_5, params[:skill_5_2])

		make_armor_skill(@equip_3, @skill_1, params[:skill_1_3])
		make_armor_skill(@equip_3, @skill_2, params[:skill_2_3])
		make_armor_skill(@equip_3, @skill_3, params[:skill_3_3])
		make_armor_skill(@equip_3, @skill_4, params[:skill_4_3])
		make_armor_skill(@equip_3, @skill_5, params[:skill_5_3])

		make_armor_skill(@equip_4, @skill_1, params[:skill_1_4])
		make_armor_skill(@equip_4, @skill_2, params[:skill_2_4])
		make_armor_skill(@equip_4, @skill_3, params[:skill_3_4])
		make_armor_skill(@equip_4, @skill_4, params[:skill_4_4])
		make_armor_skill(@equip_4, @skill_5, params[:skill_5_4])

		make_armor_skill(@equip_5, @skill_1, params[:skill_1_5])
		make_armor_skill(@equip_5, @skill_2, params[:skill_2_5])
		make_armor_skill(@equip_5, @skill_3, params[:skill_3_5])
		make_armor_skill(@equip_5, @skill_4, params[:skill_4_5])
		make_armor_skill(@equip_5, @skill_5, params[:skill_5_5])
		
		redirect_to( armor_sets_url )
		
	end
	
	def make_armor_skill(equipment, skill, value)
		if (skill && value.to_i != 0) 
			armor_skill = equipment.armor_skill.create()
			armor_skill.skill = skill
			armor_skill.value = value
			armor_skill.save
		end
	end
end

