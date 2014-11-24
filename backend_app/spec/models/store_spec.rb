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
#

require 'rails_helper'

RSpec.describe Store, :type => :model do
  it { should belong_to(:user)}
  it { should have_many(:orders) }
  it { should have_many(:customers) }
  it { should have_many(:products) }
  it { should have_many(:categories) }
end
