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

ActiveRecord::Schema.define(:version => 20121106164409) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lense_types", :force => true do |t|
    t.string   "lense_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lenses", :force => true do |t|
    t.integer  "brand_id"
    t.float    "max_aperture"
    t.float    "min_aperture"
    t.integer  "max_focal_length"
    t.integer  "min_focal_length"
    t.string   "name"
    t.string   "notes"
    t.string   "lense_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
