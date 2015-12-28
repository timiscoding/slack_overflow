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
  include Parsable

  before_save :md_to_html
  before_update :md_to_html
  after_save :last_update
  after_update :last_update

  validates :content_md, :presence => true

  belongs_to :post
  belongs_to :user
  has_many :votes, as: :votable
end
