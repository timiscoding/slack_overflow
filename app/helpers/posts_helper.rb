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

module PostsHelper
end
