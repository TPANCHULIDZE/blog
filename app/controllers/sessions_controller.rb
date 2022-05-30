class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "sign in successfully"
    else
      flash[:alert] = "invalid username or password"
      render :new
    end
  end

  def destroy
    Current.user = nil
    session[:user_id] = nil
    redirect_to root_path, notice: "log out successfully"
  end
end