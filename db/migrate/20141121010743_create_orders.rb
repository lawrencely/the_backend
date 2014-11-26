class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :status
      t.string :memo
      t.integer :store_id
      t.string :street
      t.string :suburb
      t.string :postcode
      t.string :state
      t.string :country
      t.string :ip_address

      t.timestamps
    end
  end
end
