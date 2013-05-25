class ArmorSetsController < ApplicationController
  # GET /armor_sets
  # GET /armor_sets.json
  def index
    @armor_sets = ArmorSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @armor_sets }
    end
  end

  # GET /armor_sets/1
  # GET /armor_sets/1.json
  def show
    @armor_set = ArmorSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @armor_set }
    end
  end

  # GET /armor_sets/new
  # GET /armor_sets/new.json
  def new
    @armor_set = ArmorSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @armor_set }
    end
  end

  # GET /armor_sets/1/edit
  def edit
    @armor_set = ArmorSet.find(params[:id])
  end

  # POST /armor_sets
  # POST /armor_sets.json
  def create
    @armor_set = ArmorSet.new(params[:armor_set])

    respond_to do |format|
      if @armor_set.save
        format.html { redirect_to @armor_set, notice: 'Armor set was successfully created.' }
        format.json { render json: @armor_set, status: :created, location: @armor_set }
      else
        format.html { render action: "new" }
        format.json { render json: @armor_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /armor_sets/1
  # PUT /armor_sets/1.json
  def update
    @armor_set = ArmorSet.find(params[:id])

    respond_to do |format|
      if @armor_set.update_attributes(params[:armor_set])
        format.html { redirect_to @armor_set, notice: 'Armor set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @armor_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armor_sets/1
  # DELETE /armor_sets/1.json
  def destroy
    @armor_set = ArmorSet.find(params[:id])
    @armor_set.destroy

    respond_to do |format|
      format.html { redirect_to armor_sets_url }
      format.json { head :no_content }
    end
  end
end
