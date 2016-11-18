class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to post_path(@post)
    else
      flash[:success] = "Comment failed to be created"
      redirect_to new_post_comment_path(@post, @comment
)    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to @post
      flash[:success] = "Comment updated"
    else
      render 'edit'
      flash[:error] = "Comment failed to update"
    end
  end

  def destroy
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      if @comment.destroy
        flash[:success] = "Comment deleted!"
        redirect_to @post
      end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
