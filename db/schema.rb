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

ActiveRecord::Schema.define(:version => 20120218100922) do

  create_table "lookups", :force => true do |t|
    t.string   "domain"
    t.string   "ip"
    t.float    "trust"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vote"
  end

  add_index "lookups", ["domain"], :name => "index_lookups_on_domain"

  create_table "requested_domains", :force => true do |t|
    t.string   "domain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staged_records", :force => true do |t|
    t.string "domain"
    t.string "answered_by"
    t.string "ip"
    t.float  "trust"
  end

  add_index "staged_records", ["domain", "answered_by"], :name => "index_staged_records_on_domain_and_answered_by", :unique => true

end
