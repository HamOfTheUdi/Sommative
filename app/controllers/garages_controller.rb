class GaragesController < ApplicationController
  before_action :set_garage, only: %i[ show edit update destroy ]

  # GET /garages or /garages.json
  def index
    @garages = Garage.all
  end

  # GET /garages/1 or /garages/1.json
  def show
  end

  # GET /garages/new
  def new
    @garage = Garage.new
  end

  # GET /garages/1/edit
  def edit
  end

  # POST /garages or /garages.json
  def create
    @garage = Garage.new(garage_params)

    respond_to do |format|
      if @garage.save
        format.html { redirect_to @garage, notice: "Garage was successfully created." }
        format.json { render :show, status: :created, location: @garage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garages/1 or /garages/1.json
  def update
    respond_to do |format|
      if @garage.update(garage_params)
        format.html { redirect_to @garage, notice: "Garage was successfully updated." }
        format.json { render :show, status: :ok, location: @garage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garages/1 or /garages/1.json
  def destroy
    @garage.destroy!

    respond_to do |format|
      format.html { redirect_to garages_path, status: :see_other, notice: "Garage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garage
      @garage = Garage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def garage_params
      params.expect(garage: [ :nom, :adresse, :capacite ])
    end
end
