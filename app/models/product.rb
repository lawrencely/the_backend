# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  short_description  :text
#  price              :string(255)
#  store_id           :integer
#  product_attributes :text
#  image              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates :name, :presence => true
end
