class DashboardController < ApplicationController
  before_action :authenticate
  def index
    @friends = Friend.following(current_user)
  end

  private

  def authenticate
    redirect_to root_path, notice: "You must login or sign up first" if !current_user
  end

end
