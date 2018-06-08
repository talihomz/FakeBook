class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    if @like.save
      redirect_to :back
    else
      flash[:danger] = 'Unable to like this post'
      redirect_to :back
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.delete
    redirect_to :back
  end
  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
