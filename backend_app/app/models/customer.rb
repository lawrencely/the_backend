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
#  created_at      :datetime
#  updated_at      :datetime
#

class Customer < ActiveRecord::Base
  has_secure_password
  has_many :orders
  belongs_to :store
end
