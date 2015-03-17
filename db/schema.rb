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

ActiveRecord::Schema.define(version: 20150317005258) do

  create_table "participants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.boolean  "contact",    default: true
    t.integer  "show_count", default: 0
    t.string   "notes"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "performances", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "show_id"
    t.integer  "play_id"
    t.string   "role"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "plays", force: :cascade do |t|
    t.string   "title"
    t.integer  "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string   "title"
    t.string   "month"
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

end
