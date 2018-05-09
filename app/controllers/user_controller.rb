class UserController < ApplicationController
  def all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
