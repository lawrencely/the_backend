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

class Store < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  has_many :customers
  has_many :products
  has_many :categories
  validates :name, :presence => true

  DEFAULT_API_RPM =  10

  before_create do |doc|
    doc.api_key = Store.generate_api_key
    doc.api_rpm = DEFAULT_API_RPM if doc.api_rpm == 0
  end

  def self.generate_api_key
    loop do
      token = SecureRandom.base64.tr('0+/=', 'bRat')
      break token unless Store.exists?(api_key: token)
    end
  end

end
