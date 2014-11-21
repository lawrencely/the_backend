class CreateCategoriesProducts < ActiveRecord::Migration
  def change
    create_join_table :products, :categories
    # create_table :categories_products do |t|
    # end
  end
end
