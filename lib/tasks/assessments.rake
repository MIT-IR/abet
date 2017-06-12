namespace :assessments do
  desc "Migrate assessments to assignments"
  task migrate: :environment do
    ActiveRecord::Base.transaction do
      Assessment.find_each do |assessment|
        puts "Migrating assessment: #{assessment.id}"

        coverage = Coverage.find_or_initialize_by(
          course_id: assessment.courses.first.id,
          subject_id: assessment.subject_id
        )

        coverage.outcomes << (assessment.outcomes - coverage.outcomes)
        coverage.save!

        coverage.outcome_coverages.each do |outcome_coverage|
          assignment = Assignment.create!(
            name: assessment.name,
            problem: assessment.problem_description,
            outcome_coverage_id: outcome_coverage.id,
          )

          assessment.results.update_all(assignment_id: assignment.id)
        end
      end

      Coverage.includes(:outcome_coverages).find_each do |coverage|
        if coverage.outcome_coverages.all?(&:archived?)
          coverage.update(archived: true)
        end
      end
    end
  end
end
