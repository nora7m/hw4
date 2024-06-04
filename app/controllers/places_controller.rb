class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user
      @places = Place.where(user: current_user)
    else
      @places = []
    end
  end

  def show
    @place = Place.find(params[:id])
    if current_user
      @entries = @place.entries.where(user: current_user)
    else
      @entries = []
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user  # Assign the place to the logged-in user
    if @place.save
      redirect_to @place
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
