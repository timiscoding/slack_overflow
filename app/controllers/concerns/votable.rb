 module Votable extend ActiveSupport::Concern

  def vote(value, votable_type, votable_id, user_id)
    votable_type = votable_type.downcase.capitalize
    vote = Vote.find_or_initialize_by :user_id => user_id, :votable_id => votable_id, :votable_type => votable_type
    votable = Comment.find votable_id if votable_type == 'Comment'
    votable = Post.find votable_id if votable_type == 'Post'
    # vote.update_attribute(:votable, votable)
    if vote.value == value # user undo vote
      vote.value = nil
      votable.score -= value
    else
      if vote.value.nil? # first vote or voting after undoing a vote
        votable.score += value
      else # changing their vote. ie. upvote to downvote or vice versa
        votable.score += 2 * value
      end
      vote.value = value
    end
    begin
      ActiveRecord::Base.transaction do
        vote.save
        votable.save
      end
    rescue
      nil
    end
    votable.score
  end
end