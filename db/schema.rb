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

ActiveRecord::Schema.define(version: 20140728231713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parents", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "acceptsmarketing"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
  end

  add_index "parents", ["student_id"], name: "index_parents_on_student_id", using: :btree

  create_table "payments", force: true do |t|
    t.integer  "student_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["parent_id"], name: "index_payments_on_parent_id", using: :btree
  add_index "payments", ["student_id"], name: "index_payments_on_student_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "POC"
    t.string   "title"
    t.string   "email"
    t.string   "phone"
  end

  create_table "students", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender"
    t.datetime "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.integer  "parent_id"
    t.string   "wearsglasses"
    t.string   "classroomdescription"
    t.string   "classroomtime"
    t.string   "classroomdaymonday"
    t.string   "classroomdaytuesday"
    t.string   "classroomdaywednesday"
    t.string   "classroomdaythursday"
    t.string   "classroomdayfriday"
    t.integer  "payment_id"
  end

  add_index "students", ["payment_id"], name: "index_students_on_payment_id", using: :btree
  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

end
