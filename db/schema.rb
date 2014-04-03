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

ActiveRecord::Schema.define(version: 20140403144929) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", force: true do |t|
    t.text     "url"
    t.text     "description"
    t.string   "name"
    t.integer  "category_id"
    t.float    "price"
    t.string   "currency"
    t.string   "out_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "img"
    t.boolean  "available"
  end

  add_index "coupons", ["name"], name: "index_coupons_on_name", using: :btree
  add_index "coupons", ["url"], name: "index_coupons_on_url", unique: true, using: :btree

  create_table "providers", force: true do |t|
    t.string   "name"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "key"
  end

end
