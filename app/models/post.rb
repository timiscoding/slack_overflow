# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  topic      :string
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  include Elasticsearch::Model # enables search
  include Elasticsearch::Model::Callbacks # any changes to model will update index
  has_many :comments
end
