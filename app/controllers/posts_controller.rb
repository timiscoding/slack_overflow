class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create post_params
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update post_params
    redirect_to post
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
  end

  private
  def post_params
    params.require(:post).permit(:topic, :content)
  end
end
