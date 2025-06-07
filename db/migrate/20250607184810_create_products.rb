class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :stock_quantity
      t.references :category, null: false, foreign_key: true
      t.string :sku

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
