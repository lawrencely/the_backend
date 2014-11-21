# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  status      :string(255)
#  memo        :string(255)
#  store_id    :integer
#  street      :string(255)
#  suburb      :string(255)
#  postcode    :string(255)
#  state       :string(255)
#  country     :string(255)
#  ip_address  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :store
end
