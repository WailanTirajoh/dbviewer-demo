class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2
      t.decimal :subtotal, precision: 10, scale: 2

      t.timestamps
    end
  end
end
