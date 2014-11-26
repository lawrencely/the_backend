class AddApiSecretToStores < ActiveRecord::Migration
  def change
    add_column :stores, :api_secret, :string
  end
end
