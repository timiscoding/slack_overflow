class CommentsController < ApplicationController
  def index
    @comments = Comment.all
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
    redirect_to comment
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create comment_params
    redirect_to comments_path
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
