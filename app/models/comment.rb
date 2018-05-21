class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 10, maximum: 300 }

  belongs_to :user
  belongs_to :post
  has_many :notifications
end
