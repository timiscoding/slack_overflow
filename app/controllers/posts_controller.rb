class PostsController < ApplicationController
  before_action :check_if_admin, :only => [:destroy]
  before_action :check_if_logged_in, :only => [:new, :create, :edit, :update, :vote_up, :vote_down]
  before_action :check_if_author, :only => [:edit, :update]
  before_action :show_users_votes, :only => [:show]

  include Votable

  def index
    @posts = Post.all.order(:created_at => :desc)
    js false # tell paloma to ignore action
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new post_params
    post.user_id = session[:user_id]
    if post.save
      vote 1, 'post', post.id, session[:user_id]
      redirect_to posts_path
    else
      @errors = post.errors.full_messages
      @post = post
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    if post.update post_params
      redirect_to post
    else
      @errors = post.errors.full_messages
      @post = post
      render :edit
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
    post = Post.find params[:id]
    Comment.destroy_all :post_id => params[:id]
    post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:q]).records
    render :index
    js false # tell paloma to ignore action
  end

  def vote_up
    respond_to do |format|
      score = vote(1, 'Post', params[:id], session[:user_id])
      if !score.nil?
        format.html { redirect_to post_path params[:id] }
        format.js { render :json => { :status => 'ok', :score => score } }
      else
        format.html { redirect_to post_path params[:id] }
        format.js { render :json => { :status => 'error' } }
      end
    end
    js false # tell paloma to ignore action
  end

  def vote_down
    respond_to do |format|
      score = vote(-1, 'Post', params[:id], session[:user_id])
      if !score.nil?
        format.html { redirect_to post_path params[:id] }
        format.js { render :json => { :status => 'ok', :score => score } }
      else
        format.html { redirect_to post_path params[:id] }
        format.js { render :json => { :status => 'error' } }
      end
    end
    js false # tell paloma to ignore action
  end

  private
  def post_params
    params.require(:post).permit(:topic, :content_md, :content_html)
  end

  def check_if_logged_in
    redirect_to post_path(params[:id]) unless @current_user.present?
  end

  def check_if_admin
    redirect_to post_path(params[:id]) unless @current_user.present? && @current_user.admin?
  end

  # author can be post creator or admin
  def check_if_author
    post = Post.find params[:id]
    redirect_to post_path(params[:id]) unless @current_user.present? && (@current_user.id == post.user.id || @current_user.admin?)
  end

  def show_users_votes
    return if @current_user.nil?
    postVote = @current_user.votes.find_by(:votable_type => 'Post', :votable_id => params[:id])
    commentVotes = @current_user.votes.where(:votable_type => 'Comment').select { |comment| comment.votable.post.id == params[:id].to_i }
    @votes = {}
    @votes[:post] = postVote.value unless postVote.nil?
    @votes[:comments] = {} unless commentVotes.nil?
    commentVotes.each do |commentVote|
      @votes[:comments][commentVote.votable_id.to_s.to_sym] = commentVote.value
    end
  end
end
