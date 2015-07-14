class HardwaresController < ApplicationController
  respond_to :html
  before_action :set_hardware, only: [:show, :edit, :update, :destroy]

  # GET /hardwares
  def index
    @hardwares = HardwareDecorator.decorate_collection(Hardware.all)
  end

  # GET /hardwares/1
  def show
  end

  # GET /hardwares/new
  def new
    @hardware = Hardware.new
    @locations = Location.all
  end

  # GET /hardwares/1/edit
  def edit
    @locations = Location.all
  end

  # POST /hardwares
  def create
    @hardware = Hardware.new(hardware_params)

    if @hardware.save
      redirect_to @hardware, notice: 'Hardware was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hardwares/1
  def update
    if @hardware.update(hardware_params)
      redirect_to @hardware, notice: 'Hardware was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hardwares/1
  # DELETE /hardwares/1.json
  def destroy
    @hardware.destroy
    redirect_to hardwares_url, notice: 'Hardware was successfully destroyed.'
  end

  private

  def set_hardware
    @hardware = Hardware.find(params[:id]).decorate
  end

  def hardware_params
    params.require(:hardware).permit(
      :name, :length, :width, :height, :weight, :serial_number, :price,
      :status, :note, :warranty_expired_on, :location_id
    )
  end
end
