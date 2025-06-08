class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.string :author_name, null: false
      t.string :author_email
      t.text :content, null: false
      t.string :status, default: 'pending'
      t.string :ip_address
      t.string :user_agent
      t.boolean :notify_on_reply, default: false

      t.timestamps
    end
  end
end
