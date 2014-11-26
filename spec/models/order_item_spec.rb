# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  price      :string(255)
#  quantity   :integer
#  order_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe OrderItem, :type => :model do
  it { should belong_to(:order) }
end
