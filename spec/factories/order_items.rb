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

FactoryGirl.define do
  factory :order_item do
    product_id 1
price "MyString"
quantity 1
order_id 1
  end

end
