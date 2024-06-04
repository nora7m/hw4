class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user && BCrypt::Password.new(user["password"]) == params[:password]  # Authenticate using bcrypt
      session[:user_id] = user.id
      redirect_to places_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
