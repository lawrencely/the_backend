# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  price      :string(255)
#  quantity   :integer
#  order_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
end
