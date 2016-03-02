module PostUpdatable extend ActiveSupport::Concern
  # set the update timestamp for the post to the last comment/post commit
  # this is used to show when the post was last updated on the show index view
  def update_post_last_update_timestamp
    if self.instance_of? Post
      self.last_update = self.updated_at # this value will be saved because it's called by before_save/update callback
    elsif self.instance_of? Comment
      return if self.post.nil?
      self.post.last_update = self.updated_at
      self.post.save
    end
  end
end
