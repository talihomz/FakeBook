class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Comment added successfully!"
      redirect_to Post.find(@comment.post_id)
    else
      flash[:error] = @comment.errors.messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
