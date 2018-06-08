class PostsController < ApplicationController

  # GET /posts/1
  def show
    post
    @comment = Comment.new(post_id: params[:id])
    @comments = @post.comments.reverse
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    post
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to authenticated_root_path
    else
      flash.now[:error] = @post.errors.messages
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    post
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    post.destroy
    redirect_to authenticated_root_path, notice: 'Post was successfully destroyed.'
  end

  private

  def post
   @post ||= Post.find(params[:id])
   @like = @post.likes.where("user_id = ?", current_user.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content)
  end
end
