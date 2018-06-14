module UserHelper
  def others
    users = User.where.not(id: current_user.id)
  end
end
