class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description, null: false
      t.string :icon_url
      t.decimal :price, precision: 10, scale: 2
      t.string :price_unit
      t.boolean :featured, default: false
      t.integer :display_order

      t.timestamps
    end

    add_index :services, [ :company_id, :slug ], unique: true
  end
end
