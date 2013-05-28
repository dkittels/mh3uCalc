class BuildsController < ApplicationController
	before_filter :require_build
	
	def require_build
		if session[:preferred_skills]
			@preferred_skills = session[:preferred_skills]
		else
			@preferred_skills = [ '', '', '', '' ]
		end
		if params[:buildlolololololololol]
			@build = Build.find(params[:build])
			session[:build] = @build
		else
			if session[:build]
				@build = session[:build]
			else
				# new build
				@build = Build.new
			end
		end
	end
	
	def require_equipment
		@skills = SubSkill.all
		@head = Equipment.where("position = 1")
		@chest = Equipment.where("position = 2")
		@arms = Equipment.where("position = 3")	
		@waist = Equipment.where("position = 4")
		@legs = Equipment.where("position = 5")
	end
		
	def index
		@builds = Build.all
	end
	
	def new
		require_equipment
	end
	
	def create
		require_equipment
		
		position_1, position_2, position_3, position_4, position_5 = nil, nil, nil, nil, nil
		
		if (params[:build][:position_1] != '') 
			position_1 = Equipment.find(params[:build][:position_1])
		end
		if (params[:build][:position_2] != '') 
			position_2 = Equipment.find(params[:build][:position_2])
		end
		if (params[:build][:position_3] !='') 
			position_3 = Equipment.find(params[:build][:position_3])
		end
		if (params[:build][:position_4] != '') 
			position_4 = Equipment.find(params[:build][:position_4])
		end
		if (params[:build][:position_5] != '') 
			position_5 = Equipment.find(params[:build][:position_5])
		end
		
		if (params[:preferred_skill_1].to_i > 0)
			@preferred_skills[1] = params[:preferred_skill_1]
		end
		if (params[:preferred_skill_2].to_i > 0 != '')
			@preferred_skills[2] = params[:preferred_skill_2]
		end
		if (params[:preferred_skill_3].to_i > 0 != '')
			@preferred_skills[3] = params[:preferred_skill_3]
		end
		if (params[:preferred_skill_4].to_i > 0 != '')
			@preferred_skills[4] = params[:preferred_skill_4]
		end
		
		session[:preferred_skills] = @preferred_skills
		
		@build = Build.new
		
		@build.position_1 = position_1
		@build.position_2 = position_2
		@build.position_3 = position_3
		@build.position_4 = position_4
		@build.position_5 = position_5

		session[:build] = @build
		
		@build.makeGeneratedDescription

		# Figure out what we need...
		skill_requirements = {} # should come to be a hash of skill => points remaining to get skill
		
		@preferred_skills.each do |preferred_skill|
			if preferred_skill != ''
				sub_skill = SubSkill.find(preferred_skill)
				
				# Positive skill values...
				if sub_skill.skill_value > 0 
					if @build.skills[sub_skill.skill] != nil
						if @build.skills[sub_skill.skill] < sub_skill.skill_value
							skill_requirements[sub_skill.skill] = sub_skill.skill_value - @build.skills[sub_skill.skill]
						else
							# We are in the clear
						end
					else
						# This skill hasn't even been brought up yet
						skill_requirements[sub_skill.skill.id] = sub_skill.skill_value
					end
				end
			end
		end
		
		# skill_requirements now contains a hash of what skills still need to be rustled up
		@recommendations = determineRecommendations(skill_requirements, @build.getOpenings)
		
		@requirements_string = "<strong>Points Needed for Preferred Skills</strong><br/>"
		
		skill_requirements.each do |(skill_id, value)|
			skill = Skill.find(skill_id)
			@requirements_string = "#{@requirements_string}#{skill.name}: #{value}<br/>"
		end
		
		# Decision Making Time
		if @build.hasOpenings?
			openings = @build.getOpenings
			
			# For the available openings, find some equipment that matches preferred skills that the build still doesn't have
			# preferred skills - skills the build has
			
			
		end
	end

  def determineRecommendations(skill_requirements, open_positions)
  	skill_ids = []
  	
  	skill_requirements.each do |(skill,value)|
  		skill_ids << skill.id
  	end
  	
  	recommendations =  Equipment.where(:position => open_positions)
  	query_string = 
  		"select equipment.* from equipment, armor_skills, skills
  		WHERE
  		equipment.position IN ('#{open_positions.join("','")}')
  		AND armor_skills.equipment_id = equipment.id
  		AND armor_skills.skill_id = skills.id
  		AND armor_skills.value > 0
  		AND skills.id IN ('#{skill_ids.join("','")}')
  		GROUP BY equipment.id
  		ORDER BY SUM(armor_skills.value), equipment.max_defense DESC"
  	recommendations = Equipment.find_by_sql(query_string)
  	return recommendations
  end

  def destroy
    @build = Build.find(params[:id])
    @build.destroy

    respond_to do |format|
      format.html { redirect_to builds_path }
      format.json { head :no_content }
    end
  end
	

end

