class PasswordsController < ApplicationController
  before_action :require_user_loged_in!

  def edit
  end

  def update
    if not_valid_user()
      render :edit
    elsif Current.user.update(password_params)
      redirect_to root_path, notice: "successfully update password"
    else
      render :edit
    end 
  end

  private 

  def not_valid_user
    !Current.user.authenticate(params[:user][:old_password])
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end