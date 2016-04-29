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

ActiveRecord::Schema.define(version: 20151231094533) do

  create_table "items", force: :cascade do |t|
    t.string   "itemNumber"
    t.string   "imgURL"
    t.string   "itemName"
    t.text     "itemDescription"
    t.text     "itemDetail"
    t.string   "modelSizeA"
    t.string   "modelSizeB"
    t.string   "totalItemsNameA"
    t.string   "totalItemsURLA"
    t.string   "totalItemsNameB"
    t.string   "totalItemsURLB"
    t.string   "totalItemsNameC"
    t.string   "totalItemsURLC"
    t.string   "size00"
    t.string   "size01"
    t.string   "size02"
    t.string   "size03"
    t.string   "size04"
    t.string   "size05"
    t.string   "size06"
    t.string   "size07"
    t.string   "size10"
    t.string   "size11"
    t.string   "size12"
    t.string   "size13"
    t.string   "size14"
    t.string   "size15"
    t.string   "size16"
    t.string   "size17"
    t.text     "material"
    t.string   "madein"
    t.text     "process"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
