class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 500 }

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :notifications
end
