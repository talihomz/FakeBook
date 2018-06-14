class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    owned_by_user?
  end

  def destroy?
    owned_by_user?
  end

  private
  def owned_by_user?
    @user.id == @post.user.id
  end
end
