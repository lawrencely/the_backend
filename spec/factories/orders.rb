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

FactoryGirl.define do
  factory :order do
    customer_id 1
status "MyString"
memo "MyString"
store_id 1
street "MyString"
suburb "MyString"
postcode "MyString"
state "MyString"
country "MyString"
ip_address "MyString"
  end

end
