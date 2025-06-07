class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end

    add_index :reviews, :rating
    add_index :reviews, [ :product_id, :rating ]
  end
end
