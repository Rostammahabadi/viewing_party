class DashboardController < ApplicationController
  before_action :authenticate
  def index
    @user = User.find_by id: session[:user_id]
  end

  private

  def authenticate
    binding.pry
    redirect_to root_path, notice: "You must login or sign up first" if !current_user
  end

end
