# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  post_id      :integer
#  user_id      :integer
#  content_md   :text
#  content_html :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  score        :integer          default(0)
#

class Comment < ActiveRecord::Base
  include PostUpdatable

  # update the last update timestamp for the post after a comment has been added/updated
  after_save :update_post_last_update_timestamp
  after_update :update_post_last_update_timestamp

  validates :content_md, :presence => true

  belongs_to :post
  belongs_to :user
  has_many :votes, as: :votable
end
