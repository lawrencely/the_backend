# == Schema Information
#
# Table name: customers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  store_id        :integer
#  street          :string(255)
#  suburb          :string(255)
#  postcode        :string(255)
#  state           :string(255)
#  country         :string(255)
#  stored_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe Customer, :type => :model do
  it { should have_many(:orders) }
  it { should belong_to(:store)}
end
