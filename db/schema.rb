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

ActiveRecord::Schema.define(version: 20161020170211) do

  create_table "accounts", force: :cascade do |t|
    t.string "number"
    t.string "description"
  end

  create_table "announcements", force: :cascade do |t|
    t.text     "message"
    t.integer  "customer_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "broadcast",   default: false
  end

  add_index "announcements", ["customer_id"], name: "index_announcements_on_customer_id"

  create_table "bank_accounts", force: :cascade do |t|
    t.string "number"
    t.string "description"
    t.string "gl_acccount"
    t.string "bank_name"
  end

  create_table "bank_deposits", force: :cascade do |t|
    t.string "bank_number"
    t.string "description"
    t.string "deposit_date"
    t.float  "amout"
  end

  add_index "bank_deposits", ["bank_number"], name: "index_bank_deposits_on_bank_number"

  create_table "cash_receipts", force: :cascade do |t|
    t.string  "customer_number"
    t.float   "amount"
    t.string  "check_date"
    t.string  "created_date"
    t.integer "deposit_id"
  end

  add_index "cash_receipts", ["customer_number"], name: "index_cash_receipts_on_customer_number"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "number"
    t.string "name"
  end

  create_table "order_details", force: :cascade do |t|
    t.string "part_number"
    t.string "order_number"
    t.float  "amount"
  end

  add_index "order_details", ["order_number"], name: "index_order_details_on_order_number"
  add_index "order_details", ["part_number"], name: "index_order_details_on_part_number"

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.string "customer_number"
    t.string "order_date"
    t.string "desired_ship_date"
    t.string "last_ship_date"
    t.string "promised_date"
    t.float  "total_amount_ordered"
    t.float  "total_amount_shipped"
  end

  add_index "orders", ["customer_number"], name: "index_orders_on_customer_number"

  create_table "parts", force: :cascade do |t|
    t.string "number"
    t.string "description"
    t.string "part_type"
    t.float  "weight"
  end

  create_table "receivables", force: :cascade do |t|
    t.string "invoice_id"
    t.string "customer_number"
    t.string "invoice_date"
    t.float  "total_amount_receivable"
    t.float  "paid_amount"
    t.string "terms_description"
  end

  add_index "receivables", ["customer_number"], name: "index_receivables_on_customer_number"

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
  end

  add_index "roles", ["deleted_at"], name: "index_roles_on_deleted_at"

  create_table "users", force: :cascade do |t|
    t.string   "email",         limit: 255
    t.string   "name",          limit: 255
    t.string   "last_name",     limit: 255
    t.string   "username",      limit: 255
    t.string   "password_hash", limit: 255
    t.string   "password_salt", limit: 255
    t.integer  "role_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "deleted_at"
    t.integer  "customer_id"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at"
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
