class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates_confirmation_of :password
  validates_presence_of :password, require: true, :on => :create
  validates_length_of :password, :minimum => 6

  has_many :friends
  has_many :followed_users, through: :friends

  has_many :followers, foreign_key: :followed_user_id, class_name: "Friends"
  has_many :follower_users, through: :friends, source: :user
end
