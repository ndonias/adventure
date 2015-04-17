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

ActiveRecord::Schema.define(version: 20150331033500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "message_headers", force: :cascade do |t|
    t.text     "user_id"
    t.text     "other_id"
    t.text     "message_id"
    t.boolean  "is_sent"
    t.boolean  "is_read",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_headers", ["message_id"], name: "index_message_headers_on_message_id", using: :btree
  add_index "message_headers", ["other_id"], name: "index_message_headers_on_other_id", using: :btree
  add_index "message_headers", ["user_id"], name: "index_message_headers_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "receiver_id"
    t.text     "trigger_id"
    t.text     "status_type"
    t.boolean  "is_read"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "profile_id"
    t.text     "file_file_name"
    t.text     "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "user_id"
    t.text     "sex"
    t.text     "sexual_orientation"
    t.text     "bio"
    t.boolean  "weights"
    t.boolean  "running"
    t.boolean  "biking"
    t.boolean  "swimming"
    t.boolean  "rocks"
    t.boolean  "hiking"
    t.boolean  "yoga"
    t.boolean  "dance"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "zip_code"
    t.text     "city"
    t.date     "birthday"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "status_messages", force: :cascade do |t|
    t.text     "user_id"
    t.text     "category"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_filters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "beg_age"
    t.integer  "end_age"
    t.text     "sex"
    t.text     "distance"
    t.text     "sexual_orientation"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "username"
    t.text     "email"
    t.text     "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "password"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
