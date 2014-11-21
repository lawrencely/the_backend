class Customer < ActiveRecord::Base
  has_many :orders
  belongs_to :store
end
