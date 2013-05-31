class TalismanSkillsController < ApplicationController
  before_filter :check_for_talisman
  before_filter :restrict_admin_actions
  
  def check_for_talisman
  	if params[:talisman_id]
		@talisman = Talisman.find( params[:talisman_id] )
	end	
  end
  
  def restrict_admin_actions
  	if !current_user.admin? && @talisman.user != current_user
  		restricted_actions = ['create','update','destroy']
  		if restricted_actions.include?(params[:action])
	  		redirect_to talismans_url, alert: 'That action is not permitted to you.'
  		end
  	end
  end
  
  # GET /talisman_skills
  # GET /talisman_skills.json
  def index
    @talisman_skills = TalismanSkill.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @talisman_skills }
    end
  end

  # GET /talisman_skills/1
  # GET /talisman_skills/1.json
  def show
    @talisman_skill = TalismanSkill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @talisman_skill }
    end
  end

  # GET /talisman_skills/new
  # GET /talisman_skills/new.json
  def new
    @talisman_skill = TalismanSkill.new
    @talisman_skill.talisman = @talisman

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @talisman_skill }
    end
  end

  # GET /talisman_skills/1/edit
  def edit
    @talisman_skill = TalismanSkill.find(params[:id])
  end

  # POST /talisman_skills
  # POST /talisman_skills.json
  def create
  	params[:talisman_skill][:skill] = Skill.find(params[:talisman_skill][:skill])
    @talisman_skill = TalismanSkill.new(params[:talisman_skill])
    @talisman_skill.talisman = @talisman

    respond_to do |format|
      if @talisman_skill.save
        format.html { redirect_to talisman_path(@talisman), notice: 'Talisman skill was successfully created.' }
        format.json { render json: @talisman_skill, status: :created, location: @talisman_skill }
      else
        format.html { render action: "new" }
        format.json { render json: @talisman_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /talisman_skills/1
  # PUT /talisman_skills/1.json
  def update
    @talisman_skill = TalismanSkill.find(params[:id])

    respond_to do |format|
      if @talisman_skill.update_attributes(params[:talisman_skill])
        format.html { redirect_to @talisman_skill, notice: 'Talisman skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @talisman_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talisman_skills/1
  # DELETE /talisman_skills/1.json
  def destroy
    @talisman_skill = TalismanSkill.find(params[:id])
    @talisman_skill.destroy

    respond_to do |format|
      format.html { redirect_to talisman_skills_url }
      format.json { head :no_content }
    end
  end
end
