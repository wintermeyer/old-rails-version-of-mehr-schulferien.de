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

ActiveRecord::Schema.define(version: 20151021094432) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "zip_code"
    t.integer  "federal_state_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cities", ["federal_state_id"], name: "index_cities_on_federal_state_id"
  add_index "cities", ["slug"], name: "index_cities_on_slug", unique: true

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "countries", ["slug"], name: "index_countries_on_slug", unique: true

  create_table "days", force: :cascade do |t|
    t.date     "value"
    t.integer  "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "wday"
    t.integer  "position"
  end

  add_index "days", ["month_id"], name: "index_days_on_month_id"
  add_index "days", ["value"], name: "index_days_on_value", unique: true

  create_table "event_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "css_class"
  end

  create_table "events", force: :cascade do |t|
    t.date     "starts_on"
    t.date     "ends_on"
    t.string   "summary"
    t.integer  "eventable_id"
    t.string   "eventable_type"
    t.integer  "event_type_id"
    t.integer  "religion_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "events", ["ends_on"], name: "index_events_on_ends_on"
  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id"
  add_index "events", ["eventable_type", "eventable_id"], name: "index_events_on_eventable_type_and_eventable_id"
  add_index "events", ["religion_id"], name: "index_events_on_religion_id"
  add_index "events", ["starts_on"], name: "index_events_on_starts_on"

  create_table "federal_states", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.string   "slug"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "federal_states", ["country_id"], name: "index_federal_states_on_country_id"
  add_index "federal_states", ["slug"], name: "index_federal_states_on_slug", unique: true

  create_table "months", force: :cascade do |t|
    t.integer  "value"
    t.integer  "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "months", ["value"], name: "index_months_on_value"
  add_index "months", ["year_id"], name: "index_months_on_year_id"

  create_table "religions", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "religions", ["slug"], name: "index_religions_on_slug", unique: true

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "city_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "street"
    t.string   "zip_code"
    t.string   "address_city_name"
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "email"
    t.string   "homepage"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "schools", ["city_id"], name: "index_schools_on_city_id"

  create_table "slots", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "slots", ["day_id"], name: "index_slots_on_day_id"
  add_index "slots", ["event_id"], name: "index_slots_on_event_id"

  create_table "years", force: :cascade do |t|
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "years", ["value"], name: "index_years_on_value", unique: true

end
