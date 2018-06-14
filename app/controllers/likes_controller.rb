class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    if @like.save
      redirect_back(fallback_location: authenticated_root_path)
    else
      flash.now[:danger] = 'Unable to like this post'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.delete
    flash.now[:success] = 'Deleted'
    redirect_back(fallback_location: authenticated_root_path)
  end
  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
