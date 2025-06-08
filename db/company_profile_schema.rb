# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_08_000008) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "category_profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_category_profiles_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.string "author_name", null: false
    t.string "author_email"
    t.text "content", null: false
    t.string "status", default: "pending"
    t.string "ip_address"
    t.string "user_agent"
    t.boolean "notify_on_reply", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description"
    t.string "logo_url"
    t.string "website"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.jsonb "social_media", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_companies_on_slug", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "position", null: false
    t.text "bio"
    t.string "avatar_url"
    t.boolean "active", default: true
    t.jsonb "contact_info", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "email"], name: "index_employees_on_company_id_and_email", unique: true
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "post_categories", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_post_categories_on_category_id"
    t.index ["post_id", "category_id"], name: "index_post_categories_on_post_id_and_category_id", unique: true
    t.index ["post_id"], name: "index_post_categories_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "author_id"
    t.string "title", null: false
    t.string "slug", null: false
    t.text "content", null: false
    t.text "excerpt"
    t.string "featured_image_url"
    t.string "status", default: "draft"
    t.datetime "published_at"
    t.jsonb "metadata", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["company_id", "slug"], name: "index_posts_on_company_id_and_slug", unique: true
    t.index ["company_id"], name: "index_posts_on_company_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description", null: false
    t.string "icon_url"
    t.decimal "price", precision: 10, scale: 2
    t.string "price_unit"
    t.boolean "featured", default: false
    t.integer "display_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "slug"], name: "index_services_on_company_id_and_slug", unique: true
    t.index ["company_id"], name: "index_services_on_company_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "author_name", null: false
    t.string "author_position"
    t.string "author_company"
    t.text "content", null: false
    t.integer "rating"
    t.string "avatar_url"
    t.boolean "featured", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_testimonials_on_company_id"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "employees", "companies"
  add_foreign_key "post_categories", "category_profiles", column: "category_id"
  add_foreign_key "post_categories", "posts"
  add_foreign_key "posts", "companies"
  add_foreign_key "posts", "employees", column: "author_id"
  add_foreign_key "services", "companies"
  add_foreign_key "testimonials", "companies"
end
