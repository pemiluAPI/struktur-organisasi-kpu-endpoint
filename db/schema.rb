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

ActiveRecord::Schema.define(version: 20151203055838) do

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

  create_table "divisions", force: true do |t|
    t.string   "nama_bagian"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divsubdivisions", force: true do |t|
    t.integer  "bagian_id"
    t.integer  "subbagian_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "divsubdivisions", ["bagian_id"], name: "index_divsubdivisions_on_bagian_id", using: :btree
  add_index "divsubdivisions", ["subbagian_id"], name: "index_divsubdivisions_on_subbagian_id", using: :btree

  create_table "personils", force: true do |t|
    t.integer  "struktur_id"
    t.integer  "jabatan_id"
    t.string   "nama"
    t.string   "golongan"
    t.string   "no_induk"
    t.integer  "bagian_subbagian_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personils", ["bagian_subbagian_id"], name: "index_personils_on_bagian_subbagian_id", using: :btree
  add_index "personils", ["jabatan_id"], name: "index_personils_on_jabatan_id", using: :btree
  add_index "personils", ["struktur_id"], name: "index_personils_on_struktur_id", using: :btree

  create_table "positions", force: true do |t|
    t.string   "nama_jabatan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sos", force: true do |t|
    t.string   "nama_so"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subdivisions", force: true do |t|
    t.string   "nama_subbagian"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
