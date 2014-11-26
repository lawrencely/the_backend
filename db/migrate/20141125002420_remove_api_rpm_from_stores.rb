class RemoveApiRpmFromStores < ActiveRecord::Migration
  def change
    remove_column :stores, :api_rpm, :integer
  end
end
