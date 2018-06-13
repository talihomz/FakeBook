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
  has_many :notifications~
  has_many :friends
  has_many :friend_requests, :class_name => 'FriendRequest', :foreign_key => 'requestor_id'
  has_many :friends_requesting, :class_name => 'FriendRequest', :foreign_key => 'friend_id'

  # waiting requests
  scope :waiting, -> { where status: 1 }
end
