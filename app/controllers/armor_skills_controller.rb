class ArmorSkillsController < ApplicationController
  # GET /armor_skills
  # GET /armor_skills.json
  def index
  	if (params[:equipment_id]) 
	  	@equipment = Equipment.find(params[:equipment_id])
	    @armor_skills = ArmorSkill.all
	else
		@equipment = Equipment.new()
	end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @armor_skills }
    end
  end

  # GET /armor_skills/1
  # GET /armor_skills/1.json
  def show
    @armor_skill = ArmorSkill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @armor_skill }
    end
  end

  # GET /armor_skills/new
  # GET /armor_skills/new.json
  def new
  	@equipment = Equipment.find(params[:equipment_id])
    @armor_skill = ArmorSkill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @armor_skill }
    end
  end

  # GET /armor_skills/1/edit
  def edit
  	@equipment = Equipment.find(params[:equipment_id])
    @armor_skill = ArmorSkill.find(params[:id])
  end

  # POST /armor_skills
  # POST /armor_skills.json
  def create
  	@equipment = Equipment.find(params[:equipment_id])
  	@skill = Skill.find(params[:armor_skill][:skill])
  	params[:armor_skill][:skill] = @skill.id;
	@armor_skill = @equipment.armor_skill.create()
	@armor_skill.skill = @skill
	@armor_skill.value = params[:armor_skill][:value]
	@skill.save
#	@armor_skill = @equipment.armor_skill.create(params[:armor_skill])

    respond_to do |format|
      if @armor_skill.save
        format.html { redirect_to equipment_armor_skills_url, notice: 'Armor skill was successfully created.' }
        format.json { render json: @armor_skill, status: :created, location: @armor_skill }
      else
        format.html { render action: "new" }
        format.json { render json: @armor_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /armor_skills/1
  # PUT /armor_skills/1.json
  def update
    @armor_skill = ArmorSkill.find(params[:id])
  	@skill = Skill.find(params[:armor_skill][:skill])
	@armor_skill.skill = @skill
	@armor_skill.value = params[:armor_skill][:value]

    respond_to do |format|
      if @armor_skill.save
        format.html { redirect_to equipment_armor_skills_url, notice: 'Armor skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @armor_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armor_skills/1
  # DELETE /armor_skills/1.json
  def destroy
  	@equipment = Equipment.find(params[:equipment_id])
    @armor_skill = ArmorSkill.find(params[:id])
    @armor_skill.destroy

    respond_to do |format|
      format.html { redirect_to equipment_armor_skills_url }
      format.json { head :no_content }
    end
  end
end
