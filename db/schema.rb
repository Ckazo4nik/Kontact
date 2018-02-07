# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180207132818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_cards", force: :cascade do |t|
    t.string "card_number"
    t.string "card_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.float "cooking_time"
    t.boolean "show", default: false
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "dish_id"
    t.bigint "order_id"
    t.decimal "unit_price", precision: 12, scale: 3, default: "0.0"
    t.integer "quantity"
    t.decimal "total_price", precision: 12, scale: 3, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_order_items_on_dish_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total", precision: 12, scale: 3
    t.decimal "subtotal", precision: 12, scale: 3
    t.bigint "order_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "restaurant_id"
    t.integer "user_id"
    t.string "ids"
    t.integer "users"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "orders_users", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_users_on_order_id"
    t.index ["user_id"], name: "index_orders_users_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.integer "user_id"
    t.string "secret_key_restaurant"
    t.string "public_key_restaurant"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.string "email"
    t.text "image"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "phone"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "dishes", "restaurants"
  add_foreign_key "order_items", "dishes"
  add_foreign_key "order_items", "orders", on_delete: :cascade
  add_foreign_key "orders", "order_statuses"
end
