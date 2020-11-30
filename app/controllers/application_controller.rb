class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authenticate
  def current_user
    @current_user ||= User.find_by id: session[:user_id] if session[:user_id]
  end

  def authenticate
    redirect_to root_path, notice: "You must login or sign up first" if !current_user
  end
end
