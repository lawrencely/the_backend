class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :store_id
      t.string :street
      t.string :suburb
      t.string :postcode
      t.string :state
      t.string :country
      t.integer :stored_id

      t.timestamps
    end
  end
end
