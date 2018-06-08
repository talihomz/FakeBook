module PostsHelper
  def liked(post)
    post.likes.include? current_user.id
  end
end
