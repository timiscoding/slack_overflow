module Parsable extend ActiveSupport::Concern
  # set the update timestamp for the post to the last comment/post commit
  def last_update
    if self.instance_of? Post
      self.last_update = self.updated_at
    elsif self.instance_of? Comment
      return if self.post.nil?
      self.post.last_update = self.updated_at
      self.post.save
    end
  end
end