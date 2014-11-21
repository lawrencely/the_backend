class Category < ActiveRecord::Base
  has_many :products
  belongs_to :store
end
