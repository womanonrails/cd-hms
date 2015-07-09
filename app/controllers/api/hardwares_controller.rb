class Api::HardwaresController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!

  def index
    @hardwares = Hardware.all
  end

  def show
    @hardware = Hardware.find(params[:id])
  end
end
