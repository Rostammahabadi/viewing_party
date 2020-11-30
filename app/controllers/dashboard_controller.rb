class DashboardController < ApplicationController
  before_action :authenticate
  def index
    @friends = Friend.following(current_user)
  end

end
