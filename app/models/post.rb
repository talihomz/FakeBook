class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 500 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications
end
