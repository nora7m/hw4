class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build
  end

  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build(entry_params)
    @entry.user = current_user

    if @entry.save
      if params[:entry][:uploaded_image].present?
        @entry.uploaded_image.attach(params[:entry][:uploaded_image])
      end
      redirect_to place_path(@place), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def show
    @place = Place.find(params[:place_id])
    @entry = @place.entries.find(params[:id])

    if @entry.user != current_user
      redirect_to place_path(@place), alert: "You are not authorized to view this entry."
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :uploaded_image)
  end

  def authenticate_user!
    redirect_to login_path, alert: 'You must be logged in to access this section' unless current_user
  end
end
