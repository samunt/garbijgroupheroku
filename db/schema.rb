# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160802175939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.integer  "transaction_id"
    t.string   "ip"
    t.string   "express_token"
    t.string   "express_payer_id"
    t.integer  "cart_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.integer  "capacity"
    t.string   "garbaje_day"
    t.integer  "user_id"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "substract"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "buy_space_id"
    t.integer  "sell_space_id"
    t.float    "total_fee"
    t.date     "transaction_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "quantity"
    t.string   "status"
    t.float    "total_amount_cents"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "phone"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "salt"
    t.string   "crypted_password"
    t.string   "billing_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

end
