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

ActiveRecord::Schema.define(version: 20151210170343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.jsonb    "data",              default: {}, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "github_id",                      null: false
    t.datetime "github_created_at"
  end

  add_index "events", ["github_created_at"], name: "index_events_on_github_created_at", using: :btree
  add_index "events", ["github_id"], name: "index_events_on_github_id", unique: true, using: :btree

  create_table "github_users", force: :cascade do |t|
    t.integer  "github_id",               null: false
    t.jsonb    "data",       default: {}, null: false
    t.string   "login",                   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "github_users", ["github_id"], name: "index_github_users_on_github_id", unique: true, using: :btree
  add_index "github_users", ["login"], name: "index_github_users_on_login", unique: true, using: :btree

end
