class CommentsController < ApplicationController
  def index
    post = Post.find params[:post_id]
    @comments = post.comments
  end

  def show
    @comment = Comment.find params[:id]
  end

  def edit
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
    comment = Comment.create comment_params
    raise
    redirect_to post_path(comment.post)
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
