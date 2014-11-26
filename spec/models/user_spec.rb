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

require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:stores) }
end
