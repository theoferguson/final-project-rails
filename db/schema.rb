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

ActiveRecord::Schema.define(version: 2021_11_04_195945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offerings", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "posted_at"
    t.string "name"
    t.boolean "less_than_truckload"
    t.boolean "full_truckload"
    t.string "destination"
    t.string "origin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_offerings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "company"
    t.boolean "capacity_provider"
    t.boolean "customer"
    t.string "location"
    t.string "industry"
    t.text "email"
    t.integer "logins_count"
    t.text "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
