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

require 'rails_helper'

RSpec.describe Category, :type => :model do
  it { should have_and_belong_to_many(:products) }
  it { should belong_to(:store) }
end
