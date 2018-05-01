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

ActiveRecord::Schema.define(version: 20180325190531) do

  create_table "assignments", force: :cascade do |t|
    t.string   "title"
    t.text     "problem"
    t.datetime "due_date"
    t.integer  "possible_grade"
    t.text     "solution"
    t.string   "basis"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "premission",             default: "",         null: false
    t.text     "tbasis",                 default: "",         null: false
    t.text     "tinduction",             default: "",         null: false
    t.text     "tproof",                 default: "",         null: false
    t.text     "a1basis",                default: "",         null: false
    t.text     "a1induction",            default: "",         null: false
    t.text     "a1proof",                default: "",         null: false
    t.string   "a1grade",                default: "-1",       null: false
    t.text     "a2basis",                default: "",         null: false
    t.text     "a2induction",            default: "",         null: false
    t.text     "a2proof",                default: "",         null: false
    t.string   "a2grade",                default: "-1",       null: false
    t.text     "a3basis",                default: "",         null: false
    t.text     "a3induction",            default: "",         null: false
    t.text     "a3proof",                default: "",         null: false
    t.string   "a3grade",                default: "-1",       null: false
    t.text     "a4basis",                default: "",         null: false
    t.text     "a4induction",            default: "",         null: false
    t.text     "a4proof",                default: "",         null: false
    t.string   "a4grade",                default: "-1",       null: false
    t.text     "a5basis",                default: "",         null: false
    t.text     "a5duction",              default: "",         null: false
    t.text     "a5proof",                default: "",         null: false
    t.string   "a5grade",                default: "-1",       null: false
    t.string   "provider",               default: "",         null: false
    t.string   "first_name",             default: "",         null: false
    t.string   "last_name",              default: "",         null: false
    t.string   "uid",                    default: "",         null: false
    t.string   "encrypted_tamu_uin",     default: "",         null: false
    t.string   "class_section",          default: "",         null: false
    t.string   "tgrade",                 default: "",         null: false
    t.string   "grade",                  default: "-1",       null: false
    t.text     "assignments",            default: "--- []\n", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
