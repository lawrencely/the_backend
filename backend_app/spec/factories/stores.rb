# == Schema Information
#
# Table name: stores
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  description :string(255)
#  api_key     :string(255)
#  api_secret  :string(255)
#  api_rpm     :integer          default(0)
#

FactoryGirl.define do
  factory :store do
    user_id 1
  end

end
