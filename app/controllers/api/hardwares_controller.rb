class Api::HardwaresController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!

  def index
    @hardwares = Hardware.all
  end

  def show
    @hardware = Hardware.find(params[:id])
  end

  def create
    @hardware = Hardware.new(hardware_params)
    @hardware.save
    respond_with @hardware
  end

  private

  def hardware_params
    params.require(:hardware).permit(
      :name, :length, :width, :height, :weight, :serial_number, :price,
      :state, :note, :warranty_expired_on
    )
  end
end
