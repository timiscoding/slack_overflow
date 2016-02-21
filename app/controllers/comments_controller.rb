class CommentsController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit, :update, :new, :create, :vote_up, :vote_down]
  before_action :check_if_author, :only => [:edit, :update]
  before_action :check_if_admin, :only => [:destroy]

  include Votable

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
    if comment.update comment_params
      redirect_to comment.post
    else
      @comment = comment
      @post = Post.find params[:post_id]
      render :edit
    end
  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def create
    comment = Comment.new comment_params
    comment.user_id = @current_user.id
    comment.post_id = params[:post_id]
    if comment.save
      redirect_to post_path(comment.post)
    else
      @errors = comment.errors.full_messages
      @comment = comment
      @post = Post.find params[:post_id]
      render :new
    end
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to post_path(params[:post_id])
  end

  def vote_up
    respond_to do |format|
      score = vote(1, 'Comment', params[:id], session[:user_id])
      if !score.nil?
        format.html { redirect_to post_path params[:post_id] }
        format.js { render :json => { :status => 'ok', :score => score } }
      else
        format.html { redirect_to post_path params[:post_id] }
        format.js { render :json => { :status => 'error' } }
      end
    end
  end

  def vote_down
    respond_to do |format|
      score = vote(-1, 'Comment', params[:id], session[:user_id])
      if !score.nil?
        format.html { redirect_to post_path params[:post_id] }
        format.js { render :json => { :status => 'ok', :score => score } }
      else
        format.html { redirect_to post_path params[:post_id] }
        format.js { render :json => { :status => 'error' } }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content_md, :content_html)
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
