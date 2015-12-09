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

ActiveRecord::Schema.define(version: 20151208221025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alignments", force: :cascade do |t|
    t.integer  "outcome_id",          null: false
    t.integer  "standard_outcome_id", null: false
    t.string   "level",               null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "alignments", ["outcome_id", "standard_outcome_id"], name: "index_alignments_on_outcome_id_and_standard_outcome_id", unique: true, using: :btree
  add_index "alignments", ["standard_outcome_id"], name: "index_alignments_on_standard_outcome_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "number",                          null: false
    t.string   "name",                            null: false
    t.integer  "department_id",                   null: false
    t.boolean  "has_custom_outcomes"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "outcomes_count",      default: 0, null: false
  end

  add_index "courses", ["department_id"], name: "index_courses_on_department_id", using: :btree
  add_index "courses", ["number"], name: "index_courses_on_number", unique: true, using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number",     null: false
  end

  add_index "departments", ["number"], name: "index_departments_on_number", unique: true, using: :btree
  add_index "departments", ["slug"], name: "index_departments_on_slug", unique: true, using: :btree

  create_table "direct_assessments", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "description",                         null: false
    t.string   "problem_description"
    t.string   "minimum_requirement",                 null: false
    t.integer  "target_percentage",                   null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "subject_id",                          null: false
    t.boolean  "archived",            default: false
  end

  add_index "direct_assessments", ["archived"], name: "index_direct_assessments_on_archived", using: :btree
  add_index "direct_assessments", ["subject_id"], name: "index_direct_assessments_on_subject_id", using: :btree

  create_table "indirect_assessments", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "description",                         null: false
    t.string   "survey_question"
    t.string   "minimum_requirement",                 null: false
    t.integer  "target_percentage",                   null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type",                                null: false
    t.boolean  "archived",            default: false
  end

  add_index "indirect_assessments", ["archived"], name: "index_indirect_assessments_on_archived", using: :btree

  create_table "outcome_assessments", force: :cascade do |t|
    t.integer  "outcome_id",      null: false
    t.integer  "assessment_id",   null: false
    t.string   "assessment_type", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "outcome_assessments", ["assessment_type", "assessment_id"], name: "index_outcome_assessments_on_assessment_type_and_assessment_id", using: :btree
  add_index "outcome_assessments", ["outcome_id"], name: "index_outcome_assessments_on_outcome_id", using: :btree

  create_table "outcomes", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "description",                   null: false
    t.integer  "course_id",                     null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "assessments_count", default: 0, null: false
  end

  add_index "outcomes", ["course_id", "name"], name: "index_outcomes_on_course_id_and_name", unique: true, using: :btree

  create_table "results", force: :cascade do |t|
    t.integer  "assessment_id",          null: false
    t.string   "assessment_type",        null: false
    t.string   "assessment_name",        null: false
    t.string   "assessment_description", null: false
    t.string   "problem_description"
    t.integer  "percentage",             null: false
    t.integer  "year",                   null: false
    t.string   "semester"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "results", ["assessment_id", "assessment_type", "year", "semester"], name: "index_results_on_assessment_and_year_and_semester", unique: true, using: :btree

  create_table "standard_outcomes", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string  "number",            null: false
    t.string  "title",             null: false
    t.integer "department_number", null: false
  end

  add_index "subjects", ["department_number"], name: "index_subjects_on_department_number", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "alignments", "outcomes"
  add_foreign_key "alignments", "standard_outcomes"
  add_foreign_key "courses", "departments", on_delete: :restrict
  add_foreign_key "direct_assessments", "subjects"
  add_foreign_key "outcomes", "courses"
      create_view :assessment_reports, sql_definition:<<-SQL
        SELECT outcomes.course_id,
  outcomes.name AS outcome_name,
  outcomes.description AS outcome_description,
  direct_assessments.id AS direct_assessment_id,
  direct_assessments.name AS direct_assessment_name,
  direct_assessments.description AS direct_assessment_description,
  direct_assessments.minimum_requirement,
  direct_assessments.target_percentage,
  results.percentage AS actual_percentage,
  results.year,
  results.semester,
  subjects.number AS subject_number,
  subjects.title AS subject_title
 FROM ((((results
   JOIN direct_assessments ON ((direct_assessments.id = results.assessment_id)))
   JOIN subjects ON ((subjects.id = direct_assessments.subject_id)))
   JOIN outcome_assessments ON ((outcome_assessments.assessment_id = direct_assessments.id)))
   JOIN outcomes ON ((outcomes.id = outcome_assessments.outcome_id)))
ORDER BY outcomes.name, results.year DESC, results.semester DESC;
      SQL

end
