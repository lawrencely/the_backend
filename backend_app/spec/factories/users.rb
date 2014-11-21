# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  options         :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

FactoryGirl.define do
  factory :user do
    name "MyString"
email "MyString"
password_digest "MyString"
options "MyString"
  end

end
