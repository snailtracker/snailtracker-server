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

ActiveRecord::Schema.define(version: 20140824002235) do

  create_table "action_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actions", force: true do |t|
    t.integer  "session_id"
    t.string   "url"
    t.integer  "action_type_id"
    t.string   "selector"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "target_text"
    t.integer  "keycode"
    t.string   "char"
    t.string   "value"
    t.string   "target_value"
  end

  add_index "actions", ["action_type_id"], name: "index_actions_on_action_type_id"
  add_index "actions", ["session_id"], name: "index_actions_on_session_id"

  create_table "apps", force: true do |t|
    t.string   "name"
    t.string   "api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "errors", force: true do |t|
    t.string   "exception_class"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "session_id"
  end

  add_index "errors", ["session_id"], name: "index_errors_on_session_id"

  create_table "log_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.integer  "log_type_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
    t.integer  "session_id"
  end

  add_index "logs", ["app_id"], name: "index_logs_on_app_id"
  add_index "logs", ["log_type_id"], name: "index_logs_on_log_type_id"
  add_index "logs", ["session_id"], name: "index_logs_on_session_id"

  create_table "notes", force: true do |t|
    t.integer  "session_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
  end

  add_index "notes", ["app_id"], name: "index_notes_on_app_id"
  add_index "notes", ["session_id"], name: "index_notes_on_session_id"

  create_table "sessions", force: true do |t|
    t.integer  "app_id"
    t.integer  "user_id"
    t.string   "user_name"
    t.string   "email"
    t.string   "browser"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_key"
  end

  add_index "sessions", ["app_id"], name: "index_sessions_on_app_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
