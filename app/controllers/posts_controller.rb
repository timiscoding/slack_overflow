class PostsController < ApplicationController
  before_action :check_if_admin, :only => [:destroy]
  before_action :check_if_logged_in, :only => [:new, :create, :edit, :update, :vote_up, :vote_down]
  before_action :check_if_author, :only => [:edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new post_params
    post.user_id = session[:user_id]
    post.save
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
    require 'github/markup'
    require 'coderay'
    @post = Post.find params[:id]
    html = GitHub::Markup.render('.md', @post.content).html_safe
    @content = add_syntax_highlight(html)
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

  def vote_up
    vote = Vote.find_or_initialize_by :user_id => session[:user_id], :votable_id => params[:id], :votable_type => 'Post'
    vote.vote = 1
    post = Post.find params[:id]
    vote.update_attribute(:votable, post)
    vote.save
    redirect_to post_path(post)
  end

  def vote_down
    vote = Vote.find_or_initialize_by :user_id => session[:user_id], :votable_id => params[:id], :votable_type => 'Post'
    vote.vote = -1
    post = Post.find params[:id]
    vote.update_attribute(:votable, post)
    vote.save
    redirect_to post_path(post)
  end

  private
  def post_params
    params.require(:post).permit(:topic, :content)
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

  # convert html 'code blocks' into syntax highlighted html with inline styling
  def add_syntax_highlight(html)
    doc = Nokogiri::HTML(html)
    code_blocks = doc.css('code')
    code_blocks.each do |code_element|
      code = code_element.content.split "\n"
      next if code.length == 1 # skipping inline code
      lang = code[0].strip
      next if lang.empty? # skipping syntax highlighting as no language provided
      code = code[1..-1].join("\n")
      syntax_highlighted_html = CodeRay::scan(code, lang).div(:line_numbers => :table)
      code_element.inner_html = syntax_highlighted_html
    end
    doc
  end
end
