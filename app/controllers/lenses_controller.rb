class LensesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /lenses
  # GET /lenses.json
  def index

    if params[:lense_type_selection].present?
      @lenses = Lense.search(params)
    else
      @lenses = Lense.all
    end
    @lense_types = LenseType.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lenses }
    end
  end

  # GET /lenses/1
  # GET /lenses/1.json
  def show
    @lense = Lense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lense }
    end
  end

  # GET /lenses/new
  # GET /lenses/new.json
  def new
    @lense = Lense.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lense }
    end
  end

  # GET /lenses/1/edit
  def edit
    @lense = Lense.find(params[:id])
  end

  # POST /lenses
  # POST /lenses.json
  def create
    @lense = Lense.new(params[:lense])

    respond_to do |format|
      if @lense.save
        format.html { redirect_to root_path, notice: 'Lense was successfully created.' }
        format.json { render json: @lense, status: :created, location: @lense }
      else
        format.html { render action: "new" }
        format.json { render json: @lense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lenses/1
  # PUT /lenses/1.json
  def update
    @lense = Lense.find(params[:id])

    respond_to do |format|
      if @lense.update_attributes(params[:lense])
        format.html { redirect_to @lense, notice: 'Lense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lenses/1
  # DELETE /lenses/1.json
  def destroy
    @lense = Lense.find(params[:id])
    @lense.destroy

    respond_to do |format|
      format.html { redirect_to lenses_url }
      format.json { head :no_content }
    end
  end
end
