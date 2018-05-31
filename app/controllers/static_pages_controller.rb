class StaticPagesController < ApplicationController
  def index
    @posts = Post.all
  end

  def privacy
  end

  def not_found
  end
end
