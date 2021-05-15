class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :sku
      t.integer :inventory_quantity
      t.references :store

      t.timestamps
    end
  end
end
