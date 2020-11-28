require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe 'relationships' do
    it do
      should belong_to :user
      should belong_to :followed_user
    end
  end

  describe 'class methods' do
    it do
      user = User.create(email: 'asdf@gmail.com', password: 'password', password_digest: 'password')
      user2 = User.create(email: 'asdf123@gmail.com', password: 'password', password_digest: 'password')
      friend = Friend.create(user_id: user.id, followed_user_id: user2.id)
      
      following = Friend.following(user)
      expect(following).to eq(['asdf123@gmail.com'])
    end
  end
end
