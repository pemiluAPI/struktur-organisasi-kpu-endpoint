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

ActiveRecord::Schema.define(version: 20151120065124) do

  create_table "commisioner_structure_lists", force: true do |t|
    t.string   "name"
    t.string   "period_start"
    t.string   "period_finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commisioner_structures", force: true do |t|
    t.integer  "commisioner_structure_list_id"
    t.string   "position"
    t.string   "name"
    t.string   "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commisioner_structures", ["commisioner_structure_list_id"], name: "index_commisioner_structures_on_commisioner_structure_list_id", using: :btree

end
