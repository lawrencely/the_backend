# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Store < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  has_many :customers
  has_many :products
  has_many :categories
end
