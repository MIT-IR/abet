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

ActiveRecord::Schema.define(version: 20150602184917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string  "course_number"
    t.string  "course_name"
    t.integer "department_id"
    t.boolean "has_custom_outcomes"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "role_department"
  end

  create_table "direct_assessments", force: :cascade do |t|
    t.string  "subject_number"
    t.string  "subject_description"
    t.string  "semester"
    t.string  "assignment_name"
    t.string  "assignment_description"
    t.string  "problem_description"
    t.string  "minimum_grade"
    t.integer "target_percentage"
    t.integer "actual_percentage"
    t.integer "outcome_id"
  end

  create_table "indirect_assessments", force: :cascade do |t|
    t.string  "assessment_name"
    t.string  "assessment_description"
    t.string  "survey_question"
    t.integer "year"
    t.string  "minimum_category"
    t.integer "target_percentage"
    t.integer "actual_percentage"
    t.integer "outcome_id"
  end

  create_table "outcome_alignments", force: :cascade do |t|
    t.integer "outcome_id"
    t.integer "standard_outcome_id"
    t.string  "alignment_level"
  end

  create_table "outcomes", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "course_id"
    t.integer "standard_outcome_id"
  end

  create_table "standard_outcomes", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
