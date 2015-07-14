class Api::LocationsController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!
  before_action :authenticate_with_token
  before_action :set_location, only: [:show, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)
    @location.save
    respond_with @location
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    respond_with @location
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    respond_with @location
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :url)
  end
end
