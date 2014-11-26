class AddApiKeyToStores < ActiveRecord::Migration
  def change
    add_column :stores, :api_key, :string
  end
end
