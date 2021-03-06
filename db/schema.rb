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

ActiveRecord::Schema.define(version: 20150129164050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.string   "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", force: true do |t|
    t.integer  "sender"
    t.integer  "receiver"
    t.boolean  "read",       default: false
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", force: true do |t|
    t.integer  "staff_id"
    t.boolean  "presence"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "parent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", force: true do |t|
    t.integer  "staff_id"
    t.string   "registration_no"
    t.datetime "confirm_date"
    t.string   "guarantor_name"
    t.string   "guarantor_dept"
    t.string   "amount"
    t.string   "purpose"
    t.boolean  "approval"
    t.boolean  "paid",              default: false
    t.string   "monthly_deduction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences", force: true do |t|
    t.string   "company"
    t.string   "website"
    t.string   "theme"
    t.string   "header"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reliefs", force: true do |t|
    t.datetime "date"
    t.string   "category"
    t.integer  "staff_id"
    t.string   "reason"
    t.time     "time_out"
    t.time     "time_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sabbaticals", force: true do |t|
    t.integer  "staff_id"
    t.string   "category"
    t.string   "registration_no"
    t.string   "duration"
    t.datetime "commence_date"
    t.datetime "resume_date"
    t.string   "reason"
    t.string   "encashment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", force: true do |t|
    t.string   "title"
    t.string   "surname"
    t.string   "othernames"
    t.string   "maiden_name"
    t.string   "gender"
    t.string   "avatar"
    t.string   "date_of_birth"
    t.string   "marital_status"
    t.string   "spouse"
    t.string   "first_child"
    t.string   "phone"
    t.string   "email"
    t.string   "department"
    t.string   "designation"
    t.string   "staff_from"
    t.string   "staff_till"
    t.string   "prev_employer"
    t.string   "post_held"
    t.string   "duty_years"
    t.string   "state"
    t.string   "nationality"
    t.string   "town"
    t.string   "city"
    t.string   "family_address"
    t.string   "permanent_address"
    t.string   "residence"
    t.string   "kin"
    t.string   "kin_phone"
    t.string   "kin_address"
    t.string   "annual_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "role"
    t.string   "email"
    t.string   "avatar"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
