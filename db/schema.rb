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

ActiveRecord::Schema.define(version: 20140307103258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "districts", id: false, force: true do |t|
    t.string   "id",         null: false
    t.string   "name"
    t.string   "full_name"
    t.integer  "id_api"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legislatives", force: true do |t|
    t.string   "name"
    t.integer  "id_api"
    t.string   "party_id"
    t.string   "district_id"
    t.text     "dump"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", id: false, force: true do |t|
    t.integer  "id",         null: false
    t.string   "name"
    t.string   "full_name"
    t.integer  "id_api"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.string   "legislative_id"
    t.string   "tweet_id"
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: false, force: true do |t|
    t.string   "id"
    t.string   "username"
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.string   "access_key"
    t.string   "access_secret"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
