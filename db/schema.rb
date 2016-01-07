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

ActiveRecord::Schema.define(version: 20160107074722) do

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
