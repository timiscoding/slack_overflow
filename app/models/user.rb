# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  password_digest :text
#  image           :text
#  role            :integer
#  course          :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :presence => true, :length => { :minimum => 2, :maximum => 50 }
  validates :email, :presence => true, :length => { :maximum => 255 }, :format => { :with => VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :minimum => 6 }, :on => :create
  has_secure_password
  enum role: [:student, :teacher, :admin]
  has_many :posts
  has_many :comments
end
