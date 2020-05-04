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

ActiveRecord::Schema.define(version: 2020_04_13_141649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "period_id"
    t.bigint "subscription_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["period_id"], name: "index_orders_on_period_id"
    t.index ["subscription_id"], name: "index_orders_on_subscription_id"
  end

  create_table "periods", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "cut_at"
  end

  create_table "statistics_item_clicks", force: :cascade do |t|
    t.bigint "item_id"
    t.integer "clicked", default: 0
    t.date "date"
    t.index ["item_id", "date"], name: "idx_item_clicks_uniq", unique: true
    t.index ["item_id"], name: "index_statistics_item_clicks_on_item_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.boolean "terminated", default: false, comment: "当设置为 True 的时候代表订阅已经被终止"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["terminated"], name: "idx_terminated_on_subscription"
  end

end
