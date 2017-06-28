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

ActiveRecord::Schema.define(version: 20170628173632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alignments", force: :cascade do |t|
    t.bigint "outcome_id", null: false
    t.bigint "standard_outcome_id", null: false
    t.string "level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["outcome_id", "standard_outcome_id"], name: "index_alignments_on_outcome_id_and_standard_outcome_id", unique: true
    t.index ["standard_outcome_id"], name: "index_alignments_on_standard_outcome_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "problem_description"
    t.string "minimum_requirement", null: false
    t.integer "target_percentage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id", null: false
    t.boolean "archived", default: false
    t.integer "results_count", default: 0, null: false
    t.index ["archived"], name: "index_assessments_on_archived"
    t.index ["subject_id"], name: "index_assessments_on_subject_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "outcome_coverage_id", null: false
    t.string "name", null: false
    t.string "problem"
    t.index ["outcome_coverage_id"], name: "index_assignments_on_outcome_coverage_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "file_file_name", null: false
    t.string "file_content_type", null: false
    t.integer "file_file_size", null: false
    t.datetime "file_updated_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "attachable_id", null: false
    t.string "attachable_type", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.bigint "department_id", null: false
    t.boolean "has_custom_outcomes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "outcomes_count", default: 0, null: false
    t.index ["department_id"], name: "index_courses_on_department_id"
    t.index ["number"], name: "index_courses_on_number", unique: true
  end

  create_table "coverages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id", null: false
    t.bigint "subject_id", null: false
    t.boolean "archived", default: false, null: false
    t.index ["course_id", "subject_id"], name: "index_coverages_on_course_id_and_subject_id", unique: true, where: "(archived IS FALSE)"
    t.index ["subject_id"], name: "index_coverages_on_subject_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number", null: false
    t.index ["number"], name: "index_departments_on_number", unique: true
    t.index ["slug"], name: "index_departments_on_slug", unique: true
  end

  create_table "outcome_assessments", force: :cascade do |t|
    t.bigint "outcome_id", null: false
    t.bigint "assessment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_outcome_assessments_on_assessment_id"
    t.index ["outcome_id"], name: "index_outcome_assessments_on_outcome_id"
  end

  create_table "outcome_coverages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coverage_id", null: false
    t.bigint "outcome_id", null: false
    t.boolean "archived", default: false, null: false
    t.index ["coverage_id", "outcome_id"], name: "index_outcome_coverages_on_coverage_id_and_outcome_id", unique: true, where: "(archived IS FALSE)"
    t.index ["coverage_id"], name: "index_outcome_coverages_on_coverage_id"
    t.index ["outcome_id"], name: "index_outcome_coverages_on_outcome_id"
  end

  create_table "outcomes", force: :cascade do |t|
    t.string "label", limit: 5, null: false
    t.string "description", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assessments_count", default: 0, null: false
    t.string "nickname", null: false
    t.index ["course_id", "label"], name: "index_outcomes_on_course_id_and_label", unique: true
    t.index ["course_id", "nickname"], name: "index_outcomes_on_course_id_and_nickname", unique: true
  end

  create_table "results", force: :cascade do |t|
    t.bigint "assessment_id"
    t.string "assessment_name"
    t.string "assessment_description"
    t.string "problem_description"
    t.integer "percentage", null: false
    t.integer "year", null: false
    t.string "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.bigint "assignment_id", null: false
    t.index ["assessment_id", "year", "semester"], name: "index_results_on_assessment_id_and_year_and_semester", unique: true
    t.index ["assignment_id", "year", "semester"], name: "index_results_on_assignment_id_and_year_and_semester", unique: true
    t.index ["assignment_id"], name: "index_results_on_assignment_id"
  end

  create_table "standard_outcomes", force: :cascade do |t|
    t.string "label", limit: 5, null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.index ["nickname"], name: "index_standard_outcomes_on_nickname", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "number", null: false
    t.string "title", null: false
    t.integer "department_number", null: false
    t.index ["department_number"], name: "index_subjects_on_department_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["item_type"], name: "index_versions_on_item_type"
  end

  add_foreign_key "alignments", "outcomes"
  add_foreign_key "alignments", "standard_outcomes"
  add_foreign_key "assessments", "subjects"
  add_foreign_key "assignments", "outcome_coverages"
  add_foreign_key "courses", "departments", on_delete: :restrict
  add_foreign_key "coverages", "courses"
  add_foreign_key "coverages", "subjects"
  add_foreign_key "outcome_assessments", "assessments"
  add_foreign_key "outcome_coverages", "coverages", on_delete: :cascade
  add_foreign_key "outcome_coverages", "outcomes"
  add_foreign_key "outcomes", "courses"
  add_foreign_key "results", "assessments"
  add_foreign_key "results", "assignments"

  create_view "assignment_reports",  sql_definition: <<-SQL
      SELECT outcomes.course_id,
      outcomes.label AS outcome_label,
      outcomes.description AS outcome_description,
      outcomes.nickname AS outcome_nickname,
      assignments.id AS assignment_id,
      assignments.name AS assignment_name,
      assignments.problem AS assignment_problem,
      results.percentage AS actual_percentage,
      results.year,
      results.semester,
      subjects.number AS subject_number,
      subjects.title AS subject_title
     FROM (((((results
       JOIN assignments ON ((assignments.id = results.assignment_id)))
       JOIN outcome_coverages ON ((outcome_coverages.id = assignments.outcome_coverage_id)))
       JOIN coverages ON ((coverages.id = outcome_coverages.coverage_id)))
       JOIN subjects ON ((subjects.id = coverages.subject_id)))
       JOIN outcomes ON ((outcomes.id = outcome_coverages.outcome_id)))
    ORDER BY outcomes.label, results.year DESC, results.semester DESC;
  SQL

  create_view "activities",  sql_definition: <<-SQL
      SELECT versions.id,
      versions.item_type,
      versions.item_id,
      versions.event,
      versions.whodunnit AS user_id,
      departments.id AS department_id,
      versions.created_at
     FROM ((versions
       JOIN results ON ((versions.item_id = results.id)))
       JOIN departments ON ((results.department_id = departments.id)))
    WHERE ((versions.item_type)::text = 'Result'::text)
  UNION ALL
   SELECT versions.id,
      versions.item_type,
      versions.item_id,
      versions.event,
      versions.whodunnit AS user_id,
      departments.id AS department_id,
      versions.created_at
     FROM (((((versions
       JOIN assignments ON ((versions.item_id = assignments.id)))
       JOIN outcome_coverages ON ((assignments.outcome_coverage_id = outcome_coverages.id)))
       JOIN coverages ON ((outcome_coverages.coverage_id = coverages.id)))
       JOIN courses ON ((coverages.course_id = courses.id)))
       JOIN departments ON ((courses.department_id = departments.id)))
    WHERE ((versions.item_type)::text = 'Assignment'::text)
  UNION ALL
   SELECT versions.id,
      versions.item_type,
      versions.item_id,
      versions.event,
      versions.whodunnit AS user_id,
      departments.id AS department_id,
      versions.created_at
     FROM ((((versions
       JOIN outcome_coverages ON ((versions.item_id = outcome_coverages.id)))
       JOIN coverages ON ((outcome_coverages.coverage_id = coverages.id)))
       JOIN courses ON ((coverages.course_id = courses.id)))
       JOIN departments ON ((courses.department_id = departments.id)))
    WHERE ((versions.item_type)::text = 'OutcomeCoverage'::text);
  SQL

end
