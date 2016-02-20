# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  value        :integer
#  votable_id   :integer
#  votable_type :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
end
