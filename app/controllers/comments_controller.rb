class CommentsController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit, :update, :new, :create]
  before_action :check_if_author, :only => [:edit, :update]
  before_action :check_if_admin, :only => [:destroy]

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
    comment.user_id = @current_user.id
    comment.post_id = params[:post_id]
    comment.save
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

  def check_if_logged_in
    redirect_to post_path(params[:post_id]) unless @current_user.present?
  end

  def check_if_admin
    redirect_to post_path(params[:post_id]) unless @current_user.present? && @current_user.admin?
  end

  def check_if_author
    comment = Comment.find params[:id]
    redirect_to post_path(params[:post_id]) unless @current_user.present? && @current_user.id == comment.user.id
  end
end
