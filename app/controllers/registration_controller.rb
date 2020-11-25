class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You are now registered and logged in'
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to registration_path, notice: @user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
