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

ActiveRecord::Schema.define(version: 20140625193904) do

  create_table "analysts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "analyst"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "analysts", ["email"], name: "index_analysts_on_email", unique: true

  create_table "documents", force: true do |t|
    t.string   "toi"
    t.date     "date_signed"
    t.date     "date_recorded"
    t.string   "party1"
    t.string   "party2"
    t.string   "cfn"
    t.string   "county"
    t.integer  "amount"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "record_file_name"
    t.string   "record_content_type"
    t.integer  "record_file_size"
    t.datetime "record_updated_at"
  end

  add_index "documents", ["property_id", "cfn"], name: "index_documents_on_property_id_and_cfn"

  create_table "properties", force: true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.text     "legal_desc"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["user_id", "updated_at"], name: "index_properties_on_user_id_and_updated_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
