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

ActiveRecord::Schema[7.0].define(version: 2021_12_03_232849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id"
    t.bigint "post_id"
    t.bigint "sender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_messages_on_post_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offerings", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "posted_at", precision: nil
    t.string "name"
    t.boolean "less_than_truckload"
    t.boolean "full_truckload"
    t.string "destination"
    t.string "origin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "origin_date", precision: nil
    t.datetime "destination_date", precision: nil
    t.float "asking_price"
    t.index ["user_id"], name: "index_offerings_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.bigint "offering_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offering_id"], name: "index_posts_on_offering_id"
  end

  create_table "user_data", force: :cascade do |t|
    t.string "category"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_data_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "company"
    t.boolean "capacity_provider", default: false
    t.boolean "customer"
    t.string "location"
    t.string "industry"
    t.text "email"
    t.integer "logins_count"
    t.text "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "messages", "posts"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "posts", "offerings"
  add_foreign_key "user_data", "users"
end
