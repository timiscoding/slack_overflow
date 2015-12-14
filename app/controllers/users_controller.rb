class UsersController < ApplicationController
  before_action :check_if_admin, :only => [:index, :destroy]
  before_action :check_if_logged_in, :only => [:edit, :update, :show]
  before_action :set_privileges, :only => [:edit, :update, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new user_params
    if user.save
      session[:user_id] = user.id
      redirect_to posts_path
    else
      @errors = user.errors.full_messages
      @user = user
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to user_path(user)
  end

  def show
      @user = User.find params[:id]
  end

  def destroy
    Comment.destroy_all :user_id => params[:id]
    Post.destroy_all :user_id => params[:id]
    user = User.find params[:id]
    user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :course, :role, :password, :password_confirmation)
  end

  def check_if_logged_in
    redirect_to posts_path unless @current_user.present?
  end

  def set_privileges
    params[:id] = @current_user.id unless @current_user.present? && @current_user.admin?
  end

  def check_if_admin
    redirect_to posts_path unless @current_user.present? && @current_user.admin?
  end
end
