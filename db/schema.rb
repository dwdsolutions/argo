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

ActiveRecord::Schema.define(version: 20140924065821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "institution_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.integer  "institution_type_id"
    t.string   "acronym"
    t.boolean  "accepts_online_information_requests"
    t.boolean  "at_complaints"
    t.boolean  "at_information_requests"
    t.string   "facebook_url"
    t.integer  "information_request_correlative"
    t.integer  "information_standard_category_id"
    t.boolean  "ranked"
    t.string   "twitter_url"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_comparations", force: true do |t|
    t.string   "name"
    t.decimal  "unit_cost",          precision: 10, scale: 2
    t.string   "source_information"
    t.string   "category"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travelers", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "institution"
    t.decimal  "cost_by_person"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "travel_cost"
    t.decimal  "viatical_cost"
    t.decimal  "lodgement_cost"
    t.string   "other_cost"
  end

  create_table "travels", force: true do |t|
    t.text     "name"
    t.string   "destination"
    t.integer  "passengers_number"
    t.text     "description"
    t.decimal  "total_cost",           precision: 10, scale: 2
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "city"
    t.string   "airport_code"
    t.text     "sponsor_contribution"
    t.string   "institution_name"
    t.string   "institution_acronym"
    t.string   "destination_code"
    t.boolean  "active",                                        default: true
    t.integer  "api_id"
  end

  add_index "travels", ["country"], name: "index_travels_on_country", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "travel_id"
    t.string   "ip"
    t.boolean  "vote_down"
    t.boolean  "vote_up"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
