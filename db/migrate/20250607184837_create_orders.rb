class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :order_number
      t.datetime :order_date
      t.string :status
      t.decimal :total_amount, precision: 10, scale: 2

      t.timestamps
    end
    add_index :orders, :order_number, unique: true
  end
end
