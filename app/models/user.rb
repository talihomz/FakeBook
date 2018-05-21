class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, presence:true, length: { maximum: 50 }
  validates :lastname, presence:true, length: { maximum: 50 }
  validates :bio, length: { minimum: 10, maximum: 300 }

  has_many :posts
  has_many :notifications
  has_many :friends
end
