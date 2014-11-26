# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  options         :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :stores

  validates :name, :presence => true
  validates :email, :presence => true
  validates_length_of :password, :in => 6..20, :on => :create
end
