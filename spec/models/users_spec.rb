require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of(:email)
      should validate_presence_of(:password)
      should validate_confirmation_of(:password)
    end
  end
  
  describe 'relationships' do
    it do
      should have_many(:friends)
      should have_many(:followed_users)
    end
  end
end
