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

ActiveRecord::Schema.define(version: 20150701163739) do

  create_table "academic_details", force: :cascade do |t|
    t.string   "course",                limit: 255
    t.text     "institution",           limit: 65535
    t.string   "examination_authority", limit: 255
    t.float    "percentage",            limit: 24
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id",               limit: 4
    t.string   "pass_year",             limit: 255
  end

  create_table "college_profiles", force: :cascade do |t|
    t.string   "level",      limit: 255
    t.string   "degree",     limit: 255
    t.string   "branch",     limit: 255
    t.string   "college",    limit: 255
    t.integer  "semester",   limit: 4
    t.float    "cgpa",       limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "companies", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "visting"
    t.text     "profile",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "starts_at"
  end

  create_table "extra_activities", force: :cascade do |t|
    t.text     "area_of_interest", limit: 65535
    t.text     "extra_curricular", limit: 65535
    t.text     "hobby",            limit: 65535
    t.text     "responsibilty",    limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id",          limit: 4
    t.boolean  "arrears",          limit: 1
    t.integer  "current",          limit: 4
    t.integer  "history",          limit: 4
    t.text     "electives",        limit: 65535
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "personal_profiles", force: :cascade do |t|
    t.string   "gender",              limit: 255
    t.date     "dob"
    t.integer  "age",                 limit: 4
    t.integer  "height",              limit: 4
    t.integer  "weight",              limit: 4
    t.text     "guardian_name",       limit: 65535
    t.text     "guardian_occupation", limit: 65535
    t.string   "nationality",         limit: 255
    t.string   "mother_tongue",       limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id",             limit: 4
    t.text     "current_address",     limit: 65535
    t.text     "permanent_address",   limit: 65535
    t.string   "communicate",         limit: 255
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "desc",       limit: 65535
    t.text     "technology", limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "semester_marks", force: :cascade do |t|
    t.integer  "semester",   limit: 4
    t.float    "gpa",        limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.string   "pass_year",  limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registerno",             limit: 10
    t.text     "name",                   limit: 65535
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmation_sent_at"
    t.datetime "confirmed_at"
    t.string   "phone",                  limit: 10
    t.text     "pic",                    limit: 65535
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "workstatuses", force: :cascade do |t|
    t.string   "numrange",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "filename",   limit: 65535
    t.string   "status",     limit: 255
  end

end
