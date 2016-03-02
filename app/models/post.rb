# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  topic        :string
#  content_md   :text
#  content_html :text
#  last_update  :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  score        :integer          default(0)
#

class Post < ActiveRecord::Base
  include Elasticsearch::Model # enables search
  include Elasticsearch::Model::Callbacks # any changes to model will update index
  include PostUpdatable

  validates :topic, :presence => true
  validates :content_md, :presence => true

  # update the post last_update column before saving
  before_save :update_post_last_update_timestamp
  before_update :update_post_last_update_timestamp

  has_many :comments, :dependent => :destroy
  belongs_to :user
  has_many :votes, as: :votable
end
