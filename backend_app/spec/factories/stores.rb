# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :store do
    user_id 1
  end

end
