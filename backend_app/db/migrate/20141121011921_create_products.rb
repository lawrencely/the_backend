class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :short_description
      t.string :price
      t.integer :category_product_id
      t.integer :store_id
      t.text :product_attributes
      t.string :image

      t.timestamps
    end
  end
end
