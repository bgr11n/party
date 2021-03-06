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

ActiveRecord::Schema.define(version: 20160105155433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tracks", force: :cascade do |t|
    t.string   "uri"
    t.string   "title"
    t.string   "thumbnail"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tracks", ["uri"], name: "index_tracks_on_uri", using: :btree

  create_table "user_identities", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.string   "email",         null: false
    t.string   "source",        null: false
    t.text     "data"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "password_salt"
    t.string   "password_hash"
  end

  add_index "user_identities", ["email"], name: "index_user_identities_on_email", using: :btree
  add_index "user_identities", ["user_id"], name: "index_user_identities_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "grand",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "nickname",                   null: false
  end

end
