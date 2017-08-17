class AddMissingConstraints < ActiveRecord::Migration[4.2]
  def change
    change_column_null :departments, :name, false
    change_column_null :departments, :slug, false

    change_column_null :direct_assessments, :name, false
    change_column_null :direct_assessments, :description, false
    change_column_null :direct_assessments, :minimum_requirement, false
    change_column_null :direct_assessments, :target_percentage, false

    change_column_null :indirect_assessments, :name, false
    change_column_null :indirect_assessments, :description, false
    change_column_null :indirect_assessments, :minimum_requirement, false
    change_column_null :indirect_assessments, :target_percentage, false

    change_column_null :standard_outcomes, :name, false
    change_column_null :standard_outcomes, :description, false
  end
end
