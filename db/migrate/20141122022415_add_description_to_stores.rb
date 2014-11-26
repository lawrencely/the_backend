class AddDescriptionToStores < ActiveRecord::Migration
  def change
    add_column :stores, :description, :string
  end
end
