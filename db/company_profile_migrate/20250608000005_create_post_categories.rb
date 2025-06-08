class CreatePostCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :post_categories do |t|
      t.references :post, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: { to_table: :category_profiles }

      t.timestamps
    end

    add_index :post_categories, [ :post_id, :category_id ], unique: true
  end
end
