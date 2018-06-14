class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :bio, length: { maximum: 300 }

  has_many :posts
  has_many :notifications
  has_many :likes
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friends

  def remove_friend
    current_user.friends.destroy(friend)
  end
end
