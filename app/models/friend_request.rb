class FriendRequest < ApplicationRecord
  validates :status, presence: true
  validates_inclusion_of :status, in: [0,1,2]

  belongs_to :requestor, :class_name => 'User'
  belongs_to :friend, :class_name => 'User'
end
