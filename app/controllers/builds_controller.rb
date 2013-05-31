class BuildsController < ApplicationController
	before_filter :require_build
    before_filter :restrict_admin_actions
  
	def require_build
		require_equipment
		
	
		if session[:preferred_skills]
			@preferred_skills = session[:preferred_skills]
		else
			@preferred_skills = [ nil, nil, nil, nil, nil ]
		end
		
		if (params[:preferred_skill_1].to_i > 0)
			@preferred_skills[1] = params[:preferred_skill_1]
		end
		if (params[:preferred_skill_2].to_i > 0)
			@preferred_skills[2] = params[:preferred_skill_2]
		end
		if (params[:preferred_skill_3].to_i > 0)
			@preferred_skills[3] = params[:preferred_skill_3]
		end
		if (params[:preferred_skill_4].to_i > 0)
			@preferred_skills[4] = params[:preferred_skill_4]
		end
		
		session[:preferred_skills] = @preferred_skills

		if params[:id]
			@build = Build.find(params[:id])
		elsif session[:build]
			@build = session[:build]
		else
			# new build
			@build = Build.new
		end

		if (params[:build] != nil)
			@build.position_1 = nil
			@build.position_2 = nil
			@build.position_3 = nil
			@build.position_4 = nil
			@build.position_5 = nil
			@build.talisman = nil;

			if (params[:build][:position_1] != '') 
				@build.position_1 = Equipment.find(params[:build][:position_1])
			end
			if (params[:build][:position_2] != '') 
				@build.position_2 = Equipment.find(params[:build][:position_2])
			end
			if (params[:build][:position_3] !='') 
				@build.position_3 = Equipment.find(params[:build][:position_3])
			end
			if (params[:build][:position_4] != '') 
				@build.position_4 = Equipment.find(params[:build][:position_4])
			end
			if (params[:build][:position_5] != '') 
				@build.position_5 = Equipment.find(params[:build][:position_5])
			end
			if (params[:build][:talisman] != '') 
				@build.talisman = Talisman.find(params[:build][:talisman])
			end
			@build.name = params[:build][:name]
		end

		@build.makeGeneratedDescription
		session[:build] = @build
	end

	def restrict_admin_actions
		logger.debug(@build.inspect)
		if !current_user.admin? && current_user != @build.user
			restricted_actions = ['create','update','destroy']
			if restricted_actions.include?(params[:action])
				redirect_to builds_url, alert: 'That action is not permitted to you.'
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
		@talismans = Talisman.where("user_id = ?", current_user.id)
	end
		
	def index		
		if (current_user.admin?) 
			@builds = Build.all
		elsif 
			@builds = Build.where("user_id = ?", current_user.id)		
		end
	end
	
	def new
		@build = Build.new
		@build.user = current_user
		session[:build] = @build
		@build.makeGeneratedDescription
		@preferred_skills = [ nil, nil, nil, nil, nil ]
		session[:preferred_skills] = @preferred_skills
	end
	
	def create
		if params[:equipment_id]
			new_equip = Equipment.find(params[:equipment_id])
			
			case new_equip.position
			when 0
				@build.position_0 = new_equip
			when 1
				@build.position_1 = new_equip
			when 2
				@build.position_2 = new_equip
			when 3
				@build.position_3 = new_equip
			when 4
				@build.position_4 = new_equip
			when 5
				@build.position_5 = new_equip
			end
		end

		if params[:talisman_id]
			new_talisman = Talisman.find(params[:talisman_id])
			@build.talisman = new_talisman
		end

		@build.makeGeneratedDescription
		session[:build] = @build
		
		if params[:commit] == "Save"
			@build.save
			redirect_to builds_url
		else
			# Figure out what we need...
			determineRequirements		
			determineRecommendations
		end
	end
	
	def edit
	
	end

  # should come to be a hash of skill => points remaining to get skill
  def determineRequirements()
	@skill_requirements = {}  	
	logger.debug(@preferred_skills)
	@preferred_skills.each do |preferred_skill|
		if preferred_skill != nil && preferred_skill != ''
			sub_skill = SubSkill.find(preferred_skill)
			
			# Positive skill values...
			if sub_skill.skill_value > 0 
				if @build.skills[sub_skill.skill] != nil
					if @build.skills[sub_skill.skill] < sub_skill.skill_value
						@skill_requirements[sub_skill.skill] = sub_skill.skill_value - @build.skills[sub_skill.skill]
					else
						# We are in the clear
					end
				else
					# This skill hasn't even been brought up yet
					@skill_requirements[sub_skill.skill] = sub_skill.skill_value
				end
			end
		end
	end
	
	@requirements_string = "<strong>Points Needed for Preferred Skills</strong><br/>"
	
	@skill_requirements.each do |(skill_id, value)|
		skill = Skill.find(skill_id)
		@requirements_string = "#{@requirements_string}#{skill.name}: #{value}<br/>"
	end	
  end

  def determineRecommendations()
  	skill_ids = []
  	
  	@skill_requirements.each do |(skill,value)|
  		skill_ids << skill.id
  	end
	
	open_positions = @build.getOpenings
  	
  	query_string = 
  		"select equipment.*, SUM(armor_skills.value) as preferred_skill_value from equipment, armor_skills, skills
  		WHERE
  		equipment.position IN ('#{open_positions.join("','")}')
  		AND armor_skills.equipment_id = equipment.id
  		AND armor_skills.skill_id = skills.id
  		AND armor_skills.value > 0
  		AND skills.id IN ('#{skill_ids.join("','")}')
  		GROUP BY equipment.id
  		ORDER BY preferred_skill_value DESC, equipment.slots DESC, equipment.max_defense DESC LIMIT 20"
  	@recommendations = Equipment.find_by_sql(query_string)
  	@recommendations.sort! {|a,b| a[:position] <=> b[:position]}

  	if @build.talisman == nil
		# Get some good talismans...
		query_string = "select talismans.*, SUM(talisman_skills.value) from talismans, talisman_skills, skills
		WHERE
  		talisman_skills.talisman_id = talismans.id
  		AND talisman_skills.skill_id = skills.id
  		AND talisman_skills.value > 0
  		AND skills.id IN ('#{skill_ids.join("','")}')
  		AND talismans.user_id = #{current_user.id}
  		GROUP BY talismans.id
  		ORDER BY SUM(talisman_skills.value) DESC, talismans.slots DESC LIMIT 6"
  		
  		Talisman.find_by_sql(query_string).each do |entry|
  			@recommendations << entry
  		end
  	end
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

