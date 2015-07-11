class HardwaresController < ApplicationController
  respond_to :html
  before_action :set_hardware, only: [:show, :edit, :update, :destroy]

  # GET /hardwares
  def index
    @hardwares = Hardware.all
  end

  # GET /hardwares/1
  def show
  end

  # GET /hardwares/new
  def new
    @hardware = Hardware.new
  end

  # GET /hardwares/1/edit
  def edit
  end

  # POST /hardwares
  def create
    @hardware = Hardware.new(hardware_params)

    respond_to do |format|
      if @hardware.save
        redirect_to @hardware, notice: 'Hardware was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /hardwares/1
  def update
    respond_to do |format|
      if @hardware.update(hardware_params)
        redirect_to @hardware, notice: 'Hardware was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /hardwares/1
  # DELETE /hardwares/1.json
  def destroy
    @hardware.destroy
    respond_to do |format|
      format.html { redirect_to hardwares_url, notice: 'Hardware was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hardware
      @hardware = Hardware.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hardware_params
      params.require(:hardware).permit(:name, :length, :width, :height, :weight, :serial_number, :price, :status, :note, :warranty_expired_on)
    end
end
