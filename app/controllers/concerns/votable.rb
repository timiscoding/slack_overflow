 module Votable extend ActiveSupport::Concern

  def vote(score)
    if params[:controller] == 'comments' then
      vote = Vote.find_or_initialize_by :user_id => session[:user_id], :votable_id => params[:id], :votable_type => 'Comment'
      votable = Comment.find params[:id]
    else
      vote = Vote.find_or_initialize_by :user_id => session[:user_id], :votable_id => params[:id], :votable_type => 'Post'
      votable = Post.find params[:id]
    end
    vote.vote = score
    vote.update_attribute(:votable, votable)
    vote.save
  end

end