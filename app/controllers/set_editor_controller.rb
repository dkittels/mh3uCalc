class SetEditorController < ApplicationController
	before_filter :require_armor_set
	
	def require_armor_set
		if params[:armor_set]
			@armor_set = ArmorSet.find(params[:armor_set])
			session[:armor_set] = @armor_set
		else
			if session[:armor_set]
				@armor_set = session[:armor_set]
			else
				# No armor set, user shouldn't be here
			end
		end
	end
		
	def index
		@skills = Skill.all
	end

end
