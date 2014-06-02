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

ActiveRecord::Schema.define(version: 20140413152415) do

  create_table "feeds", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "style"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "followers", force: true do |t|
    t.integer  "user_id"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "observation_id"
    t.string   "altitude"
  end

  create_table "observations", force: true do |t|
    t.date     "seen"
    t.string   "right_ascension"
    t.string   "declination"
    t.string   "magnitude"
    t.string   "catalog_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feed_id"
  end

  create_table "photos", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.text     "description"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "observation_id"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feed_id"
    t.string   "username"
  end

end
