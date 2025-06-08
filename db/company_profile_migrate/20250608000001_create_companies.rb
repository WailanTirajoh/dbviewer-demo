class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true }
      t.text :description
      t.string :logo_url
      t.string :website
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.jsonb :social_media, default: {}

      t.timestamps
    end
  end
end
