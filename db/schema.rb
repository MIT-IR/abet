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

ActiveRecord::Schema.define(version: 20140515182740) do

  create_table "assessments", force: true do |t|
    t.string   "assess_type"
    t.integer  "outcome_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assessments", ["outcome_id"], name: "index_assessments_on_outcome_id"

  create_table "contacts", force: true do |t|
    t.string   "krbname",       null: false
    t.string   "email",         null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "position"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["department_id"], name: "index_contacts_on_department_id"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "contact_id"
    t.boolean  "abet_accredited", default: true
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["contact_id"], name: "index_courses_on_contact_id"

  create_table "data_entries", force: true do |t|
    t.integer  "measure_id"
    t.string   "semester"
    t.integer  "contact_id"
    t.integer  "actual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_entries", ["contact_id"], name: "index_data_entries_on_contact_id"
  add_index "data_entries", ["measure_id"], name: "index_data_entries_on_measure_id"

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measures", force: true do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.text     "description"
    t.integer  "lower_bound"
    t.integer  "maximum"
    t.integer  "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measures", ["subject_id"], name: "index_measures_on_subject_id"

  create_table "outcomes", force: true do |t|
    t.string   "outcome"
    t.text     "description"
    t.integer  "course_id"
    t.string   "commission",  default: "EAC"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "outcomes", ["course_id"], name: "index_outcomes_on_course_id"

  create_table "subject_instructors", force: true do |t|
    t.integer  "subject_id"
    t.integer  "contact_id"
    t.string   "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_instructors", ["subject_id", "contact_id"], name: "index_subject_instructors_on_subject_id_and_contact_id"

  create_table "subjects", force: true do |t|
    t.string   "number",        null: false
    t.string   "name"
    t.integer  "assessment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["assessment_id"], name: "index_subjects_on_assessment_id"

end
