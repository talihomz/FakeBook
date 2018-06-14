module UserHelper
  def others
    users = User.where.not(id: current_user.id)
  end

  def get_friend_request(user_id)
    FriendRequest.where("user_id = ? AND friend_id = ?", current_user.id, user_id).first || FriendRequest.new
  end
end
