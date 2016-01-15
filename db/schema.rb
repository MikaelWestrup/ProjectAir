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

ActiveRecord::Schema.define(version: 20160115051252) do

  create_table "audit_items", force: :cascade do |t|
    t.integer  "audit_id",     limit: 4
    t.integer  "paragraph_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "audit_types", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.boolean  "is_parent",                default: false
    t.integer  "main_type_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "audits", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "audit_type_id", limit: 4
    t.datetime "period_start"
    t.datetime "period_end"
    t.string   "planner",       limit: 255
    t.integer  "location_id",   limit: 4
    t.integer  "interval",      limit: 4
    t.integer  "auditor_id",    limit: 4
    t.integer  "auditee_id",    limit: 4
    t.text     "notes",         limit: 65535
    t.boolean  "reoccuring",                  default: false
    t.boolean  "onside",                      default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.text     "name",          limit: 65535
    t.string   "ctype",         limit: 255
    t.string   "annex",         limit: 255
    t.string   "code",          limit: 255
    t.integer  "regulation_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "address",             limit: 65535
    t.string   "office_phone",        limit: 255
    t.string   "cell_phone",          limit: 255
    t.string   "email",               limit: 255
    t.string   "role",                limit: 255
    t.integer  "company_id",          limit: 4
    t.integer  "department_id",       limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "fine_tunes", force: :cascade do |t|
    t.date     "ddate"
    t.time     "start_hour"
    t.time     "end_hour"
    t.text     "notes",        limit: 65535
    t.integer  "audit_id",     limit: 4
    t.integer  "paragraph_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "country",            limit: 255
    t.string   "airport",            limit: 255
    t.text     "address",            limit: 65535
    t.string   "zipcode",            limit: 255
    t.string   "town",               limit: 255
    t.text     "additional_details", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "paragraph_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "paragraphs", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.string   "number",                    limit: 255
    t.text     "description",               limit: 65535
    t.text     "up_to_including_amendment", limit: 65535
    t.integer  "paragraph_type_id",         limit: 4
    t.integer  "chapter_id",                limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "regulations", force: :cascade do |t|
    t.text     "name",         limit: 65535
    t.string   "organization", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
