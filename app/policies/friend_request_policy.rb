class FriendRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  attr_reader :user, :friend_request

  def initialize(user, friend_request)
    @user = user
    @friend_request = friend_request
  end

  def create?
    !request_exists?
  end

  def update?
  end

  def destroy?
  end

  private
  def already_friends?
    @user.friends.any? do |friend|
      friend.id == @friend_request.friend.id
    end
  end

  def current_user?
    @user.id != @friend_request.friend.id
  end

  def request_exists?
    @user.friend_requests.any? do |request|
      request.id == @friend_request.id
    end
  end
end
