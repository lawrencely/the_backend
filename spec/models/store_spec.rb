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
  before do
    @current_user = User.create!(
      name: 'test',
      email: 'test@test.com',
      password: 'testtest',
      password_confirmation: 'testtest'
    )
    @store = Store.create!(
      name: 'test_store',
      description: 'test_store_desciption',
      api_key: '',
      api_secret: '',
      user_id: @current_user.id
    )
  end
  it 'should create store with api key' do
    expect(@store.api_key).to_not eq('')
  end

  it 'should generate api_key' do
    expect(Store.generate_api_key).to_not eq(@store.api_key)
  end
end
