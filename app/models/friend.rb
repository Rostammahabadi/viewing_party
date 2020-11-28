class Friend < ApplicationRecord
  validate :realism

  belongs_to :user
  belongs_to :followed_user, class_name: 'User'
  private

  def realism
    return unless user_id === followed_user_id
    errors.add :user, 'Only a solipsist would follow themselves.'
  end

  def self.following(user)
    friends_id =  Friend.where(user_id: user.id).pluck(:followed_user_id)
    friends_id.map do |friend|
      User.find(friend)[:email]
    end
  end
end