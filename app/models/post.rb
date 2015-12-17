# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  topic        :string
#  content_md   :text
#  content_html :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Post < ActiveRecord::Base
  include Elasticsearch::Model # enables search
  include Elasticsearch::Model::Callbacks # any changes to model will update index
  include Parsable

  validates :topic, :presence => true
  validates :content_md, :presence => true

  before_save :md_to_html
  before_update :md_to_html

  has_many :comments
  belongs_to :user
  has_many :votes, as: :votable


end
