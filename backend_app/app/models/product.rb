class Product < ActiveRecord::Base
  has_many :categories
end
