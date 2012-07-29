class PomSetsController < ApplicationController
  # GET /pom_sets
  # GET /pom_sets.json
  def index
    @pom_sets = PomSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pom_sets }
    end
  end

  # GET /pom_sets/1
  # GET /pom_sets/1.json
  def show
    @pom_set = PomSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pom_set }
    end
  end

  # GET /pom_sets/new
  # GET /pom_sets/new.json
  def new
    @pom_set = PomSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pom_set }
    end
  end

  # GET /pom_sets/1/edit
  def edit
    @pom_set = PomSet.find(params[:id])
  end

  # POST /pom_sets
  # POST /pom_sets.json
  def create
    @pom_set = PomSet.new(params[:pom_set])

    respond_to do |format|
      if @pom_set.save
        format.html { redirect_to @pom_set, notice: 'Pom set was successfully created.' }
        format.json { render json: @pom_set, status: :created, location: @pom_set }
      else
        format.html { render action: "new" }
        format.json { render json: @pom_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pom_sets/1
  # PUT /pom_sets/1.json
  def update
    @pom_set = PomSet.find(params[:id])

    respond_to do |format|
      if @pom_set.update_attributes(params[:pom_set])
        format.html { redirect_to @pom_set, notice: 'Pom set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pom_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pom_sets/1
  # DELETE /pom_sets/1.json
  def destroy
    @pom_set = PomSet.find(params[:id])
    @pom_set.destroy

    respond_to do |format|
      format.html { redirect_to pom_sets_url }
      format.json { head :no_content }
    end
  end
end
