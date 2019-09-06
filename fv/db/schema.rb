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

ActiveRecord::Schema.define(version: 2019_08_25_041338) do

  create_table "markets", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.float "current_price"
    t.integer "fair_value"
    t.integer "discount_value"
    t.integer "YTD_change"
    t.datetime "updated_at", null: false
    t.integer "revenue"
    t.integer "grossprofit"
    t.float "profitmargin"
    t.float "roa"
    t.float "roe"
    t.float "eps"
    t.float "ebitda"
    t.float "priceratio"
    t.float "pricebook"
    t.integer "marketcap"
    t.float "wallst"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "market_id"
    t.string "compsymb"
    t.datetime "datetime"
    t.float "stock_price"
  end

end
