class RemoveStoredIdFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :stored_id, :integer
  end
end
