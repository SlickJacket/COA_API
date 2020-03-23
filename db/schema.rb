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

ActiveRecord::Schema.define(version: 2020_03_23_192412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "insta_products", force: :cascade do |t|
    t.string "photo_string"
    t.string "title"
    t.string "description"
    t.string "material"
    t.string "color"
    t.string "length"
    t.string "width"
    t.string "stones"
    t.string "cut"
    t.string "stone_color"
    t.string "carat_weight"
    t.string "gram_weight"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_insta_products_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "folder_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["folder_id"], name: "index_notes_on_folder_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "title"
    t.string "specs"
    t.string "imgs"
    t.string "quote"
    t.string "order_number"
    t.boolean "complete"
    t.boolean "starred"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "read"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "content"
    t.string "img"
    t.string "you_link"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.string "bio"
    t.string "profile_img"
    t.string "cover_img"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "you_videos", force: :cascade do |t|
    t.string "youtube_link"
    t.string "title"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_you_videos_on_user_id"
  end

  add_foreign_key "clients", "users"
  add_foreign_key "folders", "users"
  add_foreign_key "insta_products", "users"
  add_foreign_key "notes", "folders"
  add_foreign_key "orders", "clients"
  add_foreign_key "posts", "users"
  add_foreign_key "you_videos", "users"
end
