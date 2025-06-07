class AddAddressesToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :shipping_address_id, :integer
    add_column :orders, :billing_address_id, :integer

    add_index :orders, :shipping_address_id
    add_index :orders, :billing_address_id
    add_foreign_key :orders, :addresses, column: :shipping_address_id
    add_foreign_key :orders, :addresses, column: :billing_address_id
  end
end
