class FriendsController < ApplicationController
  def create
    @user = User.find_by email: params[:email]
    if @user

    else
      redirect_to dashboard_path, notice: 'Could not find a user by this email'
    end
  end

  private

  def friends_params
    params.permit(:email)
  end
end