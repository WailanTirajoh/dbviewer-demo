class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :category_profiles do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true }
      t.text :description

      t.timestamps
    end
  end
end
