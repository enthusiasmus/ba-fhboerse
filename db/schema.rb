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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111206180819) do

  create_table "apartments", :force => true do |t|
    t.decimal  "size"
    t.decimal  "price"
    t.boolean  "priceType"
    t.date     "begin_availability"
    t.date     "end_availability"
    t.integer  "amount_of_rooms"
    t.boolean  "kitchen"
    t.boolean  "furniture"
    t.boolean  "garage"
    t.boolean  "terrace"
    t.boolean  "garden"
    t.text     "transport_connection"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "creator"
    t.integer  "counter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "forename"
    t.string   "lastname"
    t.string   "email"
    t.integer  "telephone"
    t.boolean  "offer_or_quest"
  end

  create_table "drives", :force => true do |t|
    t.string   "departure_street"
    t.string   "departure_zipcode"
    t.string   "departure_city"
    t.string   "departure_country"
    t.datetime "departure_date"
    t.string   "destination_street"
    t.string   "destination_zipcode"
    t.string   "destination_city"
    t.string   "destination_country"
    t.datetime "destination_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "type"
  end

  create_table "items", :force => true do |t|
    t.datetime "time"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.boolean  "paid"
    t.decimal  "salary"
    t.string   "type"
    t.string   "company"
    t.date     "begindate"
    t.string   "place"
    t.text     "qualification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.decimal  "price"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "forename"
    t.string   "lastname"
  end

end
