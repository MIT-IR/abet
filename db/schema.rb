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

ActiveRecord::Schema.define(version: 20170509003455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alignments", force: :cascade do |t|
    t.integer  "outcome_id",          null: false
    t.integer  "standard_outcome_id", null: false
    t.string   "level",               null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["outcome_id", "standard_outcome_id"], name: "index_alignments_on_outcome_id_and_standard_outcome_id", unique: true, using: :btree
    t.index ["standard_outcome_id"], name: "index_alignments_on_standard_outcome_id", using: :btree
  end

  create_table "ar_internal_metadata", primary_key: "key", id: :string, force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "number",                          null: false
    t.string   "name",                            null: false
    t.integer  "department_id",                   null: false
    t.boolean  "has_custom_outcomes"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "outcomes_count",      default: 0, null: false
    t.index ["department_id"], name: "index_courses_on_department_id", using: :btree
    t.index ["number"], name: "index_courses_on_number", unique: true, using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number",     null: false
    t.index ["number"], name: "index_departments_on_number", unique: true, using: :btree
    t.index ["slug"], name: "index_departments_on_slug", unique: true, using: :btree
  end

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
    t.integer  "results_count",       default: 0,     null: false
    t.index ["archived"], name: "index_direct_assessments_on_archived", using: :btree
    t.index ["subject_id"], name: "index_direct_assessments_on_subject_id", using: :btree
  end

  create_table "outcome_assessments", force: :cascade do |t|
    t.integer  "outcome_id",    null: false
    t.integer  "assessment_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assessment_id"], name: "index_outcome_assessments_on_assessment_id", using: :btree
    t.index ["outcome_id"], name: "index_outcome_assessments_on_outcome_id", using: :btree
  end

  create_table "outcomes", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "description",                   null: false
    t.integer  "course_id",                     null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "assessments_count", default: 0, null: false
    t.index ["course_id", "name"], name: "index_outcomes_on_course_id_and_name", unique: true, using: :btree
  end

  create_table "results", force: :cascade do |t|
    t.integer  "assessment_id",          null: false
    t.string   "assessment_name",        null: false
    t.string   "assessment_description", null: false
    t.string   "problem_description"
    t.integer  "percentage",             null: false
    t.integer  "year",                   null: false
    t.string   "semester"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "department_id"
    t.index ["assessment_id", "year", "semester"], name: "index_results_on_assessment_id_and_year_and_semester", unique: true, using: :btree
  end

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
    t.index ["department_number"], name: "index_subjects_on_department_number", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
    t.index ["item_type"], name: "index_versions_on_item_type", using: :btree
  end

  add_foreign_key "alignments", "outcomes"
  add_foreign_key "alignments", "standard_outcomes"
  add_foreign_key "courses", "departments", on_delete: :restrict
  add_foreign_key "direct_assessments", "subjects"
  add_foreign_key "outcome_assessments", "direct_assessments", column: "assessment_id"
  add_foreign_key "outcomes", "courses"
  add_foreign_key "results", "direct_assessments", column: "assessment_id"

  create_view :assessment_reports,  sql_definition: <<-SQL
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

  create_view :outcomes_with_metadata,  sql_definition: <<-SQL
      SELECT outcomes.id,
      outcomes.name,
      outcomes.description,
      outcomes.course_id,
      outcomes.created_at,
      outcomes.updated_at,
      outcomes.assessments_count,
      COALESCE(active_direct_assessments.count, (0)::bigint) AS active_assessments_count,
      COALESCE(active_direct_assessments_with_results.count, (0)::bigint) AS active_assessments_with_results_count
     FROM ((outcomes
       LEFT JOIN ( SELECT outcome_assessments.outcome_id,
              count(*) AS count
             FROM (outcome_assessments
               JOIN direct_assessments ON ((direct_assessments.id = outcome_assessments.assessment_id)))
            WHERE (direct_assessments.archived = false)
            GROUP BY outcome_assessments.outcome_id) active_direct_assessments ON ((outcomes.id = active_direct_assessments.outcome_id)))
       LEFT JOIN ( SELECT outcome_assessments.outcome_id,
              count(*) AS count
             FROM (outcome_assessments
               JOIN direct_assessments ON ((direct_assessments.id = outcome_assessments.assessment_id)))
            WHERE ((direct_assessments.archived = false) AND (direct_assessments.results_count > 0))
            GROUP BY outcome_assessments.outcome_id) active_direct_assessments_with_results ON ((outcomes.id = active_direct_assessments_with_results.outcome_id)));
  SQL

end
