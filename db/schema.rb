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

ActiveRecord::Schema.define(version: 2018_11_06_043440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.bigint "publishers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publishers_id"], name: "index_books_on_publishers_id"
  end

  create_table "distributions", force: :cascade do |t|
    t.bigint "books_id"
    t.bigint "shops_id"
    t.integer "copies_in_stock", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["books_id"], name: "index_distributions_on_books_id"
    t.index ["shops_id"], name: "index_distributions_on_shops_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.integer "books_sold_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "publishers", column: "publishers_id"
  add_foreign_key "distributions", "books", column: "books_id"
  add_foreign_key "distributions", "shops", column: "shops_id"
end
