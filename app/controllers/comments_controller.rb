class CommentsController < ApplicationController
  def index
    post = Post.find params[:post_id]
    @comments = post.comments
  end

  def show
    @comment = Comment.find params[:id]
  end

  def edit
    @post = Post.find params[:post_id]
    @comment = Comment.find params[:id]
  end

  def update
    comment = Comment.find params[:id]
    comment.update comment_params
    redirect_to comment.post
  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def create
    comment = Comment.new comment_params
    comment.post_id = params[:post_id]
    comment.save
    # raise
    redirect_to post_path(comment.post)
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
