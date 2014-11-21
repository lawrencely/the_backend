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

FactoryGirl.define do
  factory :product do
    name "MyString"
description "MyText"
short_description "MyText"
price "MyString"
category_product_id 1
store_id 1
product_attributes "MyText"
image "MyString"
  end

end
