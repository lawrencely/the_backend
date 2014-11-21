# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  store_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :category do
    name "MyString"
description "MyText"
store_id 1
  end

end
