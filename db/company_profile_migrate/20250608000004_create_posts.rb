class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :company, null: false, foreign_key: true
      t.references :author, foreign_key: { to_table: :employees }
      t.string :title, null: false
      t.string :slug, null: false
      t.text :content, null: false
      t.text :excerpt
      t.string :featured_image_url
      t.string :status, default: 'draft'
      t.datetime :published_at
      t.jsonb :metadata, default: {}

      t.timestamps
    end

    add_index :posts, [ :company_id, :slug ], unique: true
  end
end
