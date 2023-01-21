# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_20_174644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.string "asset"
    t.string "type"
    t.string "content_type"
    t.integer "file_size"
    t.integer "position"
    t.integer "parent_id"
    t.string "parent_type"
    t.boolean "active", default: true
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "url"
    t.integer "layout_type"
    t.string "alt"
    t.text "attachment_properties"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.text "description"
    t.string "slug"
    t.string "url"
    t.string "short_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.integer "parent_id"
    t.integer "product_id"
    t.string "ancestry"
    t.string "layout"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "layout"
    t.string "url"
    t.boolean "active", default: true
    t.string "status"
    t.text "note"
    t.text "description"
    t.integer "position"
    t.integer "page_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url_product"
    t.string "url_text"
    t.text "properties"
    t.text "active_fields"
    t.string "slug"
  end

  create_table "media_socials", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "product_message"
    t.string "product_url"
    t.string "profile_url"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.boolean "active", default: true
    t.string "layout"
    t.string "slug"
    t.text "properties"
    t.text "header_desktop_properties"
    t.text "header_mobile_properties"
    t.text "seo_page_properties"
    t.text "footer"
    t.index ["ancestry"], name: "index_pages_on_ancestry"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.string "short_description"
    t.text "description"
    t.integer "position"
    t.string "slug"
    t.string "url"
    t.integer "price"
    t.integer "discount"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "image_type", default: 0
    t.text "tech_specification"
    t.string "ancestry"
    t.boolean "active", default: true
    t.text "properties"
    t.index ["ancestry"], name: "index_products_on_ancestry"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "url_media_socials"
    t.text "description"
    t.string "short_description"
    t.string "email"
    t.string "phone_1"
    t.string "phone_2"
    t.string "address"
    t.string "location"
    t.string "youtube_url"
    t.string "map_url"
    t.integer "parent_id"
    t.string "parent_type"
    t.text "general_style"
    t.text "meta"
  end

  create_table "subscribe_users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "products", "categories"
end
