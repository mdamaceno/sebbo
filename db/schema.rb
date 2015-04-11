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

ActiveRecord::Schema.define(version: 20150411031406) do

  create_table "addresses", force: :cascade do |t|
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zipcode",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "day_of_payment"
    t.string   "user_seller_name", limit: 255
    t.string   "user_buyer_name",  limit: 255
    t.string   "user_seller_cpf",  limit: 255
    t.string   "user_buyer_cpf",   limit: 255
    t.integer  "payment_method",   limit: 4
    t.string   "address",          limit: 255
    t.string   "zipcode",          limit: 255
    t.string   "state",            limit: 255
    t.string   "city",             limit: 255
    t.string   "price",            limit: 255
    t.integer  "status",           limit: 4
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer  "product_id",          limit: 4
    t.string   "product_name",        limit: 255
    t.text     "product_description", limit: 65535
    t.decimal  "product_price",                     precision: 10
    t.integer  "product_quantity",    limit: 4
    t.integer  "user_id",             limit: 4
    t.integer  "order_id",            limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "product_orders", ["order_id"], name: "index_product_orders_on_order_id", using: :btree
  add_index "product_orders", ["user_id"], name: "index_product_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "code",        limit: 4
    t.string   "slug",        limit: 255
    t.decimal  "price",                     precision: 10
    t.boolean  "sold",        limit: 1
    t.integer  "quantity",    limit: 4
    t.boolean  "featured",    limit: 1
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "image",       limit: 255
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                   limit: 4
    t.integer  "gender",                 limit: 4
    t.string   "name",                   limit: 255
    t.string   "address",                limit: 255
    t.string   "contact1",               limit: 255
    t.string   "contact2",               limit: 255
    t.string   "doc",                    limit: 255
    t.string   "avatar",                 limit: 255
    t.text     "description",            limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "product_orders", "orders"
  add_foreign_key "product_orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
end
