class AddApiRpmToStores < ActiveRecord::Migration
  def change
    add_column :stores, :api_rpm, :integer, default: 0
  end
end
