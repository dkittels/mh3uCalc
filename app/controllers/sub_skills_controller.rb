class SubSkillsController < ApplicationController
  # GET /sub_skills
  # GET /sub_skills.json
  def index
    @sub_skills = SubSkill.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sub_skills }
    end
  end

  # GET /sub_skills/1
  # GET /sub_skills/1.json
  def show
    @sub_skill = SubSkill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sub_skill }
    end
  end

  # GET /sub_skills/new
  # GET /sub_skills/new.json
  def new
    @sub_skill = SubSkill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sub_skill }
    end
  end

  # GET /sub_skills/1/edit
  def edit
    @sub_skill = SubSkill.find(params[:id])
  end

  # POST /sub_skills
  # POST /sub_skills.json
  def create
    @skill = Skill.find(params[:sub_skill][:skill])
    params[:sub_skill][:skill] = @skill
    @sub_skill = @skill.sub_skills.create(params[:sub_skill])
    

#    @sub_skill = SubSkill.new(params[:sub_skill])

    respond_to do |format|
      if @sub_skill.save
        format.html { redirect_to @sub_skill, notice: 'Sub skill was successfully created.' }
        format.json { render json: @sub_skill, status: :created, location: @sub_skill }
      else
        format.html { render action: "new" }
        format.json { render json: @sub_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sub_skills/1
  # PUT /sub_skills/1.json
  def update
    @sub_skill = SubSkill.find(params[:id])

    params[:sub_skill][:skill] = Skill.find(params[:sub_skill][:skill])

    respond_to do |format|
      if @sub_skill.update_attributes(params[:sub_skill])
        format.html { redirect_to @sub_skill, notice: 'Sub skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sub_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_skills/1
  # DELETE /sub_skills/1.json
  def destroy
    @sub_skill = SubSkill.find(params[:id])
    @sub_skill.destroy

    respond_to do |format|
      format.html { redirect_to sub_skills_url }
      format.json { head :no_content }
    end
  end
end
