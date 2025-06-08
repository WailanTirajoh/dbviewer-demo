class CreateTestimonials < ActiveRecord::Migration[7.1]
  def change
    create_table :testimonials do |t|
      t.references :company, null: false, foreign_key: true
      t.string :author_name, null: false
      t.string :author_position
      t.string :author_company
      t.text :content, null: false
      t.integer :rating
      t.string :avatar_url
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
