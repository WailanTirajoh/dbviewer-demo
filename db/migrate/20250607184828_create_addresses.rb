class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :address_type
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.boolean :default, default: false

      t.timestamps
    end

    add_index :addresses, [ :customer_id, :address_type ]
    add_index :addresses, :address_type
  end
end
