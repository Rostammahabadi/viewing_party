class FriendsController < ApplicationController
  def create
    user = User.find_by email: params[:email]
    if user
      if check_for_duplicates(user)
        redirect_to dashboard_path, notice: "You are already friend with this person!" 
        return
      end
      add_friend(user)
      redirect_to dashboard_path, notice: "Successfully added friend"
    else
      redirect_to dashboard_path, notice: 'Could not find a user by this email'
    end
  end

  private

  def friends_params
    params.permit(:email)
  end

  def add_friend(user)
    @friend = Friend.new(user_id: current_user.id, followed_user_id: user.id)
    if @friend.save!
      return
    else
      redirect_to dashboard_path, notice: @friend.errors.full_messages.to_sentence
    end
  end

  def check_for_duplicates(user)
    @friends = Friend.where(user_id: current_user.id).where(followed_user_id: user.id) 
    if @friends.empty?
      return false
    else
      return true
    end
  end
end