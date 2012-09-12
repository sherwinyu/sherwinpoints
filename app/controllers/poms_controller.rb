class PomsController < ApplicationController
  # GET /poms
  # GET /poms.json
  def index_old
    @poms = Pom.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def index
    @poms = Pom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poms }
    end
  end

  # GET /poms/1
  # GET /poms/1.json
  def show
    @pom = Pom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pom }
    end
  end

  # GET /poms/new
  # GET /poms/new.json
  def new
    @pom = Pom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pom }
    end
  end

  # GET /poms/1/edit
  def edit
    @pom = Pom.find(params[:id])
  end

  # POST /poms
  # POST /poms.json
  def create
    @pom = Pom.new(params[:pom])

    respond_to do |format|
      if @pom.save
        format.html { redirect_to @pom, notice: 'Pom was successfully created.' }
        format.json { render json: @pom, status: :created, location: @pom }
      else
        format.html { render action: "new" }
        format.json { render json: @pom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /poms/1
  # PUT /poms/1.json
  def update
    @pom = Pom.find(params[:id])

    respond_to do |format|
      if @pom.update_attributes(params[:pom])
        format.html { redirect_to @pom, notice: 'Pom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poms/1
  # DELETE /poms/1.json
  def destroy
    @pom = Pom.find(params[:id])
    @pom.destroy

    respond_to do |format|
      format.html { redirect_to poms_url }
      format.json { head :no_content }
    end
  end
end
