class PostsController < ApplicationController

  def new
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = Post.new
  end

  def create
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = @subreddit.posts.new(post_params)
    @post.save
    flash[:success] = "Post created"
    redirect_to subreddit_path(@subreddit)
  end

  def edit
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = Post.find(params[:id])
  end

  def update
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to(@subreddit)
      flash[:success] = "Post updated"
    else
      render 'edit'
      flash[:error] = "Post failed to update"
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
