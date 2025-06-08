class AddForeignKeyToCategories < ActiveRecord::Migration[8.0]
  def change
    # Adding a foreign key constraint to parent_id in the categories table
    # This references the id column of the same categories table (self-referential relationship)
    # The on_delete: :nullify option ensures that when a parent category is deleted,
    # its children's parent_id is set to NULL instead of deleting the children
    add_foreign_key :categories, :categories, column: :parent_id, on_delete: :nullify
  end
end
