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

ActiveRecord::Schema.define(:version => 20120610004806) do

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "contact_info"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "records", :force => true do |t|
    t.string   "source_ip"
    t.integer  "count"
    t.text     "auth_results"
    t.text     "policy_evaluated"
    t.text     "identifiers"
    t.integer  "report_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "report_id"
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.string   "dkim_alignment_mode"
    t.string   "spf_alignment_mode"
    t.string   "requested_domain_handling_policy"
    t.string   "requested_subdomain_handling_policy"
    t.string   "sampling_rate"
    t.string   "domain"
    t.integer  "provider_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
