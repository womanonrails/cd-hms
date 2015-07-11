class Api::HardwaresController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!
  before_action :authenticate_with_token
  before_action :set_hardware, only: [:show, :update, :destroy]

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

  def update
    @hardware = Hardware.find(params[:id])
    @hardware.update(hardware_params)
    respond_with @hardware
  end

  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy
    respond_with @hardware
  end

  private

  def set_hardware
    @hardware = Hardware.find(params[:id])
  end

  def hardware_params
    params.require(:hardware).permit(
      :name, :length, :width, :height, :weight, :serial_number, :price,
      :state, :note, :warranty_expired_on
    )
  end
end
