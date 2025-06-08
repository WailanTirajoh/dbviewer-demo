class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :position, null: false
      t.text :bio
      t.string :avatar_url
      t.boolean :active, default: true
      t.jsonb :contact_info, default: {}

      t.timestamps
    end

    add_index :employees, [ :company_id, :email ], unique: true
  end
end
