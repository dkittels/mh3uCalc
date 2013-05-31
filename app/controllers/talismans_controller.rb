class TalismansController < ApplicationController
	before_filter :check_for_talisman
    before_filter :restrict_admin_actions

	def check_for_talisman
		if params[:id]
			@talisman = Talisman.find(params[:id])
		end
	end
	
	def restrict_admin_actions
		if !current_user.admin? && @talisman != nil && current_user != @talisman.user
			restricted_actions = ['update','destroy']
			if restricted_actions.include?(params[:action])
				redirect_to talismans_url, alert: 'That action is not permitted to you.'
			end
		end
	end	
  
  # GET /talismans
  # GET /talismans.json
  def index
    @talismans = Talisman.where("user_id = ?", current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @talismans }
    end
  end

  # GET /talismans/1
  # GET /talismans/1.json
  def show
    @talisman = Talisman.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @talisman }
    end
  end

  # GET /talismans/new
  # GET /talismans/new.json
  def new
    @talisman = Talisman.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @talisman }
    end
  end

  # GET /talismans/1/edit
  def edit
    @talisman = Talisman.find(params[:id])
  end

  # POST /talismans
  # POST /talismans.json
  def create
    @talisman = Talisman.new()
    @talisman.name = params[:talisman][:name]
    @talisman.slots = params[:talisman][:slots]
    @talisman.rarity = params[:talisman][:rarity]
    @talisman.user = current_user
    
    if @talisman.save
		if (params[:skill_1].to_i > 0) 
			talisman_skill = @talisman.talisman_skill.create()
			talisman_skill.skill = Skill.find(params[:skill_1])
			talisman_skill.value = params[:skill_1_value]
			talisman_skill.save
		end
	
		if (params[:skill_2].to_i > 0) 
			talisman_skill = @talisman.talisman_skill.create()
			talisman_skill.skill = Skill.find(params[:skill_2])
			talisman_skill.value = params[:skill_2_value]
			talisman_skill.save
		end
	end
	
    respond_to do |format|
      if @talisman.save
        format.html { redirect_to @talisman, notice: 'Talisman was successfully created.' }
        format.json { render json: @talisman, status: :created, location: @talisman }
      else
        format.html { render action: "new" }
        format.json { render json: @talisman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /talismans/1
  # PUT /talismans/1.json
  def update
    @talisman = Talisman.find(params[:id])

    respond_to do |format|
      if @talisman.update_attributes(params[:talisman])
        format.html { redirect_to @talisman, notice: 'Talisman was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @talisman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talismans/1
  # DELETE /talismans/1.json
  def destroy
    @talisman = Talisman.find(params[:id])
    @talisman.destroy

    respond_to do |format|
      format.html { redirect_to talismans_url }
      format.json { head :no_content }
    end
  end
end
