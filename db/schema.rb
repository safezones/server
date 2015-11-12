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

ActiveRecord::Schema.define(version: 20151112151351) do

  create_table "adult_children", id: false, force: :cascade do |t|
    t.integer "adult_id"
    t.integer "child_id"
    t.string  "relation"
  end

  create_table "adults", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.float    "last_seen",  default: 0.0
    t.float    "last_lon",   default: 0.0
    t.float    "last_lat",   default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

# Could not dump table "safe_zones" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "zone_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "child_id"
  end

end
