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

ActiveRecord::Schema.define(version: 20150811202014) do

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "kind"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "business_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "address"
    t.string   "location"
    t.string   "voice"
    t.string   "fax"
    t.string   "vrn"
    t.string   "tin"
  end

  create_table "mobile_money_accounts", force: :cascade do |t|
    t.string   "number"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "business_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.float    "unit_price"
    t.text     "description"
    t.integer  "business_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "service_provider_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "relationships", ["customer_id", "service_provider_id"], name: "index_relationships_on_customer_id_and_service_provider_id", unique: true
  add_index "relationships", ["customer_id"], name: "index_relationships_on_customer_id"
  add_index "relationships", ["service_provider_id"], name: "index_relationships_on_service_provider_id"

end
