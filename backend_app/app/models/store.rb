class Store < ActiveRecord::Base
  belongs_to :user
  has_many :orders, :customers, :products, :categories
end
