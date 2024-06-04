class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    logger.debug "Params: #{params.inspect}"  # Log the incoming parameters

    @user = User.new(user_params)  # No need to manually encrypt the password

    if @user.save
      flash[:notice] = 'User was successfully created.'
      logger.debug "User saved successfully, redirecting to user show page."
      redirect_to @user
    else
      logger.debug "User save failed: #{@user.errors.full_messages.join(", ")}"  # Log errors if save fails
      flash[:alert] = "Failed to create user: #{@user.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end  
end
