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

ActiveRecord::Schema.define(version: 20150702155820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: true do |t|
    t.string   "description"
    t.string   "title"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "queries", force: true do |t|
    t.integer  "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "showtimes", force: true do |t|
    t.integer  "movie_id"
    t.integer  "theatre_id"
    t.integer  "start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theatres", force: true do |t|
    t.integer  "zip_code"
    t.string   "title"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theatres_zipcodes", force: true do |t|
    t.integer "zipcode_id"
    t.integer "theatre_id"
  end

  add_index "theatres_zipcodes", ["theatre_id"], name: "index_theatres_zipcodes_on_theatre_id", using: :btree
  add_index "theatres_zipcodes", ["zipcode_id"], name: "index_theatres_zipcodes_on_zipcode_id", using: :btree

  create_table "zipcodes", force: true do |t|
    t.string "value"
  end

end
