module StaticPagesHelper
  def show_more
    true
  end
  def like(post_id)
    Post.find(post_id).likes.where("user_id = ?", current_user.id).first
  end
end
