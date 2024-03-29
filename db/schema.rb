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

ActiveRecord::Schema.define(version: 20160313131028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chargers", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "price"
    t.string   "location"
    t.string   "phone"
    t.integer  "user_id"
    t.string   "charger_type"
  end

  add_index "chargers", ["user_id"], name: "index_chargers_on_user_id", using: :btree

  create_table "commercial_chargers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "coordinates"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "raitings", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "ok"
    t.text     "review"
    t.integer  "user_id"
    t.integer  "charger_id"
    t.integer  "commercial_charger_id"
  end

  add_index "raitings", ["charger_id"], name: "index_raitings_on_charger_id", using: :btree
  add_index "raitings", ["commercial_charger_id"], name: "index_raitings_on_commercial_charger_id", using: :btree
  add_index "raitings", ["user_id"], name: "index_raitings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone"
    t.string   "fname"
    t.string   "lname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "chargers", "users"
  add_foreign_key "raitings", "chargers"
  add_foreign_key "raitings", "commercial_chargers"
  add_foreign_key "raitings", "users"
end
